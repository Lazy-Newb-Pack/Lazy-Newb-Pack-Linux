#!/bin/sh

# This script checks the system for ARCH and disto details
# and sets up env variables as workaround for use by the
# df/dfhack scripts.

t_bold="$(tput bold 2>/dev/null || printf '\033[1m')"
t_green="$(tput setaf 2 2>/dev/null || printf '\033[0;32m')"
t_reset="$(tput sgr 0 2>/dev/null || printf '\033[0m')"
dlog() {
    local color=0
    if [ "$1" = "WARN" ] || [ "$1" = "WARNING" ]; then
        color=3
    elif [ "$1" = "INFO" ]; then
        color=6
    elif [ "$1" = "ERR" ] || [ $1 = "ERROR" ]; then
        color=1
    fi
    color="$(tput setaf $color 2>/dev/null || printf '\033[3'$color'm')"
    printf "${t_green}${t_bold}[distro_fixes] ${color}[$1]${t_reset} $2\n"
}

find_zlib() {
    for hint in "$@" /usr/lib32 /lib32 /usr/lib/mesa-diverted/i386-linux-gnu /usr/lib ; do
        if [ -f "$hint" ]; then
            ZLIB_PATH="$hint"
            break
        elif [ -d "$hint" ]; then
            for file in libz.so libz.so.1 libz.so.1.2.5 libz.so.1.1.3 libz.dylib ; do
                if [ -f "$hint/$file" ]; then
                    ZLIB_PATH="$hint/$file"
                    break
                fi
            done
            if [ -z "$ZLIB_PATH" ]; then
                ZLIB_PATH=$(ls "$hint"/libz.* 2>/dev/null | head -n1)
            fi
        fi
        if [ -n "$ZLIB_PATH" ]; then
            break
        fi
    done
}

if [ -z "$DF_DIR" ]; then
    dlog ERROR "DF_DIR not defined."
    exit 1
fi

dlog "INFO" "Checking whether any distro specific fixes are required..."

# find df bin relative to location of this shell script
DF_BIN_LOCATION="$DF_DIR/libs/Dwarf_Fortress"

if [ ! -f $DF_BIN_LOCATION ]; then
    dlog "WARN" "did not find df binary at $DF_BIN_LOCATION"
fi

pcre_ogrep() {
    if which egrep >/dev/null 2>&1; then
        egrep -o "$@"
    else
        grep -Po "$@"
    fi
}

# Detect Stuff
OS=$(uname -s)
ARCH=$(uname -m)
VER=$(uname -r)
DF_ARCH=$(file "$DF_BIN_LOCATION" | pcre_ogrep '(32|64)-bit')

# this needs to be picked up by df/dfhack and included in LD_PRELOAD
# empty by default (unless set manually in the shell env)
export PRELOAD_LIB

# LSB should work across modern distros, but may not be available in some cases.
if [ -e "/usr/bin/lsb_release" ]; then
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
# Fedora specific Fallback
elif [ -e  /etc/fedora-release ]; then
    OS="Fedora"
    VER=$(cat /etc/fedora-release | grep -Po '\d+')
elif [ -e /etc/os-release ]; then
    OS=$(grep \^NAME\= /etc/os-release | cut -d\= -f 2- | tr -d \")
    VER=$(grep \^VERSION\= /etc/os-release | cut -d\= -f 2- | tr -d \")
else
    dlog "WARN" "OS not successfully detected"
fi
OS=$(echo $OS | cut -d' ' -f 1 | tr '[:upper:]' '[:lower:]')

# Report Stuff

dlog "INFO" "OS: $OS"
dlog "INFO" "ARCH: $ARCH"
dlog "INFO" "VER: $VER"
dlog "INFO" "DF_ARCH: $DF_ARCH"
dlog "INFO" "DF_BIN_LOCATION: $DF_BIN_LOCATION"

# Optionally, Fix stuff

# 32 bit df on 64 bit linux must give loader precedence to the 32 bit libz
# to avoid errors when libpng tries to load images.
# Some threads suggest png files should also be converted to bmp as a fix
# but I haven't found this necessary if LD_PRELOAD is properly set (on fedora).

if [ x"$DF_ARCH" = x'32-bit' ] && [ x"$ARCH" = x'x86_64' ]; then
    dlog "INFO" "32 bit df on $OS/64bit detected"
    # Fedora 21/64-bit is tested
    if [ x"$OS" = x'fedora' ]; then
        find_zlib /usr/lib/libz.so.1 /usr/lib
    # Gentoo 2.2
    elif [ x"$OS" = x'gentoo' ]; then
        find_zlib /lib32/libz.so.1 /lib32
    elif [ x"$OS" = x'arch' ] || [ x"$OS" = x'antergos' ] || [ x"$OS" = x'manjarolinux' ]; then
        find_zlib /usr/lib32/libz.so /usr/lib32
        if [ -e "/usr/lib32/libstdc++.so.6" ]; then
            export PRELOAD_LIB="${PRELOAD_LIB:+$PRELOAD_LIB:}/usr/lib32/libstdc++.so.6"
        else
            dlog WARN "Could not find /usr/lib32/libstdc++.so.6"
        fi
    elif [ x"$OS" = x'debian' ]; then
        export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}/usr/lib/mesa-diverted/i386-linux-gnu"
        find_zlib /usr/lib32/libz.so /usr/lib32
    elif [ x"$OS" = x'opensuse' ]; then
        find_zlib /lib/libz.so /lib
    # Add your distro here...
    # elif [ x"$OS" = x'myfoodistro' ]; then
    #     find_zlib hint [hint]...
    else
        dlog "WARN" "32bit 'Dwarf_Fortress' on unhandled 64bit OS detected. If you get 'missing file' errors, please open an issue on Github: https://github.com/Lazy-Newb-Pack/Lazy-Newb-Pack-Linux/issues."
        find_zlib
    fi

    if [ -z "$ZLIB_PATH" ]; then
        dlog WARN "Could not find a 32-bit zlib"
    fi

elif [ x"$DF_ARCH" = x'32-bit' ]; then
    find_zlib
fi

if [ -n "$ZLIB_PATH" ]; then
    export PRELOAD_LIB="${PRELOAD_LIB:+$PRELOAD_LIB:}$ZLIB_PATH"
    dlog INFO "Attempting to use zlib at $ZLIB_PATH"
fi

dlog "INFO" "PRELOAD_LIB: $PRELOAD_LIB"
dlog "INFO" "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
dlog "INFO" "Done"
