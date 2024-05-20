#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

nodejs_version=18

swap_needed=4096
node_max_old_space_size=6144

config_api_gateway="$install_dir/live/api-gateway.env"
config_auth="$install_dir/live/auth.env"
config_auth_worker="$install_dir/live/auth-worker.env"
config_files="$install_dir/live/files.env"
config_syncing_server="$install_dir/live/syncing-server.env"
config_syncing_server_worker="$install_dir/live/syncing-server-worker.env"
config_workspace="$install_dir/live/workspace.env"

#=================================================
# PERSONAL HELPERS
#=================================================

# Reset failed systemd services.
ynh_reset_systemd(){
    systemctl reset-failed
}

# Substitute/replace a string (or expression) by another in a file on a line
#
# usage: ynh_replace_string_on_line --line=line --match_string=match_string --replace_string=replace_string --target_file=target_file
# | arg: -l, --line=			- Replace match on nth line in the file
# | arg: -m, --match_string=	- String to be searched and replaced in the file
# | arg: -r, --replace_string=  - String that will replace matches
# | arg: -f, --target_file=	 - File in which the string will be replaced.
#
# As this helper is based on sed command, regular expressions and references to
# sub-expressions can be used (see sed manual page for more information)
#
ynh_replace_string_on_line() {
    # Declare an array to define the options of this helper.
    local legacy_args=lmrf
    local -A args_array=([l]=line= [m]=match_string= [r]=replace_string= [f]=target_file=)
    local line
    local match_string
    local replace_string
    local target_file
    # Manage arguments with getopts
    ynh_handle_getopts_args "$@"
    set +o xtrace # set +x

    local delimit=@
    # Escape the delimiter if it's in the string.
    match_string=${match_string//${delimit}/"\\${delimit}"}
    replace_string=${replace_string//${delimit}/"\\${delimit}"}

    set -o xtrace # set -x
    sed --in-place "${line} s${delimit}${match_string}${delimit}${replace_string}${delimit}" "$target_file"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
