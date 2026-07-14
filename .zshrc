# Include common commonrc settings
[[ -e ~/.commonrc ]] && emulate sh -c 'source ~/.commonrc'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh/

export DEFAULT_USER=`whoami`
#export TERM="tmux-256color"
export ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(archlinux
	bundler
	docker
	jsontools
	vscode web-search
	# k
	tig
	battery
	gitfast
	colored-man-pages
	colorize
	command-not-found
	cp
	dirhistory
	# autojump
	sudo
	zsh-syntax-highlighting
	zsh-autosuggestions
)
# /!\ zsh-syntax-highlighting and then zsh-autosuggestions must be at the end

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte-2.91.sh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# opencode
export PATH=/home/daniel/.opencode/bin:$PATH
