brandonio21 dotfiles
====================
The main purpose of this repo is to hold the configuration files that I use
across my systems. Of course, if you want to use these configuration files,
you're more than welcome to.

Installation
------------
To install, run the configuration file and use GNU stow.  
```
./configure.sh
stow i3
stow x
stow termite
stow bash
stow compton
stow dunst
stow pulse
stow vim
stow walle
stow zsh
cd etc && stow netctl && cd ..
cd etc && stow download-sweeper && cd ..
cd systemd && install.sh && cd ..
```

Details
-------
This repo contains settings for the following:  
* vim
* i3wm
* bash
* termite
* compton
* dunst
* netctl
* download-sweeper
* pulse audio
* walle
* xorg
* zsh
* Some systemd services/timers

Dependencies
------------
Note that currently this repo has no way of installing dependencies. Will work
on this soon

Screenshots
-----------
![Bare Desktop](screenshots/bare.png)

![Busy...](screenshots/top.png)
