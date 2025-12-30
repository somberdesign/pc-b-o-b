

cd \users\rgw3\pc-b-o-b

:: backup
cd backup
copy /y \users\rgw3\_vimrc .

:: git
cd \users\rgw3\pc-b-o-b
git diff --name-only
git add . && git commit -m "Backed up by login.bat" && git push

cd \users\rgw3\pc-common
git pull
git diff --name-only
git add . && git commit -m "Backed up by login.bat" && git push
doskey /macrofile=doskey\doskeyDefinitions.txt

cd \users\rgw3\PythonScripts
git pull
git diff --name-only
git add . && git commit -m "Backed up by login.bat" && git push


cd \users\rgw3\pc-b-o-b\ahk
start "" "\Program Files\AutoHotkey\v2\AutoHotkey.exe" b-o-b.ahk

start "" "C:\Program Files\Notepad++\notepad++.exe" \Users\Rgw3\pc-b-o-b\ahk\b-o-b.ahk

net use m: /delete

:RETRY_PASSWORD
net use m: \\192.168.1.196\e /user:rgw3@hotmail.com
echo errorlevel = %errorlevel%
if 0 NEQ %errorlevel% goto RETRY_PASSWORD

pause

