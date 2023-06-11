if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi

source ~/.profile

if [ -d "$HOME/.config/composer/vendor/bin" ]; then
  PATH="$PATH:$HOME/.config/composer/vendor/bin"
fi
