# Prompt format bash style
PROMPT="%n@%m %~ %(!.#.$) "

# Some aliases
alias -g L='| less'
alias -g G='| grep'
alias -g GI='|grep -i'
alias -g H='| head'
alias -g T='| tail'

# Extension aliases
alias -s {avi,mpeg,mpg,mov,m2v,AVI}=mplayer 
alias -s {ogg,mp3,wav,wma}=mplayer 
#alias -s {txt,conf)=nano
alias -s {dpf,djvu,ps2}=evince

# Autocorrect comands
setopt CORRECT_ALL
SPROMPT="Ошибка, бро, ты хотел %r вместо %R? ([Y]es/[N]o/[E]dit/[A]bort) "

# Binding Ctrl+arrows 
#bindkey ';5D' backward-word
#bindkey ';5C' forward-word
bindkey '^[Od' backward-word
bindkey '^[Oc' forward-word


# Term title
case $TERM in
 xterm* | rxvt)
  preexec() {
    print -Pn "\e]0;$0\a"
  }
 ;;
esac

# Autocomplete
autoload -Uz compinit
compinit
