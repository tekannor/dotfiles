if [ "$TMUX" = "" ]; then tmux attach -t general || tmux new -s general; fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="common"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias rm='echo "This is not the command you are looking for."; false'
