#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'

if [ -e "/usr/bin/virtualenvwrapper.sh" ]; then
	export PROJECT_HOME=~/Dropbox/Python/projects
	export WORKON_HOME=~/Dropbox/Python/virtualenvs
	export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh
	source /usr/bin/virtualenvwrapper_lazy.sh
fi

dircolorsExists=$(type dircolors)
if [ dircolorsExists = 0 ]; then
	eval $(dircolors ~/.dircolors)
fi


PATH=$PATH:/home/brandon/.cargo/bin

set -o vi

if [ "${TMUX}" == "" ]; then
  export TERM=xterm-256color
else
  export TERM=screen-256color
fi
