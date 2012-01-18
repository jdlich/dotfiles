## Getting Started With Your Own dotfiles

After you fork this project, set the location of your dotfiles in `bashrc`:

	# bashrc
	export DOTFILES=~/Code/dotfiles

Next thing is to have the following in `~/.bash_profile`:

	# ~/.bash_profile
    if [ -f ~/.bashrc ]; then
       source ~/.bashrc
    fi

*(If your curious about the different bash files, read [this](http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html))*
	
Finally, run the install script using `rake`:

	rake install
	
## dotfiles on Github

Lastly, far greater dotfiles can be found elsewhere on GitHub: <https://github.com/search?q=dotfiles&type=Repositories>

## Links

* Homebrew: https://github.com/mxcl/homebrew/wiki/installation
* Ant: http://archive.apache.org/dist/ant/binaries/
* Maven: http://maven.apache.org/download.html