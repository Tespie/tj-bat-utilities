@REM Where to Place This File: 
:: C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

@REM How to Find Startup Folder easily:
:: Scope : Current User
:: %AppData%\Microsoft\Windows\Start Menu\Programs\Startup
:: Scope : All Users (System-wide)
:: %ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup

@ECHO OFF
@REM This script opens the Helpdesk tickets URL and LinkedIn tabs at specific times during the day
SETLOCAL EnableDelayedExpansion
SET /A count=0
SET /A urlCount=0

:: Define URLs
SET "helpdeskUrl=https://jignect.keka.com/#/org/helpdesk/tickets/open"
SET "linkedinUrl=https://www.linkedin.com/company/53249342/admin/notifications/all/"
SET "perplexityUrl=https://www.perplexity.ai/search/jt-linkedin-activity-react-rep-tLPTp3Z2QoqAsx9FCxz.Ug"

:: Open the URLs when the script starts
start chrome --new-window "%helpdeskUrl%" "%linkedinUrl%" "%perplexityUrl%"
SET /A urlCount+=1
echo URLs opened...... Total opens: !urlCount!

:START
:: Check current time
FOR /F "tokens=1-2 delims=:" %%A IN ('TIME /T') DO (
  SET hour=%%A
  SET minute=%%B
)

:: Open URLs at specified times and log it
IF "!hour!"=="12" IF "!minute!"=="00" (
  start chrome --new-window "%helpdeskUrl%"
  SET /A urlCount+=1
  echo URLs opened at 12:00 PM IST. Total opens: !urlCount!
)
IF "!hour!"=="14" IF "!minute!"=="15" (
  start chrome --new-window "%helpdeskUrl%" "%linkedinUrl%" "%perplexityUrl%"
  SET /A urlCount+=1
  echo URLs opened at 2:15 PM IST. Total opens: !urlCount!
)
IF "!hour!"=="17" IF "!minute!"=="00" (
  start chrome --new-window "%helpdeskUrl%" "%linkedinUrl%" "%perplexityUrl%"
  SET /A urlCount+=1
  echo URLs opened at 5:00 PM IST. Total opens: !urlCount!
)
IF "!hour!"=="19" IF "!minute!"=="00" (
  start chrome --new-window "%helpdeskUrl%"
  SET /A urlCount+=1
  echo URLs opened at 7:00 PM IST. Total opens: !urlCount!
)
timeout /t 60 >nul
goto START