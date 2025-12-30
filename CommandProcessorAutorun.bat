@echo off
echo Executing %~f0

doskey /macrofile=d:\users\rgw3\pc-common\doskey\doskeyDefinitions.txt
doskey npp="c:\Program Files\Notepad++\notepad++.exe" $*
doskey pushhome=pushd d:\users\rgw3
doskey gohome=@echo off $T d: $T cd \users\rgw3\pc-whitley202007 $T echo on


