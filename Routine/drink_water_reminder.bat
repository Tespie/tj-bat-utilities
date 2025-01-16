@ECHO OFF
SETLOCAL EnableDelayedExpansion
SET /A count=0
:START
SET /A count+=1
msg * "Hello Tejas - PANI PI LE BHAI (Count =  !count!) 30 Mins Delay"
@REM start chrome --new-window "https://calendar.google.com/calendar/u/0/r"
echo  Water Sipped for !count! times
timeout /t 1800
goto START
