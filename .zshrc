# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="dpoggi"
ZSH_THEME="miloshadzic"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cdh="cd /Volumes/hd2"
alias blog="cd /Volumes/hd2/work/blog/fireyang.github.com"
alias mvim='open -a MacVim'

hash -d hd2="/Volumes/hd2"
hash -d knight="/Volumes/hd2/workspace/knight"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git osx autojump python node brew)
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.bash_fy

# Customize to your needs...
export PATH=$PATH:/usr/local/share/npm/bin:/opt/local/bin:/opt/local/sbin:/Volumes/hd2/flex_sdk_4.6_new/bin:/Volumes/hd2/flex_sdk_4.6_new/:/Users/fireyang/bin/:somepath:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/Users/fireyang/.rvm/bin
export PATH=/usr/local/bin:/usr/local/mysql/bin:$PATH
#erlang
export PATH=$PATH:/Volumes/hd2/erlang_kerl/erlang/bin
#quick-cocos2d-x
export QUICK_COCOS2DX_ROOT=/Volumes/hd2/code_source/quick-cocos2d-x

[[ -s /Users/fireyang/.nvm/nvm.sh ]] && . /Users/fireyang/.nvm/nvm.sh # This loads NVM