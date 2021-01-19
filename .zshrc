# Start tmux on initialization.
if [[ -z "$TMUX" && "$TERM_PROGRAM" != "vscode" ]]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/petr/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_DISABLE_COMPFIX=true
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(tmux git git-extra-commands git-auto-fetch history nvm npm ng docker docker-compose autojump thefuck zsh-syntax-highlighting zsh-autosuggestions fzf-tab)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# --------------------------- Custom Configurations ---------------------------

# Set default editor to code
export EDITOR="code"

# PATH
export DENO_INSTALL="/home/petr/.deno"
export PATH=$HOME/.local/bin:$PATH
export PATH="$DENO_INSTALL/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/mnt/c/Users/petrr/AppData/Local/Programs/Microsoft VS Code/bin"
export PATH="$PATH:/mnt/c/Program Files/Docker/Docker/resources/bin"
export PATH="$PATH:/mnt/c/Windows"

zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# --------------------------- Custom aliases ----------------------------------
# UPGRADE ALL!
alias all-up="apt-up; zsh-up; nvm-up; npm-up; deno upgrade; nvim-cfg-up; bit update; pip-up; apt-cl; clr; zsh-rr"

# zsh
alias zsh-cfg="code ~/.zshrc"
alias zsh-rr="exec zsh"
alias zsh-up="omz update --unattended; p10k-up; fzf-up; zsh-syntax-highlighting-up; zsh-autosuggestion-up; zsh-autocomplete-up; git-extra-commands-up; fzf-tab-up"
alias zsh-hs="mv ~/.zsh_history ~/.zsh_history_bad && strings ~/.zsh_history_bad > ~/.zsh_history && fc -R ~/.zsh_history && rm ~/.zsh_history_bad"

alias p10k-up="git -C ~/.oh-my-zsh/custom/themes/powerlevel10k pull --rebase"
alias fzf-up="git -C ~/.fzf pull --rebase"
alias zsh-syntax-highlighting-up="git -C ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting pull --rebase"
alias zsh-autosuggestion-up="git -C ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions pull --rebase"
alias zsh-autocomplete-up="git -C ~/.oh-my-zsh/custom/plugins/zsh-autocomplete pull --rebase"
alias git-extra-commands-up="git -C ~/.oh-my-zsh/custom/plugins/git-extra-commands pull --rebase"
alias fzf-tab-up="git -C ~/.oh-my-zsh/custom/plugins/fzf-tab pull --rebase"
alias tmux-up="rm -fr /tmp/tmux; git clone https://github.com/tmux/tmux.git /tmp/tmux; cd /tmp/tmux; sh autogen.sh; ./configure && make; sudo make install; cd -; rm -fr /tmp/tmux; clr"
alias nvim-up="rm -fr /tmp/nvim; wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -P /tmp/nvim; cd /tmp/nvim; chmod +x nvim.appimage; mv nvim.appimage nvim; sudo mv nvim /usr/local/bin/; cd -; rm -fr /tmp/nvim; clr"
alias go-up="rm -rf /tmp/go; git clone https://github.com/udhos/update-golang /tmp/go; cd /tmp/go; sudo ./update-golang.sh; cd -; rm -fr /tmp/go; clr"

# nvm
alias nvm-up="nvm install node --reinstall-packages-from=node"

# nvim
alias nvim-cfg-up="git -C ~/.config/nvim pull --rebase --autostash"

# pip
alias pip-up="python -m pip install --upgrade pip"

# Basic bash aliases
# alias code="code-insiders"
alias clr="clear"
alias cd..="cd .."
alias exp="explorer.exe ."

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias dev="cd ~/dev"
alias work="cd ~/dev/work"

# Linux aliases
alias apt-up="sudo apt-get update; sudo apt-get upgrade; sudo apt-get dist-upgrade"
alias dist-up="sudo do-release-upgrade"
alias apt-cl="sudo apt-get clean ;sudo apt-get autoclean ;sudo apt-get autoremove"
alias serv-ls="service --status-all"

# Funny time! (cmatrix, hollywood, sl, aafire, toilet)
alias weather="curl http://wttr.in"
alias tron="ssh sshtron.zachlatta.com"
alias map="telnet mapscii.me"
alias fish="asciiquarium"
alias fcow="fortune | cowsay | lolcat"
alias ftux="fortune | cowsay -f tux | lolcat"
alias dragon="git log -1 | cowsay -f dragon-and-cow | lolcat"
alias clock="watch -t -n1 'date +%A%n%x%n%X | figlet -t -c'"
alias starwars="telnet towel.blinkenlights.nl"

# NPM
alias npm-ls="npm list -g --depth=0"
alias npm-up="npm update -g"
alias npm-cv="npm cache verify"

# GIT
alias uncommit="git reset HEAD~1"

# Dev-env aliases
alias mklnsf="ln -s -f ~/dev/work/php/* ~/dev/php"

alias start-ssh="sudo service ssh start"
alias stop-ssh="sudo service ssh stop"

alias start-lamp="sudo service apache2 start; sudo service redis-server start; sudo service mysql start"
alias stop-lamp="sudo service apache2 stop; sudo service redis-server stop; sudo service mysql stop"

alias start-redis="sudo service redis-server start"
alias stop-redis="sudo service redis-server stop"

alias start-mongo="sudo service mongodb start"
alias stop-mongo="sudo service mongodb stop"

alias start-sql="sudo service mysql start"
alias stop-sql="sudo service mysql stop"

alias start-postgres="sudo service postgresql start"
alias stop-postgres="sudo service postgresql stop"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/petr/go/bin/bit bit
