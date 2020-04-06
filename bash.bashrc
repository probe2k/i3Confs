#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

cd

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\e[95m\\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\] "

#PS1="\n[\[\e[31m\]\u\[\e[m\]] [\[\e[36m\]\h\[\e[m\]] [\[\e[34m\]\w\[\e[m\]]\n\[\e[35m\]\e[1m# >\[\e[m\] "

alias ls='ls --color=auto'

# neofetch --color_blocks off

PS1=$(if [[ ${EUID} == 0 ]]; then echo "\n[\[\e[31m\]\e[1m\u\[\e[m\]] [\[\e[36m\]\h\[\e[m\]] [\[\e[34m\]\w\[\e[m\]]\n\[\e[35m\]# >\[\e[m\] "; else echo "\n[\[\e[32m\]\u\[\e[m\]] [\[\e[36m\]\h\[\e[m\]] [\[\e[34m\]\w\[\e[m\]]\n\[\e[35m\]$ >\[\e[m\] "; fi)

