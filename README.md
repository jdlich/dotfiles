## Getting Started With Your Own dotfiles

I put my dotfiles in ~/Code then point to them from within my ~/.bashrc file:

	# .bashrc
	export DOTFILES=~/Code/dotfiles
	source $DOTFILES/bashrc
	
(NOTE: You could put your dotfiles anywhere you want... ~/.dotfiles or somewhere in /usr/local are also worthy places.)

The .bashrc file loads the bashrc (no period) file within my dotfiles which in turn loads my other files:

	# ~/Code/dotfiles/bashrc
	source $DOTFILES/bash/env
	source $DOTFILES/bash/aliases
	source $DOTFILES/bash/completion

And that's pretty much all there is to it.

The idea is to have an ever-evolving and growing collection of scripts and system configuration that is organized and can easily go where you go.

## dotfiles on Github

<https://github.com/search?q=dotfiles&type=Repositories>