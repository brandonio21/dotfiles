default: .vimrc
	cp .vimrc ~/.vimrc

install: default
	curl -fLo autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qall
	git clone https://github.com/Lokaltog/powerline-fonts.git
	powerline-fonts/install.sh

