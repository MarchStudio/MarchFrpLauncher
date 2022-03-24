#!/bin/bash
printf "\033c"

Other_Arch() {
  read -p "未知架构，默认选择为x64，请确认是否继续安装！(y/n):" choice;
  if [ "$choice" = 'y' ]; then
    arch="x64"
    elif [ "$choice" = 'n' ]; then
    Red_Error "已退出安装"
    else
    echo "未知选项"
    Other_Arch
  fi
}

Check_Arch(){
  if [ "$(uname -m)" = 'x86_64' ]; then
    arch="amd64"
    echo "系统架构为x64，将会安装x64的MarchFrpLauncher"
    sleep 3
  elif [ "$(uname -m)" = 'i386' ]; then
    arch="386"
    echo "系统架构为x86，将会安装x86的MarchFrpLauncher"
    sleep 3
  elif [ "$(uname -m)" = 'i486' ]; then
    arch="386"
    echo "系统架构为x86，将会安装x86的MarchFrpLauncher"
    sleep 3
  elif [ "$(uname -m)" = 'i586' ]; then
    arch="386"
    echo "系统架构为x86，将会安装x86的MarchFrpLauncher"
    sleep 3
  elif [ "$(uname -m)" = 'i686' ]; then
    arch="386"
    echo "系统架构为x86，将会安装x86的MarchFrpLauncher"
    sleep 3
  elif [ "$(uname -m)" = 'aarch64' ]; then
    arch="arm64"
    echo "系统架构为arm64，将会安装arm64的MarchFrpLauncher"
    sleep 3
  elif [ "$(uname -m)" = 'arm' ]; then
    arch="arm"
    echo "系统架构为arm，将会安装arm的MarchFrpLauncher"
    sleep 3
  else
    Other_Arch
  fi
}

Red_Error() {
  echo '================================================='
  printf '\033[1;31;40m%b\033[0m\n' "$@"
  echo '================================================='
  exit 1
}

Install_MarchFrpLauncher() {
  marchfrplauncher_install_path="/opt/MarchFrpLauncher"
  echo "即将开始安装MarchFrpLauncher.Linux For ${arch}"
  sleep 3

  echo "[x] rm -irf ${marchfrplauncher_install_path}"
  rm -irf ${marchfrplauncher_install_path}

  echo "mkdir ${marchfrplauncher_install_path}"
  mkdir ${marchfrplauncher_install_path}

  echo "cp ./frpc/${arch} ${marchfrplauncher_install_path}/frpc"
  cp ./frpc/${arch} ${marchfrplauncher_install_path}/frpc

  echo "cp ./program/${arch} ${marchfrplauncher_install_path}/marchfrplauncher"
  cp ./program/${arch} ${marchfrplauncher_install_path}/marchfrplauncher

  echo "chmod +x ${marchfrplauncher_install_path}/frpc"
  chmod +x ${marchfrplauncher_install_path}/frpc

  echo "chmod +x ${marchfrplauncher_install_path}/marchfrplauncher"
  chmod +x ${marchfrplauncher_install_path}/marchfrplauncher

  echo "ln -s ${marchfrplauncher_install_path}/frpc /usr/bin/frpc"
  ln -s ${marchfrplauncher_install_path}/frpc /usr/bin/frpc

  echo "ln -s ${marchfrplauncher_install_path}/marchfrplauncher /usr/bin/marchfrplauncher"
  ln -s ${marchfrplauncher_install_path}/marchfrplauncher /usr/bin/marchfrplauncher

  Finish
}

Finish() {
  echo "MarchFrpLauncher.Linux For ${arch} 已安装完成"
  echo "输入 marchfrplauncher 即可使用"
  exit
}

echo "+---------------------------------------------------------------------
| MarchFrpLauncher.Linux Install
+----------------------------------------------------------------------
| Shell Install Script by OldGodShen
+----------------------------------------------------------------------
"

Check_Arch
Install_MarchFrpLauncher