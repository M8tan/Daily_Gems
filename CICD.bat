@echo off
set /p Desc=Enter message:
cd .\
git add .
git commit -m "%Desc%"
git push
echo #
echo #
echo #

echo Done!
timeout /t 2 /nobreak>nul
exit