#!/bin/bash
package=$1
user=$(whoami)
cd $package
shift
if [ $user == "root" ]; then
	sudo stow $@ $package
else
	stow $@ $package
fi
