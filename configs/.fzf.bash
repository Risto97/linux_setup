# Setup fzf
# ---------
if [[ ! "$PATH" == */home/risto/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/risto/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/risto/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/risto/.fzf/shell/key-bindings.bash"
