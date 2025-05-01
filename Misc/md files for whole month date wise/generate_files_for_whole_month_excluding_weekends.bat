
@REM  * This script generates markdown files for each day of a specified month and year,
@REM  * EXCLUDING Weekends (Saturday and Sunday).
@REM  * It uses a template file to create new files with the date in the filename.
@REM  * The script is designed to be run in a Windows environment.

@echo off
setlocal enabledelayedexpansion

rem Set the source file
set "source_file=new_5_comments_template.md"

rem Check if template file exists
if not exist "%source_file%" (
    echo Template file "%source_file%" not found!
    pause
    exit /b 1
)

rem Set the month and year
set "month=05"
set "year=2025"

rem Loop through all days of the month
for /L %%d in (1,1,31) do (
    rem Check if the day is valid for the month
    if %%d lss 29 (
        set "date=%%d"
    ) else if %%d==29 (
        set "date=%%d"
    ) else if %%d==30 (
        if %month%==05 (
            set "date=%%d"
        )
    ) else if %%d==31 (
        if %month%==05 (
            set "date=%%d"
        )
    )

    rem Get the day of the week (1=Monday, 7=Sunday)
    for /F "tokens=1" %%a in ('powershell -command "[CultureInfo]::CurrentCulture.DateTimeFormat.GetDayName((Get-Date -Year !year! -Month !month! -Day !date!).DayOfWeek)"') do (
        set "day_of_week=%%a"
        if /I not "!day_of_week!"=="Saturday" if /I not "!day_of_week!"=="Sunday" (
            rem Generate the new filename
            set "new_file=!date!_may_2025.md"
            rem Copy the template file to the new file
            copy "!source_file!" "!new_file!"
            echo Copied and Created !new_file!
        ) else (
            echo Skipping !date!_may_2025.md (Ouch! I found a weekend)
        )
    )
)

echo Files generated successfully.
endlocal
