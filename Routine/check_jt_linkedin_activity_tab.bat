@ECHO OFF 
@REM This script opens Chrome window with the Perplexity and LinkedIn URLs at the specified times

@REM Where to Place This File: 
:: C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

@REM How to Find Startup Folder easily:
:: Scope : Current User
:: %AppData%\Microsoft\Windows\Start Menu\Programs\Startup
:: Scope : All Users (System-wide)
:: %ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup

@ECHO OFF
@REM This script opens the Perplexity and LinkedIn URLs at specific times during the day
SETLOCAL EnableDelayedExpansion
SET /A count=0
SET /A urlCount=0

:: Define URLs
SET "linkedinUrl=https://www.linkedin.com/company/53249342/admin/notifications/all/"
SET "perplexityUrl=https://www.perplexity.ai/search/jt-linkedin-activity-react-rep-tLPTp3Z2QoqAsx9FCxz.Ug"

:: Open the URLs when the script starts
start chrome --new-window "%perplexityUrl%" "%linkedinUrl%"
SET /A urlCount+=1
echo URLs opened...... Total opens: !urlCount!

:START
:: Check current time
FOR /F "tokens=1-2 delims=:" %%A IN ('TIME /T') DO (
  SET hour=%%A
  SET minute=%%B
)

:: Open URLs at specified times and log it
IF "!hour!"=="09" IF "!minute!"=="00" (
  start chrome --new-window "%perplexityUrl%" "%linkedinUrl%"
  SET /A urlCount+=1
  echo URLs opened at 9:00 AM IST. Total opens: !urlCount!
)
IF "!hour!"=="12" IF "!minute!"=="30" (
  start chrome --new-window "%perplexityUrl%" "%linkedinUrl%"
  SET /A urlCount+=1
  echo URLs opened at 12:30 PM IST. Total opens: !urlCount!
)
IF "!hour!"=="16" IF "!minute!"=="00" (
  start chrome --new-window "%perplexityUrl%" "%linkedinUrl%"
  SET /A urlCount+=1
  echo URLs opened at 4:00 PM IST. Total opens: !urlCount!
)

@REM Standard Quiet Delay without visible countdown
timeout /t 60 >nul

goto START
