#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================
#RUBY_VERSION="2.7.3"
NODEJS_VERSION="15.11.0"

# dependencies used by the app
pkg_dependencies=""

#pkg_dependencies="\
#    zlib1g-dev \
#    libsqlite3-dev \
#    default-libmysqlclient-dev \
#    libssl-dev \
#    libreadline-dev \
#    libjemalloc-dev \
#	"

#=================================================
# PERSONAL HELPERS
#=================================================

# Check if service is ready
is_service_ready() {
    for ((i = 0 ; i < 15 ; i++))
    do
        if [ "200" -eq $(curl --silent --insecure --resolve $domain:443:127.0.0.1 https://$domain$path_url/ -o /dev/null --write-out "%{http_code}") ]
        then
            break
        else
            sleep 2
        fi
    done
}

#================================================
# EXPERIMENTAL HELPERS
#=================================================



#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
