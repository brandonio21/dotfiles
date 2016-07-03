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
```

Details
-------
This repo contains settings for the following:  
* vim
* i3wm
* bash
* termite

Dependencies
------------
Note that currently this repo has no way of installing dependencies. Will work
on this soon

Stow-Wrapper
------------
In order to solve a small design problem with stow, I have created stow_wrapper.sh,
which allows the user to create per-package .stowrc files that allow the
package to go anywhere on the system. Use stow_wrapper.sh whenever installing
a package like such:
```
./stow_wrapper.sh <packageName> <args>
```
For instance
```
./stow_wrapper.sh netctl
```
Or
```
./stow_wrapper.sh netctl -D
```

Screenshots
-----------
![Bare Desktop](screenshots/bare.png)

![Launching a program](screenshots/busylaunch.png)

![Viewing Top](screenshots/top.png)
