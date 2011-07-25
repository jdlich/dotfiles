Getting Started With Your Own dotfiles
======================================

If you're just throwing everything into `~/.bashrc` and you don't know half of what's in there, something is going to give sooner or later.

It's time you take your computer back.

Here's how I have learned to reign things in a little bit. First, my dotfiles are located in `~/Code` (you could put your dotfiles anywhere such as `~/.dotfiles` or `/usr/local` which are also worthy places).

Now, you'll need something like this in `~/.bash_profile` to begin with:

    # ~/.bash_profile
    if [ -f ~/.bashrc ]; then
       source ~/.bashrc
    fi

*(NOTE: Make sure to read [this](http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html))*

Then comes `.bashrc` which contains:

	# ~/.bashrc
	export DOTFILES=~/Code/dotfiles
	source $DOTFILES/bashrc
	
*(NOTE: The `$DOTFILES` environment variable is set here in case the location of my dotfiles changes ie different system).*

The `.bashrc` loads the `bashrc` file (no period) in my dotfiles which in turn loads other files (in this case, my environment variables, my aliases and functions and my tab completions).

	# ~/Code/dotfiles/bashrc
	source $DOTFILES/bash/env
	source $DOTFILES/bash/aliases
	source $DOTFILES/bash/completion

So, my `~/.bashrc` loads `~/Code/dotfiles/bashrc` which loads `~/Code/dotfiles/bash/{env,aliases,completion}

This allows me to have everything in its place, get it up on Github and take it with me everywhere I go.

Using my Rake Tasks
===================

*(NOTE: If your new to Rake, read [this](http://rake.rubyforge.org/files/doc/rational_rdoc.html) - and [this](http://jasonseifer.com/2010/04/06/rake-tutorial) is also good too with more resources at the bottom).*

A typical Rakefile for a uPortal/tomcat project looks something like this:
	
	# Rakefile
	TOMCAT  = "apache-tomcat-6.0.29" # => path to tomcat root
	UPORTAL = "rel-3-2-patches"      # => path to uportal root
	SKIN    = "uportal3"             # => name of your skin

	%w{ gems uportal tomcat }.each do |tasks|
	  Dir["#{`echo $DOTFILES`.chomp}/tasks/#{tasks}/*"].each { |rakefile| load rakefile }
	end

Run `rake --tasks` to make sure you're good to go (rake equivalent to ant's `ant -p`).
	
dotfiles on Github
==================

Lastly, be sure to steal scripts and aliases from others: <https://github.com/search?q=dotfiles&type=Repositories>