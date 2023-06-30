# eval `keychain --eval --agents ssh id_ed25519_sk id_rsa`
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode virtualenv zsh-syntax-highlighting fzf-tab zsh-autosuggestions)

# fzf-tab 
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# oh-my-zsh runs over this alias, set in .oh-my-zsh/custom
# bindkey '^ ' autosuggest-accept 

alias vi=/usr/bin/nvim
alias vim=/usr/bin/nvim
alias more=less
alias weather="curl wttr.in/80108"
alias nnn='nnn -ea'
alias gcob='git branch | fzf | xargs git checkout'
alias lg=lazygit
alias cheat=cht.sh
alias ssh='TERM=tmux ssh'
# oh-my-zsh runs over this alias, set in .oh-my-zsh/custom
#alias gc=gcalcli

#export LANG=ko_KR.EUC-KR
export LC_ALL=en_US.UTF-8 
export LANG="$LC_ALL" 

export MAILCONF=/home/mike/.config/mutt
export NNN_PLUG='o:fzopen;p:mocplay;d:diffs;m:nmount;t:preview-tui;w:wall;i:imgview;c:mp3conv'
export NNN_COLORS="2136"
export NNN_BMS="d:~/Downloads;w:~/Pictures"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export XDG_CONFIG_HOME=/home/mike/.config
export BROWSER=firefox
export GPGKEY=6271B2D8
export GPG_TTY=`tty`
# export TERM=tmux
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:\
/opt/java/bin:/opt/java/jre/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:\
$HOME/.cargo/bin:$PATH"

if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pywal
# (cat ~/.cache/wal/sequences &)

source $ZSH/oh-my-zsh.sh
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
