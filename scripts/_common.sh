#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================
RUBY_VERSION="2.7.2"

# dependencies used by the app
#pkg_dependencies="ruby ruby-dev rails zlib1g-dev libsqlite3-dev default-libmysqlclient-dev libssl-dev libreadline-dev"
pkg_dependencies="\
	zlib1g-dev \
	libsqlite3-dev \
	default-libmysqlclient-dev \
	libssl-dev \
	libreadline-dev \
	libjemalloc-dev"

#=================================================
# PERSONAL HELPERS
#=================================================

# Execute a command as another user with login
# (hence in user home dir, with prior loading of .profile, etc.)
# usage: exec_login_as USER COMMAND [ARG ...]
exec_login_as() {
	local user=$1
	shift 1
	exec_as $user --login "$@"
}
# Execute a command as another user
# usage: exec_as USER COMMAND [ARG ...]
exec_as() {
	local user=$1
	shift 1
	
	if [[ $user = $(whoami) ]]; then
		eval "$@"
	else
		sudo -u "$user" "$@"
	fi
}

#================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
