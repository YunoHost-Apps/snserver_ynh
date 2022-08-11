#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================
NODEJS_VERSION="16"

swap_needed=4096
node_max_old_space_size=4096

# dependencies used by the app
pkg_dependencies=""

#=================================================
# PERSONAL HELPERS
#=================================================

# Substitute/replace a string (or expression) by another in a file on a
#
# usage: ynh_replace_string_occurrence --occurrence=occurrence --match_string=match_string --replace_string=replace_string --target_file=target_file
# | arg: -o, --occurrence=      - Replace the nth occurrence in the file
# | arg: -m, --match_string=    - String to be searched and replaced in the file
# | arg: -r, --replace_string=  - String that will replace matches
# | arg: -f, --target_file=     - File in which the string will be replaced.
#
# As this helper is based on sed command, regular expressions and references to
# sub-expressions can be used (see sed manual page for more information)
#
ynh_replace_string_occurrence() {
    # Declare an array to define the options of this helper.
    local legacy_args=omrf
    local -A args_array=([o]=occurrence [m]=match_string= [r]=replace_string= [f]=target_file=)
    local occurrence
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
    sed --in-place "s${delimit}${match_string}${delimit}${replace_string}${delimit}${occurrence}" "$target_file"
}

#================================================
# EXPERIMENTAL HELPERS
#=================================================



#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
