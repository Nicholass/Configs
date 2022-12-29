autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

#export PATH=/opt/adt-bundle-linux-x86_64-20140702/eclipse:$PATH
export PATH=~/.npm-global/bin:$PATH
# Set up the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=true
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Prompt format bash style
PROMPT="%m %~ %(!.#.$) "

# Some aliases
alias -g L='| less'
alias -g G='| grep'
alias -g GI='|grep -i --color'
alias -g H='| head -n1'
alias -g T='| tail -n1'

alias d-c='docker-compose'
alias ec='emacsclient -t'
alias refresh='source ~/.zshrc'
alias loadenv='source ~/.env'
alias nscripts='cat package.json| jq .scripts'
alias winesteam='primusrun wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/steam.exe'
#alias zeronet="/home/murzikv/opt/ZeroNet-linux-dist-linux64/ZeroNet.sh >> /dev/null"
# alias emacsc="emacsclient -t"                      # used to be "emacs -nw"
# alias emacsx="emacsclient -a -n"                # used to be "sudo emacs -nw"
# alias emacsn="emacsclient - -a emacs"           # new - opens the GUI with alternate non-daemon

export ALTERNATE_EDITOR="/usr/bin/nano"
export EDITOR="/usr/bin/emacsclient -t"                  # $EDITOR opens in terminal
export VISUAL="/usr/bin/emacsclient"         # $VISUAL opens in GUI mode

# Extension aliases
alias -s {avi,mpeg,mpg,mov,m2v,AVI}=mplayer
alias -s {ogg,mp3,wav,wma}=mplayer
#alias -s {txt,conf)=nano
alias -s {dpf,djvu,ps2}=evince

# Autocorrect comands
setopt CORRECT_ALL
SPROMPT="you mean, %r, not %R? ([Y]es/[N]o/[E]dit/[A]bort) "

# Binding Ctrl+arrows
bindkey ';5D' backward-word
bindkey ';5C' forward-word
bindkey '^[Od' backward-word
bindkey '^[Oc' forward-word
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

[[ -n "${key[Up]}"      ]] && bindkey  "${key[Up]}"  up-line-or-search #history-beginning-search-backward
[[ -n "${key[Down]}"    ]] && bindkey  "${key[Down]}" down-line-or-search #history-beginning-search-forward

# Term title
case $TERM in
 xterm* | rxvt)
  preexec() {
    print -Pn "\e]0;$0\a"
  }
 ;;
esac

export GOPATH="/home/$(whoami)/src/go"
# export PATH=$PATH:$GOPATH/bin

export NVM_DIR="/home/$(whoami)/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#for TRAMP
case "$TERM" in
    "dumb")
        export PS1="> "
        ;;
    xterm*|*rxvt*|eterm*|screen*)
        tty -s && export PS1="%n@%m:%~ %%"
        ;;
esac

# keychain we need to emacs run ssh
# eval `keychain --eval --agents ssh id_rsa`

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin:$HOME/.local/bin/"
eval "$(rbenv init -)"
eval "$(luarocks path)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PYTHONPATH=/usr/lib/python3/dist-packages:/usr/lib/python3/site-packages:$PYTHONPATH
#export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH
