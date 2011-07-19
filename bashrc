source $DOTFILES/bash/env
source $DOTFILES/bash/aliases
source $DOTFILES/bash/completion

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi