# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Add user program directories to *PATH environment variables
if [ -d "${HOME}/bin" ]; then
  PATH="${HOME}/bin:${PATH}"
fi

if [ -d "${HOME}/.local/bin" ]; then
  PATH="${HOME}/.local/bin:${PATH}"
fi

if [ -d "${HOME}/man" ]; then
  MANPATH="${HOME}/man:${MANPATH}:"
fi

if [ -d "${HOME}/info" ]; then
  INFOPATH="${HOME}/info:${INFOPATH}:"
fi

# Add application and vendor bins to PATH
if [ -d "${APP}/bin" ]; then
  PATH="${PATH}:${APP}/bin"
fi

if [ -d "${APP}/vendor/bin" ]; then
  PATH="${PATH}:${APP}/vendor/bin"
fi

# Add global composer bin to PATH (not needed for zsh)
if [ -z "${ZSH_VERSION}" ]; then
  if [ -d "${HOME}/.composer/vendor/bin" ]; then
    PATH="${PATH}:${HOME}/.composer/vendor/bin"
  fi

  if [ -d "${HOME}/.config/composer/vendor/bin" ]; then
    PATH="${PATH}:${HOME}/.config/composer/vendor/bin"
  fi
fi