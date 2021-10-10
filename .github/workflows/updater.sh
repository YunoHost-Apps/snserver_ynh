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
# Current versions are defined in _common.sh
source scripts/_common.sh
current_version=$(cat manifest.json | jq -j '.version|split("~")[0]')
repo=$(cat manifest.json | jq -j '.upstream.code|split("https://github.com/")[1]')
repo_ssjs="standardnotes/syncing-server-js"
repo_auth="standardnotes/auth"
repo_api="standardnotes/api-gateway"
ssjs_online_version=$(curl --silent "https://raw.githubusercontent.com/standardnotes/standalone/main/docker-compose.yml" | grep -Po 'standardnotes\/syncing-server-js:\K.*$' | head -n 1 )
auth_online_version=$(curl --silent "https://raw.githubusercontent.com/standardnotes/standalone/main/docker-compose.yml" | grep -Po 'standardnotes\/auth:\K.*$' | head -n 1 )
api_online_version=$(curl --silent "https://raw.githubusercontent.com/standardnotes/standalone/main/docker-compose.yml" | grep -Po 'standardnotes\/api-gateway:\K.*$' | head -n 1 )

version=$(date +%Y.%m.%d)

# Setting up the environment variables
echo "Current version: $current_version"
echo "Syncing-Server-JS: $syncing_server_js_version"
echo "Auth: $auth_version"
echo "API-Gateway: $api_gateway_version"
echo ""
echo "Latest release from upstream:"
echo "Syncing-Server-JS: $ssjs_online_version"
echo "Auth: $auth_online_version"
echo "API-Gateway: $api_online_version"

echo "VERSION=$version" >> $GITHUB_ENV
echo "VERSION_SSJS=$syncing_server_js_version" >> $GITHUB_ENV
echo "VERSION_SSJS_UPDATE=$ssjs_online_version" >> $GITHUB_ENV
echo "VERSION_AUTH=$auth_version" >> $GITHUB_ENV
echo "VERSION_AUTH_UPDATE=$auth_online_version" >> $GITHUB_ENV
echo "VERSION_API=$api_gateway_version" >> $GITHUB_ENV
echo "VERSION_API_UPDATE=$api_online_version" >> $GITHUB_ENV
# For the time being, let's assume the script will fail
echo "PROCEED=false" >> $GITHUB_ENV

# Proceed only if the retrieved version is greater than the current one
if [[ "$syncing_server_js_version" == "$ssjs_online_version" \
	&& "$auth_version" == "$auth_online_version" \
	&& "$api_gateway_version" == "$api_online_version" ]]; then
    echo "::warning ::No new version available"
    exit 0
# Proceed only if a PR for this new version does not already exist
elif git ls-remote -q --exit-code --heads https://github.com/$GITHUB_REPOSITORY.git ci-auto-update-v$version ; then
    echo "::warning ::A branch already exists for this update"
    exit 0
fi

assets[0]="https://github.com/standardnotes/syncing-server-js/archive/$ssjs_online_version.tar.gz"
assets[1]="https://github.com/standardnotes/auth/archive/$auth_online_version.tar.gz"
assets[2]="https://github.com/standardnotes/api-gateway/archive/$api_online_version.tar.gz"
echo "${#assets[@]} available asset(s)"

#=================================================
# UPDATE SOURCE FILES
#=================================================

# Here we use the $assets variable to get the resources published in the upstream release.

count=0

# Let's loop over the array of assets URLs
for asset_url in ${assets[@]}; do

echo "Handling asset at $asset_url"

# Assign the asset to a source file in conf/ directory
# Here we base the source file name upon a unique keyword in the assets url (admin vs. update)
# Leave $src empty to ignore the asset
case $asset_url in
  *"/syncing-server-js/"*)
    src="app_syncing-server-js"
    ;;
  *"/auth/"*)
    src="app_auth"
    ;;
  *"/api-gateway/"*)
    src="app_api-gateway"
    ;;
  *)
    src=""
    ;;
esac

# If $src is not empty, let's process the asset
if [ ! -z "$src" ]; then

# Create the temporary directory
tempdir="$(mktemp -d)"

# Download sources and calculate checksum
filename=${asset_url##*/}
curl --silent -4 -L $asset_url -o "$tempdir/$filename"
checksum=$(sha256sum "$tempdir/$filename" | head -c 64)

# Delete temporary directory
rm -rf $tempdir

# Get extension
if [[ $filename == *.tar.gz ]]; then
  extension=tar.gz
else
  extension=${filename##*.}
fi

# Rewrite source file
cat <<EOT > conf/$src.src
SOURCE_URL=$asset_url
SOURCE_SUM=$checksum
SOURCE_SUM_PRG=sha256sum
SOURCE_FORMAT=$extension
SOURCE_IN_SUBDIR=true
EOT
echo "... conf/$src.src updated"

count=$((count+1))

else
echo "... asset ignored"
fi

done

if [ $count == 0 ]; then
    echo "::warning ::None of the assets were processed."
    exit 0
fi

#=================================================
# SPECIFIC UPDATE STEPS
#=================================================

# Any action on the app's source code can be done.
# The GitHub Action workflow takes care of committing all changes after this script ends.

# Update versions in scripts/_common.sh
sed -i "s/syncing_server_js_version=.*$/syncing_server_js_version=\"$ssjs_online_version\"/g" "scripts/_common.sh"
sed -i "s/auth_version=.*$/auth_version=\"$auth_online_version\"/g" "scripts/_common.sh"
sed -i "s/api_gateway_version=.*$/api_gateway_version=\"$api_online_version\"/g" "scripts/_common.sh"

#=================================================
# GENERIC FINALIZA-TION
#=================================================

# Replace new version in manifest
echo "$(jq -s --indent 4 ".[] | .version = \"$version~ynh1\"" manifest.json)" > manifest.json

# No need to update the README, yunohost-bot takes care of it

# The Action will proceed only if the PROCEED environment variable is set to true
echo "PROCEED=true" >> $GITHUB_ENV
exit 0
