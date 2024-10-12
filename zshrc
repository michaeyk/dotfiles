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
plugins=(git vi-mode virtualenv zsh-syntax-highlighting zsh-autosuggestions)

# zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# oh-my-zsh runs over this alias, set in .oh-my-zsh/custom
# bindkey '^ ' autosuggest-accept 

alias vi=/usr/bin/nvim
alias hx=helix
alias vim='nix run $HOME/nix/neve/'
alias weather="curl wttr.in/80108"
alias nnn='nnn -ea'
alias gcob='git branch | fzf | xargs git checkout'
alias lg=lazygit
alias cheat=cht.sh
alias ssh='TERM=tmux ssh'
alias sxiv=nsxiv
alias cd=z
alias hg='history | grep '
alias cat=bat

export LC_ALL=en_US.UTF-8 
export LANG="$LC_ALL" 

export NNN_PLUG='o:fzopen;d:diffs;m:nmount;p:preview-tui;w:wall;i:imgview;c:mp3conv'
export NNN_COLORS="2136"
export NNN_BMS="d:~/Downloads;w:~/Pictures"
export FZF_DEFAULT_COMMAND="fd --type f"
export EDITOR=/usr/bin/helix
export VISUAL=/usr/bin/helix
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

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
gpg-connect-agent updatestartuptty /bye >/dev/null

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pywal
# (cat ~/.cache/wal/sequences &)

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

eza_params=('--git' '--icons' '--classify' '--group-directories-first' '--time-style=long-iso' '--group' '--color-scale')
alias ls='eza $eza_params'
alias l='eza --git-ignore $eza_params'
alias ll='eza --all --header --long $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias la='eza -lbhHigUmuSa'
alias lx='eza -lbhHigUmuSa@'
alias lt='eza --tree $eza_params'
alias tree='eza --tree $eza_params'

source $ZSH/oh-my-zsh.sh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/mike/.oh-my-zsh/completions/_bun" ] && source "/home/mike/.oh-my-zsh/completions/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
