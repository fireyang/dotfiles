set fish_greeting
set -x PATH /opt/homebrew/bin $PATH ~/.asdf/installs/python/3.10.0/bin/
set -x PATH $PATH /Users/fireyang/.asdf/installs/elixir/1.13.4/.mix/escripts/
set -x PATH $PATH /Users/fireyang/.fly/bin/
set -x PATH $PATH /Users/fireyang/bin/
set -x PATH $PATH /opt/homebrew/Cellar/neovim/HEAD-01fc509/bin/
set -x PATH $PATH ~/.asdf/installs/python/3.8.12/bin/
alias vi="nvim"
alias vim="nvim"
alias s="kitty +kitten ssh"
alias ssh_o="ssh -oHostKeyAlgorithms=+ssh-dss"
alias cat="bat -p"

starship init fish | source

source ~/.asdf/asdf.fish
set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin
. ~/.asdf/plugins/java/set-java-home.fish
set -gx JDK_ROOT "$JAVA_HOME/.."
set -gx JAVA_ROOT "$JAVA_HOME/.."

source ~/.config/fish_local.fish
bass source /Users/fireyang/tools/test.sh

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/Users/fireyang/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

function vcode
  open -a "Visual Studio Code.app" $argv
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniforge/base/bin/conda
    eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<


function uao
    bass ". ~/.config/fish/spring.sh && uao" $argv
end

function jlab
    bass "cd ~/work/jupyter && jupyter lab" $argv
end
