@echo off
setlocal

:: Create main year folder and move into it
md "2025"
cd "2025"

:: List of months
set months=Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec

:: Loop through each month and create the required folders
for %%M in (%months%) do (
    md "%%M 2025\GST\JT"
    md "%%M 2025\GST\JTPL"
    md "%%M 2025\Non GST"
    md "%%M 2025\Amazon Bills"
)

echo All folders created successfully!
pause
