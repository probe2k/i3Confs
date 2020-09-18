# prompt script - tried replicating probe_zsh from https://github.com/probe2k/probe_zsh.git
PROMPT='%(!.%F{cyan}%~ %F{red}%B#%b%f .%F{cyan}%~ %F{cyan}❯%F{yellow}❯%F{green}❯%f )'

# set history size and the filesize
HISTSIZE=100000
HISTFILESIZE=2000000
HISTFILE=/home/probe/.zsh_history
SAVEHIST=100000

# color ls
alias ls='ls --color=auto'

# source plugins from ~/.zsh-plugin
source /home/probe/.zsh_plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/probe/.zsh_plugin/zsh-autosuggestions/zsh-autosuggestions.zsh


typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      history-beginning-search-backward
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    history-beginning-search-forward
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
function zle-line-init () {
    echoti smkx
}
function zle-line-finish () {
    echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish

bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
