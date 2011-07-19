*Getting Started With Your Own Dotfiles*

I like to put my dotfiles in ~/Code and then point to them from within my ~/.bashrc file like so:

	# .bashrc
	export DOTFILES=~/Code/dotfiles
	source $DOTFILES/bashrc

This loads the bashrc file within my dotfiles which in turn loads my other files:

	# ~/Code/dotfiles/bashrc
	source $DOTFILES/bash/env
	source $DOTFILES/bash/aliases
	source $DOTFILES/bash/completion