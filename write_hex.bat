@echo off
setlocal

rem Prease set arduino program path
set ARDUINO_HOME=C:\Program Files (x86)\Arduino
set TARGET=atmega328p
set HEX_FILE=.pio\build\uno\firmware.hex

if "%1" == "" (
    echo usage: %0 ^<port^>
    echo example: %0 COM0 .pio\build\uno\firmware.hex
    exit /b 1
)

"%ARDUINO_HOME%\hardware\tools\avr\bin\avrdude" -C"%ARDUINO_HOME%\hardware/tools/avr/etc/avrdude.conf" -q -q -p"%TARGET%" -carduino -P%1 -b115200 -D -Uflash:w:"%HEX_FILE%":i
