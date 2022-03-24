cd ~/projects/MarchFrpLauncher.Darwin
mkdir ./build
cp ./MarchFrpLauncher.Darwin/MarchFrpLauncher.Darwin/* ./build
cp ./MarchFrpLauncher.Unix.Common/* ./build
cd ./build
g++ ./main.cpp -o ./MarchFrpLauncher.Darwin.out
echo Over