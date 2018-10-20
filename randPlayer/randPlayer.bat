@echo off & Setlocal

:loop

Set "_=mon tues wed thurs fri sat sun" 
For /f %%# In ('WMIC Path Win32_LocalTime Get DayOfWeek^|Findstr [1-7]') Do (Set DOW=%%#)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set datime=%%a%%b)

:: Si le jour est Vendredi
IF /I "%DOW%" EQU "5" (
	:: Si l'heure est exacte
	if "%datime%" EQU " 900" (
		goto timeisgud
	)
	if "%datime%" EQU "1000" (
		goto timeisgud
	)
	if "%datime%" EQU "1100" (
		goto timeisgud
	)
	if "%datime%" EQU "1200" (
		goto timeisgud
	)
)

goto loop

:timeisgud

start mlp.mp4

PING localhost -n 70 >NUL

start pwe.vbs
taskkill /F /IM cmd.exe

exit