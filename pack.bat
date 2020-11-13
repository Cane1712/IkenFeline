rm -rf release
mkdir release
cd release

REM IkenFeline
cp ../IkenFeline/bin/Debug/IkenFeline.dll IkenFeline.dll
cp ../LittleWitchWin.IkenFeline.mm/bin/Debug/Ikenfell.IkenFeline.mm.dll IkenfellWin.IkenFeline.mm.dll
cp IkenfellWin.IkenFeline.mm.dll IkenfellLinux.IkenFeline.mm.dll

REM MonoMod
cp ../lib/monomod/*.dll .
cp ../lib/monomod/*.exe .

cp ../game/patch.bat .

cd ../game
MonoMod.RuntimeDetour.HookGen.exe LittleWitch.dll
MonoMod.RuntimeDetour.HookGen.exe GameEngine.dll
cp MMHOOK_LittleWitch.dll ../release
cp MMHOOK_GameEngine.dll ../release

cd ../release

mkdir IkenFeline
mv *.* IkenFeline

REM TestMod
mkdir TestMod
cd TestMod
mkdir TestMod
cd ..
cp ../LittleWitch.TestMod.mm/bin/debug/LittleWitch.TestMod.mm.dll TestMod/TestMod


cd IkenFeline
tar -czvf IkenFeline.tar.gz *
mv IkenFeline.tar.gz ..

cd ../TestMod
tar -czvf TestMod.tar.gz *
mv TestMod.tar.gz ..

cd ../..
