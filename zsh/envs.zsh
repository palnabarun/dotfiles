export CODE_HOME=$HOME/s
export DOTFILES=$CODE_HOME/palnabarun/dotfiles
export EDITOR=nvim
export GPG_TTY=$(tty)

if [[ "$(uname)" == "Darwin" ]]; then
  # TODO: These variables don't seem to be required on MacOS. Verify why!
  export GOPATH=$HOME/go
  export PATH=$PATH:~/.local/go/bin
  export PATH="$PATH:$GOPATH/bin"
fi

export PATH="$HOME/.cargo/bin:$PATH"

mkdir -p $HOME/.envs
export WORKON_HOME=$HOME/.envs
export PROJECT_HOME=$CODE_HOME/palnabarun

if [[ "$(uname)" == "Darwin" ]]; then
  # TODO: This needs to be properly done.
  export PYTHONBINPATH=$HOME/Library/Python/3.11/bin
elif [[ "$(uname)" == "Linux" ]]; then
  export PYTHONBINPATH=$HOME/.local/bin
fi

export PATH=$PYTHONBINPATH:$PATH
VIRTUALENVWRAPPER_PYTHON=$(which python3)
source $PYTHONBINPATH/virtualenvwrapper.sh

if [[ "$(uname)" == "Darwin" ]]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi
