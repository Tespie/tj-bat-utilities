@echo off
md "2026"
cd "2026"
@REM md "🔔🔔YEARLY 2026 🔔🔔"
for %%m in (Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec) do (
    md "%%m 2026\GST"
    md "%%m 2026\Non GST"
    md "%%m 2026\Amazon Bills"
    md "%%m 2026\HR - %%m - 2026"
)
echo All folders created successfully!
pause

