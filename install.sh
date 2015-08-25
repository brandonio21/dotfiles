#!/bin/bash
###############################################################################
# brandonio21 dotfiles install script
###############################################################################
printf "%s: " "Are you running laptop/desktop?"
read machine
printf "%s..." "Copying CONFIG file"
cp i3/config.${machine} i3/config
printf "%s\n%s..." "[DONE]" "Copying CONKYRC file"
cp i3/conkyrc.${machine} i3/conkyrc
printf "%s\n%s\n" "[DONE]" "Copyring BASHRC file"
cp .bashrc ~/.bashrc
printf "%s\n" "Prompting PACAUR for proper pacakges"
pacaur -S conky feh i3-wm i3status ttf-font-awesome dzen2 curl xbacklight dropbox-cli rofi

printf "%s (y/n)" "Would you like to install useless gaps?"
read gapsAnswer
if [ "$gapsAnswer" == "y" ]; then
	`make -C i3/useless-gaps/make install`
fi

printf "%s (y/n)" "Would you like to fix Dropbox file limitations?"
read dropboxAnswer
if [ "$dropboxAnswer" == "y" ]; then
	`echo "fs.inotify.max_user_watches=100000" | sudo tee -a /etc/sysctl.d/99-sysctl.conf`
	`sudo sysctl --system`
fi

printf "%s: " "What is your gmail email?"
read gmailEmail
printf "%s: " "What is your gmail password?"
read -s gmailPassword
echo "#!/bin/bash" > "${PWD}/i3/bin/gmail.sh"
echo "EMAIL=${gmailEmail}" >> "${PWD}/i3/bin/gmail.sh"
echo "DETAILS=${gmailPassword}" >> "${PWD}/i3/bin/gmail.sh"
`cat "${PWD}/bin/gmailTemplate.sh" >> "${PWD}/i3/bin/gmail.sh"`
chmod +x "${PWD}/i3/bin/gmail.sh"

fc-cache -vf
mkdir ~/.i3
cp -r i3/* ~/.i3

printf "%s\n" "Installing vim features"
curl -fLo vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
git clone https://github.com/Lokaltog/powerline-fonts.git vim/powerline-fonts
vim/powerline-fonts/install.sh
mkdir ~/.vim
cp -r vim/* ~/.vim
