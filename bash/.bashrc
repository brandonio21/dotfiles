#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'
export PROJECT_HOME=~/Dropbox/Python/projects
export WORKON_HOME=~/Dropbox/Python/virtualenvs
source /usr/bin/virtualenvwrapper.sh
eval $(dircolors ~/.dircolors)
