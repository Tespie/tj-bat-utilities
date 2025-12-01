
@REM  * This script generates markdown files for each day of a specified month and year,
@REM  * EXCLUDING Weekends (Saturday and Sunday).
@REM  * MONTH & YEAR you can set in Configuration section.
@REM  * Whether you want Leading Zero in Day or not, you can set in Configuration section.
@REM  * Whether you want to Exclude Weekends or not, you can set in Configuration section.
@REM  * You can set the Month Length (3-letter or full) and Month Case (upper, lower, title) in Configuration section.
@REM  * It uses a template file to create new files with the date in the filename.
@REM  * The script is designed to be run in a Windows environment.

@echo off
setlocal enabledelayedexpansion

@REM CONFIGURATION - start
rem Set the source file
set "source_file=new_5_comments_template.md"

rem Set the month and year ( 01 means January, 02 means February, etc. )
set "month=08"
set "year=2025"

rem Set to '1' to exclude weekends (Saturday and Sunday)
rem Set to '0' to include weekends (Saturday and Sunday)
set "exclude_weekends=1"

rem Set to '1' for leading zero in day (01, 02...), 
rem Set to '0' for no leading zero (1, 2...)
set "leading_zero=1"

rem Set month_length to '3' for 3-letter month ( JAN, FEB etc... )
rem Set month_length to 'full' for full month name ( January, February etc... )
set "month_length=3"

rem Set month_case to 'upper' ( JANUARY, FEBRUARY etc... )
rem Set month_case to 'lower' ( january, february etc... )
rem Set month_case to 'title' ( Default Case : January, February etc... )
set "month_case=lower"

@REM CONFIGURATION - end

rem Check if template file exists
if not exist "%source_file%" (
    echo Template file "%source_file%" not found!
    pause
    exit /b 1
)

rem Get the month name dynamically (e.g., June)
for /f %%m in ('powershell -NoLogo -Command "[CultureInfo]::InvariantCulture.DateTimeFormat.GetMonthName(%month%)"') do set "month_name=%%m"

rem Shorten month name if needed
if "%month_length%"=="3" (
    set "month_name=!month_name:~0,3!"
)

rem Adjust month name case
if /I "%month_case%"=="upper" (
    for /f %%u in ('powershell -NoLogo -Command "\"!month_name!\".ToUpperInvariant()"') do set "month_name=%%u"
) else if /I "%month_case%"=="lower" (
    for /f %%l in ('powershell -NoLogo -Command "\"!month_name!\".ToLowerInvariant()"') do set "month_name=%%l"
)
rem (Title case is default, so nothing needed)

rem Calculate the number of days in the month
@REM for /f %%d in ('powershell -NoLogo -Command "(Get-Date -Year %year% -Month (%month%+1) -Day 1).AddDays(-1).Day"') do set "days_in_month=%%d"

rem -------------------------------------------------------------------------
rem FIX IS HERE: Used [DateTime]::DaysInMonth instead of calculating logic
rem -------------------------------------------------------------------------
for /f %%d in ('powershell -NoLogo -Command "[DateTime]::DaysInMonth(%year%, %month%)"') do set "days_in_month=%%d"

rem Loop through all days of the month
for /L %%d in (1,1,%days_in_month%) do (

    rem No zero-padding here, just use %%d directly
    set "day=%%d"

    rem Apply leading zero if configured
    if "!leading_zero!"=="1" (
        set "day=0%%d"
        set "day=!day:~-2!"
    )

    rem Get the day of the week (e.g., Monday, Tuesday, ...)
    for /f %%w in ('powershell -NoLogo -Command "(Get-Date -Year %year% -Month %month% -Day %%d).DayOfWeek"') do set "weekday=%%w"

    set "skip_day=0"
    if "!exclude_weekends!"=="1" (
        if /I "!weekday!"=="Saturday" set "skip_day=1"
        if /I "!weekday!"=="Sunday" set "skip_day=1"
    )

    if "!skip_day!"=="0" (
        set "new_file=!day!_!month_name!_%year%.md"
        copy "%source_file%" "!new_file!" >nul
        echo Copied and Created !new_file!
    ) else (
        echo Skipping !day!_!month_name!_%year%.md (Weekend^)
    )
)

echo Files generated successfully.
endlocal