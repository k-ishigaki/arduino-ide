#!/bin/sh -e

ARDUINO_TOOLS=/Applications/Arduino.app/Contents/Java/hardware/tools
HEX_FILE=.pio/build/uno/firmware.hex
TARGET=atmega328p

if [[ $# -ne 1 ]]; then
    echo "usage: ${0##*/} <port>"
    echo "example: ${0##*/} /dev/cu.usbmodem146101"
    exit 1
fi

${ARDUINO_TOOLS}/avr/bin/avrdude -C ${ARDUINO_TOOLS}/avr/etc/avrdude.conf -b 115200 -c arduino -P $1 -p ${TARGET} -U flash:w:${HEX_FILE}:i
