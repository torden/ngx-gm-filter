#!/bin/sh

GM_PKG_CONFIG=$(whereis GraphicsMagick-config)
CMD_TR=$(which tr)
CMD_SED=$(which sed)
THIS_PATH=$(dirname $0)
TPL_CONFIG="tpl.config"
TARGET_CONFIG="config"

if [ ! -f $CMD_TR ]; then
	echo "Required to 'tr' command"
	exit 1
fi

if [ ! -f $CMD_SED ]; then
	echo "Required to 'sed' command"
	exit 1
fi

if [ ! -f $TPL_CONFIG ]; then
	echo "Required to 'tpl.config' file"
	exit 1
fi

if [ -f $GM_PKG_CONFIG ]; then
	GM_LDFLAGS=$($GM_PKG_CONFIG --ldflags --libs | $CMD_TR "\n" " ")
	GM_CPPFLAGS=$($GM_PKG_CONFIG --cppflags)
	GM_CFLAGS=$($GM_PKG_CONFIG --cflags)

	$CMD_SED -e "s#{GM_LDFLAGS}#$GM_LDFLAGS#g ; s#{GM_CPPFLAGS}#$GM_CPPFLAGS#g ; s#{GM_CFLAGS}#$GM_CFLAGS#g"  $THIS_PATH/$TPL_CONFIG > $THIS_PATH/$TARGET_CONFIG

else
	echo "Failed to check the Graphics Magick Config command file : GraphicMagick-config"
	exit 1
fi
