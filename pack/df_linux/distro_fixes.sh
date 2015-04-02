#!/bin/sh

# This script checks the system for ARCH and disto details
# and sets up env variables as workaround for use by the
# df/dfhack scripts.

dlog() {
    echo -e "\033[0;32m[distro_fixes]\033[0;00m $1 $2"
}

if [ "$#" -lt 1 ]; then
    echo "[distro_fixes.sh] you must provide DF_DIR as an argument."
    exit 1
fi

dlog "INFO" "Checking whether any ARCH/distro specific fixes are required..."

# find df bin relative to location of this shell script
DF_BIN_LOCATION="$1/libs/Dwarf_Fortress"

if [ ! -f $DF_BIN_LOCATION ]; then
    dlog "WARN" "did not find df binary at $DF_BIN_LOCATION"
fi

# Detect Stuff
OS=$(uname -s)
ARCH=$(uname -m)
VER=$(uname -r)
DF_ARCH=$(file "$DF_BIN_LOCATION" | grep -Po '(32|64)-bit')

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
fi

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

if [ x"$DF_ARCH" == x'32-bit' ] && [ x"$ARCH" == x'x86_64' ]; then
    dlog "INFO" "32 bit df on $OS/64bit detected"
    # Fedora 21/64-bit is tested
    if [ x"$OS" == x'Fedora' ]; then
        export PRELOAD_LIB="${PRELOAD_LIB:+$PRELOAD_LIB:}/usr/lib/libz.so.1";
        dlog "INFO" "Setting LD_PRELOAD to $PRELOAD_LIB"
    # Gentoo 2.2
    elif [ x"$OS" == x'Gentoo' ]; then
        export PRELOAD_LIB="${PRELOAD_LIB:+$PRELOAD_LIB:}/lib32/libz.so.1";
        dlog "INFO" "Setting LD_PRELOAD to $PRELOAD_LIB"
    elif [ x"$OS" == x'Arch' ]; then
        export PRELOAD_LIB="${PRELOAD_LIB:+$PRELOAD_LIB:}/usr/lib32/libz.so";
        dlog "INFO" "Setting LD_PRELOAD to $PRELOAD_LIB"
    elif [ x"$OS" == x'Debian' ]; then
        export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}/usr/lib/mesa-diverted/i386-linux-gnu"
        if [ -f "/usr/lib32/libz.so" ]; then
            export PRELOAD_LIB="${PRELOAD_LIB:+$PRELOAD_LIB:}/usr/lib32/libz.so"
        else
            zlib32=$(ls /usr/lib32/libz.so.* | head -n1)
            if [ -f "$zlib32" ]; then
                export PRELOAD_LIB="${PRELOAD_LIB:+$PRELOAD_LIB:}$zlib32"
            else
                dlog "WARN" "Could not find a 32-bit zlib"
            fi
        fi
        dlog "INFO" "Setting LD_PRELOAD to $PRELOAD_LIB"
        dlog "INFO" "Setting LD_LIBRARY_PATH to $LD_LIBRARY_PATH"
    # Add your distro here...
    # elif [ x"$OS" == x'MyFooDistro' ]; then
    #     export PRELOAD_LIB="${PRELOAD_LIB:+$PRELOAD_LIB:}<abspath_to_32bit_libz>";
    #     dlog "INFO" "32 bit df on $OS/64bit detected. Will set LD_PRELOAD to $PRELOAD_LIB...."
    else
        dlog "WARN" "32bit 'Dwarf_Fortress' on unhandled 64bit OS detected. If you get 'missing file' errors, please open an issue on Github: https://github.com/Lazy-Newb-Pack/Lazy-Newb-Pack-Linux/issues."
    fi

fi

dlog "INFO" "Done"
