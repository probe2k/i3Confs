#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

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

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias emu='/home/probe/Android/Sdk/emulator/emulator -avd Pixel_3 -qemu --enable-kvm'

#PS1=$(if [[ ${EUID} == 0 ]]; then echo "\n[\[\e[31m\]\e[1m\u\[\e[m\]] [\[\e[36m\]\h\[\e[m\]] [\[\e[34m\]\w\[\e[m\]]\n\[\e[33m\]# >\[\e[m\] "; else echo "\n[\[\e[32m\]\u\[\e[m\]] [\[\e[36m\]\h\[\e[m\]] [\[\e[34m\]\w\[\e[m\]]\n\[\e[93m\]$ >\[\e[m\] "; fi)

#PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"


if [ "`id -u`" -eq 0 ]; then
    PS1="\[\033[m\]|\[\e[1;31m\]\u\[\033[m\]|\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\w]> \[\e[0m\]"
else
	PS1="\[\033[m\]|\[\e[1m\]\u\[\033[m\]|\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\w]> \[\e[0m\]"
fi

source "/home/probe/.local/share/blesh/ble.sh" --attach=none

# ... other bashrc settings ...

# Add the following line at the end of bashrc
[[ ${BLE_VERSION-} ]] && ble-attach

