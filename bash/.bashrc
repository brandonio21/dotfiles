#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bashrc_work ]; then
  source ~/.bashrc_work
fi

alias ls='ls --color=auto'
alias e='vim'
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

export EDITOR=vim

enable-ipv6() {
	out=$(sysctl net.ipv6.conf.vpn0.disable_ipv6)
	enabled=${out: -1}
	if [[ ${enabled} -ne 0 ]]; then
		sudo sysctl net.ipv6.conf.vpn0.disable_ipv6=0
	fi
}

disable-ipv6() {
	out=$(sysctl net.ipv6.conf.vpn0.disable_ipv6)
	enabled=${out: -1}
	if [[ ${enabled} -ne 1 ]]; then
		sudo sysctl net.ipv6.conf.vpn0.disable_ipv6=1
	fi
}

vpnup() {
  nmcli con up id $vpn
}

vpndown() {
  nmcli con down id $vpn
}

networkreset() {
  vpndown
  disable-ipv6
  enable-ipv6
  vpnup
}

lastchef() {
  fail=$(date -d @"$(jq '.["chef.last_failure_time"]' /var/chef/outputs/chef.last.run_stats)")
  success=$(date -d @"$(jq '.["chef.last_success_time"]' /var/chef/outputs/chef.last.run_stats)")

  echo Last Success: "${success}"
  echo Last Fail:    "${fail}"
}
