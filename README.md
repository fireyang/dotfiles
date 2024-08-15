dotfiles
========

我的配置文件

安装oh my zsh

## vim配置

```
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/vim/neo_vimrc ~/.config/nvim/init.vim
```
* 安装vim-plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
 ```
 * 安装vim插件
 ```
 :PlugInstall
 ```
测试
