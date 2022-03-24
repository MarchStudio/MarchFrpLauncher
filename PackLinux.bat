@echo off
echo Be sure you have built MarchFrpLauncher.Linux.
pause
echo Cleaning Pack Folder...
rd /s /q MarchFrpLauncher.Linux.Pack
echo Creating pack folder...
mkdir MarchFrpLauncher.Linux.Pack
mkdir MarchFrpLauncher.Linux.Pack\frpc
mkdir MarchFrpLauncher.Linux.Pack\program
echo Copying bin files...
copy src\frpc_bin\frpc_linux_386 .\MarchFrpLauncher.Linux.Pack\frpc\386
copy src\frpc_bin\frpc_linux_amd64 .\MarchFrpLauncher.Linux.Pack\frpc\amd64
copy src\frpc_bin\frpc_linux_arm64 .\MarchFrpLauncher.Linux.Pack\frpc\arm64
copy src\frpc_bin\frpc_linux_arm .\MarchFrpLauncher.Linux.Pack\frpc\arm
copy src\MarchFrpLauncher.Linux\MarchFrpLauncher.Linux.i386\bin\x86\Debug\MarchFrpLauncher.Linux.i386.out MarchFrpLauncher.Linux.Pack\program\386
copy src\MarchFrpLauncher.Linux\MarchFrpLauncher.Linux.amd64\bin\x64\Debug\MarchFrpLauncher.Linux.amd64.out MarchFrpLauncher.Linux.Pack\program\amd64
copy src\MarchFrpLauncher.Linux\MarchFrpLauncher.Linux.arm64\bin\ARM64\Debug\MarchFrpLauncher.Linux.arm64.out MarchFrpLauncher.Linux.Pack\program\arm64
copy src\MarchFrpLauncher.Linux\MarchFrpLauncher.Linux.arm\bin\ARM\Debug\MarchFrpLauncher.Linux.arm.out MarchFrpLauncher.Linux.Pack\program\arm
echo Generating install scripts...
copy src\MarchFrpLauncher.Linux.Installer\install.sh MarchFrpLauncher.Linux.Pack
copy src\MarchFrpLauncher.Linux.Installer\uninstall.sh MarchFrpLauncher.Linux.Pack
echo Done!
