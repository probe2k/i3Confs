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

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#alias emu='/home/probe/Android/Sdk/emulator/emulator -avd Pixel_3 -qemu --enable-kvm'
alias scr=' ffmpeg -f x11grab -video_size 1920x1080 -i $DISPLAY -preset ultrafast "/home/probe/rec_`date +%b-%d-%I:%M:%S`.mp4"'
alias scra='ffmpeg -f x11grab -video_size 1920x1080 -i $DISPLAY -f alsa -i default -preset ultrafast "/home/probe/rec_`date +%b-%d-%I:%M:%S`.mp4"'


#if [ "`id -u`" -eq 0 ]; then
#	PS1="\[\033[m\]|\[\e[1;31m\]\u\[\033[m\]|\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\w]> \[\e[0m\]"
#else
#	PS1="\[\033[m\]|\[\e[1m\]\u\[\033[m\]|\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\w]> \[\e[0m\]"
#fi

#if [ "`id -u`" -eq 0 ]; then
#	PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 1)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#else
#	PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#fi

[ "`id -u`" = 0 ] && PS1="\[\033[01;33m\]\w \[\033[01;31m\]❯❯ \[\e[0m\]" || PS1="\[\033[01;33m\]\w \[\033[01;36m\]❯ \[\e[0m\]"

