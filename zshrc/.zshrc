export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/envs.zsh
source $HOME/.config/zsh/functions.zsh
source $HOME/.config/zsh/plugins.zsh
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# source $HOME/.config/shell/envs.sh
# source $HOME/.config/shell/funcs.sh
# source $HOME/.config/shell/aliases.sh
# source $HOME/.config/shell/path.sh

HISTCONTROL=ignoreboth
setopt histappend
HISTSIZE=10000
HISTFILESIZE=20000
export HISTTIMEFORMAT="%y/%m/%d %T "

bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→

# init starship
eval "$(starship init zsh)"
