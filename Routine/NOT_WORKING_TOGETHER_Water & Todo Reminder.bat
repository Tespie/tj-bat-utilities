@ECHO OFF
SETLOCAL EnableDelayedExpansion
SET /A count=0
SET /A urlCount=0

:: Open the URL when the script starts
start chrome --new-window "https://jignect.keka.com/#/org/helpdesk/tickets/open"
SET /A urlCount+=1
echo Helpdesk URL opened...... Total opens: !urlCount!

:START
SET /A count+=1
msg * "Hello Tejas - PANI PI LE BHAI (Count = !count!) 30 Mins Delay"
echo Water Sipped for !count! times

:: Check current time
FOR /F "tokens=1-2 delims=:" %%A IN ('TIME /T') DO (
    SET hour=%%A
    SET minute=%%B
)

:: Open Helpdesk URL at specified times and log it
IF "!hour!"=="14" IF "!minute!"=="15" (
    start chrome "https://jignect.keka.com/#/org/helpdesk/tickets/open"
    SET /A urlCount+=1
    echo Helpdesk URL opened at 2:15 PM IST. Total opens: !urlCount!
)
IF "!hour!"=="17" IF "!minute!"=="00" (
    start chrome "https://jignect.keka.com/#/org/helpdesk/tickets/open"
    SET /A urlCount+=1
    echo Helpdesk URL opened at 5:00 PM IST. Total opens: !urlCount!
)
IF "!hour!"=="19" IF "!minute!"=="00" (
    start chrome "https://jignect.keka.com/#/org/helpdesk/tickets/open"
    SET /A urlCount+=1
    echo Helpdesk URL opened at 7:00 PM IST. Total opens: !urlCount!
)

timeout /t 1800
goto START
