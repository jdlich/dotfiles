Getting Started With Your Own dotfiles
======================================

If you're just throwing everything into `~/.bashrc` something is going to give sooner or later. Here's how I have learned to reign things in a little bit. 

First, my dotfiles are located in `~/Code` (you could put your dotfiles anywhere such as `~/.dotfiles` or `/usr/local` which are also worthy places).

Now, the first thing is to have the following in `~/.bash_profile`:

	 # ~/.bash_profile
    if [ -f ~/.bashrc ]; then
       source ~/.bashrc
    fi

*(If your curious about the different bash files, read [this](http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html))*

Next, is `.bashrc`:

	# ~/.bashrc
	export DOTFILES=~/Code/dotfiles
	source $DOTFILES/bashrc
	
*(The `$DOTFILES` environment variable is set here in case the location of my dotfiles changes i.e. different system.)*

Which points to the `bashrc` file (no period) in my dotfiles, which, in turn, loads my dotfiles:

	# ~/Code/dotfiles/bashrc
	source $DOTFILES/bash/env
	source $DOTFILES/bash/aliases
	source $DOTFILES/bash/completion

So, `.bash_login` loads `.bashrc` which loads `bashrc` which loads my dotfiles... which can now be organized, version controlled, published, etc.

There are, of course, [other](http://dottedmag.net/2011/05/29/dotfiles-setup/) [ways](http://www.splitbrain.org/blog/2011-02/16-managing_dotfiles_with_dropbox) to do [this](https://github.com/jcoglan/dotfiles/blob/master/Rakefile).

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

Lastly, far greater dotfiles can be found elsewhere on GitHub: <https://github.com/search?q=dotfiles&type=Repositories>