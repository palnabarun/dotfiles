# Display switching
if [[ "$(uname)" == "Linux" ]]; then
    alias mo="mons -o && $HOME/.config/polybar/launch.sh"
    alias ml="mons -e left && $HOME/.config/polybar/launch.sh"
    alias ms="mons -s && $HOME/.config/polybar/launch.sh"
fi

# Misc.
alias ds="diff -y --suppress-common-lines"
alias cat=bat

# Git
alias grebase="git stash && git rebase && git stash pop"

# ViM
alias vi=nvim
alias vim=nvim
