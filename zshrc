if [ "$TMUX" = "" ]; then tmux attach -t hellothere || tmux new -s hellothere; fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="common"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias rm="echo "This is not the command you are looking for."; false"

dots=$HOME/Projects/dotfiles

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

pgrep fswatch &> /dev/null
if [ $? -eq 1 ]; then
fswatch $HOME/Projects/dotfiles/nvim | xargs -n1 -I{} $HOME/Projects/dotfiles/onupdate.sh &!
fi
