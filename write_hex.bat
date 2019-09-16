@echo off
setlocal

set ARDUINO_TOOLS=C:\Program Files (x86)\Arduino\hardware\tools
set HEX_FILE=.pio\build\uno\firmware.hex
set TARGET=atmega328p

if "%1" == "" (
    echo usage: %0 ^<port^>
    echo example: %0 COM0 .pio\build\uno\firmware.hex
    exit /b 1
)

"%ARDUINO_TOOLS%\avr\bin\avrdude" -C"%ARDUINO_TOOLS%\avr\etc\avrdude.conf" -b115200 -carduino -P%1 -p"%TARGET%" -Uflash:w:"%HEX_FILE%":i
