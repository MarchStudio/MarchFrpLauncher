#!/bin/bash
printf "\033c"

Red_Error() {
  echo '================================================='
  printf '\033[1;31;40m%b\033[0m\n' "$@"
  echo '================================================='
  exit 1
}

Uninstall_MarchFrpLauncher() {
  marchfrplauncher_install_path="/opt/MarchFrpLauncher"
  echo "即将开始删除MarchFrpLauncher.Linux"
  sleep 3

  echo "[x] rm -irf ${marchfrplauncher_install_path}"
  rm -irf ${marchfrplauncher_install_path}

  echo "rm -irf /usr/bin/frpc"
  rm -irf /usr/bin/frpc

  echo "rm -irf /usr/bin/marchfrplauncher"
  rm -irf /usr/bin/marchfrplauncher

  Finish
}


Finish() {
  echo "MarchFrpLauncher.Linux 已卸载完成"
  exit
}

echo "+---------------------------------------------------------------------
| MarchFrpLauncher.Linux Uninstall
+----------------------------------------------------------------------
| Shell Uninstall Script by OldGodShen
+----------------------------------------------------------------------
"

Uninstall_MarchFrpLauncher