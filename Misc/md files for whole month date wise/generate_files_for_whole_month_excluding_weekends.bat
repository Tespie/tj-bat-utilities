
@REM  * This script generates markdown files for each day of a specified month and year,
@REM  * EXCLUDING Weekends (Saturday and Sunday).
@REM  * It uses a template file to create new files with the date in the filename.
@REM  * The script is designed to be run in a Windows environment.

@echo off
setlocal enabledelayedexpansion

@REM CONFIGURATION - start
rem Set the source file
set "source_file=new_5_comments_template.md"

rem Set the month and year ( 01 means January, 02 means February, etc. )
set "month=06"
set "year=2025"

@REM CONFIGURATION - end

rem Check if template file exists
if not exist "%source_file%" (
    echo Template file "%source_file%" not found!
    pause
    exit /b 1
)

rem Get the month name dynamically (e.g., June)
for /f %%m in ('powershell -NoLogo -Command "[CultureInfo]::InvariantCulture.DateTimeFormat.GetMonthName(%month%)"') do set "month_name=%%m"

rem Calculate the number of days in the month
for /f %%d in ('powershell -NoLogo -Command "(Get-Date -Year %year% -Month (%month%+1) -Day 1).AddDays(-1).Day"') do set "days_in_month=%%d"

rem Loop through all days of the month
for /L %%d in (1,1,%days_in_month%) do (
    rem No zero-padding here, just use %%d directly
    set "day=%%d"

    rem Get the day of the week (e.g., Monday, Tuesday, ...)
    for /f %%w in ('powershell -NoLogo -Command "(Get-Date -Year %year% -Month %month% -Day %%d).DayOfWeek"') do set "weekday=%%w"

    if /I not "!weekday!"=="Saturday" if /I not "!weekday!"=="Sunday" (
        set "new_file=!day!_!month_name!_%year%.md"
        copy "%source_file%" "!new_file!" >nul
        echo Created !new_file!
    ) else (
        echo Skipping !day!_!month_name!_%year%.md (Weekend)
    )
)

echo Files generated successfully.
endlocal