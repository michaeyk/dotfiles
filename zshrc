eval `keychain --eval --agents ssh id_rsa`
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(git vi-mode virtualenv zsh-autosuggestions zsh-syntax-highlighting)

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# Disable hostname completion
zstyle ':completion:*' hosts off

source $ZSH/oh-my-zsh.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

bindkey '' autosuggest-accept 

alias vi=/usr/bin/nvim
alias more=less
alias gc=gcalcli
alias weather="curl wttr.in/80108"
alias ssh="TERM=screen-256color ssh"
alias nnn='nnn -ea'
alias gcob='git branch | fzf | xargs git checkout'
alias cheat=cht.sh

#export LANG=ko_KR.EUC-KR
export LC_ALL=en_US.UTF-8 
export LANG="$LC_ALL" 

export MAILCONF=/home/mike/.config/mutt
export NNN_PLUG='o:fzopen;p:mocplay;d:diffs;m:nmount;t:preview-tui;w:wall;i:imgur'
export NNN_COLORS="2136"
export NNN_BMS="d:~/Downloads;w:~/Pictures/Wal"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export XDG_CONFIG_HOME=/home/mike/.config
export BROWSER=brave
export GPGKEY=6271B2D8
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:\
/opt/java/bin:/opt/java/jre/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:\
$HOME/.gem/ruby/2.7.0/bin:$PATH"

if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

eval `dircolors ~/.dircolors`

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

