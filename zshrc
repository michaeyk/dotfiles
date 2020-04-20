# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode)


zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# Disable hostname completion
zstyle ':completion:*' hosts off

source $ZSH/oh-my-zsh.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias vi=/usr/bin/nvim
alias more=less
alias gcal=gcalcli
alias ssh="TERM=screen-256color ssh"

#export LANG=ko_KR.EUC-KR
export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL" 

export MAILCONF=/home/mike/.mutt
export NNN_PLUG='o:fzopen;p:mocplay;d:diffs;m:nmount;n:notes;v:imgview'
export EDITOR=/usr/bin/nvim
export XDG_CONFIG_HOME=/home/mike/.config
export BROWSER=chrome
export GPGKEY=6271B2D8
export PATH="/home/mike/bin:/home/mike/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:\
/opt/java/bin:/opt/java/jre/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:\
/home/mike/android-sdk-linux/platform-tools:$PATH"

eval `keychain --eval --agents ssh id_rsa`
eval `dircolors ~/.dircolors`

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi

