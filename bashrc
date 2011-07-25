source $DOTFILES/bash/{env,aliases,completion}

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi