#!/bin/bash

#=================================================
# PACKAGE UPDATING HELPER
#=================================================

# This script is meant to be run by GitHub Actions
# The YunoHost-Apps organisation offers a template Action to run this script periodically
# Since each app is different, maintainers can adapt its contents so as to perform
# automatic actions when a new upstream release is detected.

#=================================================
# FETCHING LATEST RELEASE AND ITS ASSETS
#=================================================

# Fetching information
current_version=$(cat manifest.json | jq -j '.version|split("~")[0]')
repo=$(cat manifest.json | jq -j '.upstream.code|split("https://github.com/")[1]')
commit=""
id=0
while [[ -z $commit && $id -le 29 ]]
do
	commit=$(curl --silent "https://api.github.com/repos/$repo/commits"  | jq -r ".[$id] | .sha" )
	tags=$(git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' https://github.com/standardnotes/server.git | grep $commit)

	if [[ -z $tags || $tags == *"alpha"* ]]; then
		commit=""
	fi
	let id++
done

if [ -z $commit ]; then
	echo "::warning ::No new version found.."
	exit 0
fi

version=$(curl --silent "https://api.github.com/repos/$repo/commits/$commit" | jq -r '.commit.committer.date' | sed 's/T.*$//g' | sed 's/-/./g')
api_gateway_online_version=$(curl --silent "https://raw.githubusercontent.com/$repo/$commit/packages/api-gateway/package.json" | jq -j '.version')
auth_online_version=$(curl --silent "https://raw.githubusercontent.com/$repo/$commit/packages/auth/package.json" | jq -j '.version')
files_online_version=$(curl --silent "https://raw.githubusercontent.com/$repo/$commit/packages/files/package.json" | jq -j '.version')
ss_online_version=$(curl --silent "https://raw.githubusercontent.com/$repo/$commit/packages/syncing-server/package.json" | jq -j '.version')

# Setting up the environment variables
echo "Current version: $current_version"
echo "Latest release from upstream: $version"
echo "API-Gateway: $api_gateway_online_version"
echo "Auth: $auth_online_version"
echo "Files: $files_online_version"
echo "Syncing-Server: $ss_online_version"

echo "VERSION=$version" >> $GITHUB_ENV
echo "VERSION_CURRENT=$current_version" >> $GITHUB_ENV
echo "VERSION_API=$api_gateway_online_version" >> $GITHUB_ENV
echo "VERSION_AUTH=$auth_online_version" >> $GITHUB_ENV
echo "VERSION_FILES=$files_online_version" >> $GITHUB_ENV
echo "VERSION_SS=$ss_online_version" >> $GITHUB_ENV

# For the time being, let's assume the script will fail
echo "PROCEED=false" >> $GITHUB_ENV

# Proceed only if the retrieved version is greater than the current one
if [[ "$current_version" == "$version" ]]; then
	echo "::warning ::No new version available"
	exit 0
# Proceed only if a PR for this new version does not already exist
elif git ls-remote -q --exit-code --heads https://github.com/$GITHUB_REPOSITORY.git ci-auto-update-v$version ; then
	echo "::warning ::A branch already exists for this update"
	exit 0
fi

asset="https://github.com/$repo/archive/$commit.tar.gz"

#=================================================
# UPDATE SOURCE FILES
#=================================================

# Create the temporary directory
tempdir="$(mktemp -d)"

# Download sources and calculate checksum
filename=${asset##*/}
curl --silent -4 -L $asset -o "$tempdir/$filename"
checksum=$(sha256sum "$tempdir/$filename" | head -c 64)

# Delete temporary directory
rm -rf $tempdir

# Rewrite source file
cat <<EOT > conf/app.src
SOURCE_URL=$asset
SOURCE_SUM=$checksum
SOURCE_SUM_PRG=sha256sum
SOURCE_FORMAT=tar.gz
SOURCE_IN_SUBDIR=true
SOURCE_FILENAME=
SOURCE_EXTRACT=true
EOT
echo "... conf/app.src updated"

#=================================================
# SPECIFIC UPDATE STEPS
#=================================================

# Any action on the app's source code can be done.
# The GitHub Action workflow takes care of committing all changes after this script ends.

#=================================================
# GENERIC FINALIZATION
#=================================================

# Replace new version in manifest
echo "$(jq -s --indent 4 ".[] | .version = \"$version~ynh1\"" manifest.json)" > manifest.json

# No need to update the README, yunohost-bot takes care of it

# The Action will proceed only if the PROCEED environment variable is set to true
echo "PROCEED=true" >> $GITHUB_ENV
exit 0
