#!/bin/sh
echo "---------------------------------------------------------"
echo "开始安装"
echo "---------------------------------------------------------"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh
fi


exit 0
