@echo off
echo Fixing import paths in Flutter project...

cd "E:\D\my projects\mobile apps\aime_store\lib"

echo Fixing core/models imports...
for /r %%f in (*.dart) do (
    powershell -Command "(Get-Content '%%f') -replace '\.\./\.\./\.\./core/models/', '../../../../core/data/models/' | Set-Content '%%f'"
)

echo Fixing core/providers imports...
for /r %%f in (*.dart) do (
    powershell -Command "(Get-Content '%%f') -replace '\.\./\.\./\.\./core/providers/', '../../../../core/presentation/providers/' | Set-Content '%%f'"
)

echo Fixing core/widgets imports...
for /r %%f in (*.dart) do (
    powershell -Command "(Get-Content '%%f') -replace '\.\./\.\./\.\./core/widgets/', '../../../../core/presentation/widgets/' | Set-Content '%%f'"
)

echo Fixing core/constants imports...
for /r %%f in (*.dart) do (
    powershell -Command "(Get-Content '%%f') -replace '\.\./\.\./\.\./core/utils/', '../../../../core/constants/' | Set-Content '%%f'"
)

echo Import path fixes completed!
pause