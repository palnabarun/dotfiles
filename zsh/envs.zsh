export CODE_HOME=$HOME/s
export DOTFILES=$CODE_HOME/palnabarun/dotfiles
export EDITOR=nvim
export GPG_TTY=$(tty)

if [[ "$(uname)" == "Darwin" ]]; then
  export GOPATH=$HOME/go
  export PATH="$PATH:$GOPATH/bin"
fi

export PATH="$HOME/.cargo/bin:$PATH"

# TODO: Understand this better and update the python related stuff
mkdir -p $HOME/.envs
export WORKON_HOME=$HOME/.envs
export PROJECT_HOME=$CODE_HOME/palnabarun

if [[ "$(uname)" == "Darwin" ]]; then
  # needed for pipx
  export PATH=$PATH:$HOME/.local/bin
elif [[ "$(uname)" == "Linux" ]]; then
  export PYTHONBINPATH=$HOME/.local/bin
  export PATH=$PYTHONBINPATH:$PATH
fi

# VIRTUALENVWRAPPER_PYTHON=$(which python3)
# source $PYTHONBINPATH/virtualenvwrapper.sh

if [[ "$(uname)" == "Darwin" ]]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi
