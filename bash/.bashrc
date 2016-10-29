#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'

dircolorsExists=$(type dircolors)
if [ dircolorsExists = 0 ]; then
	eval $(dircolors ~/.dircolors)
fi

export TERM=xterm-256color
