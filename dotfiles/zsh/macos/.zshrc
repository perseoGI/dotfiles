# Path to your oh-my-zsh installation.

export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="agnoster"

export UPDATE_ZSH_DAYS=13

HIST_STAMPS="mm/dd/yyyy"

plugins=(
  archlinux
  git
  history-substring-search
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
)

source $ZSH/oh-my-zsh.sh

## User configuration

# Make <C-P> and <C-N> also search
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

export VISUAL="nvim"
export EDITOR="nvim"
export READER="okular"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export MANPAGER='nvim +Man!'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

#alias nvim=~/sources/nvim-osx64/bin/nvim
alias python=python3.9
alias pip=pip3
PATH="/Users/perseo/Library/Python/3.9/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias v=nvim
alias dotfiles='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'
alias alacritty='WINIT_HIDPI_FACTOR=1 alacritty'

# Verbosity
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	#rm="rm -vI" \
	bc="bc -ql" \
	mkd="mkdir -pv" \
	ffmpeg="ffmpeg -hide_banner"
  rm="trash"


# Use exa, ls made in Rust, with color highlighting
alias l='exa -lagh'
alias ll='exa -lh'
# Also, bat is a very nice cat implementation which integrates a paginator and a syntax highlighter

## Add pip installed packages
PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin"

# LLVM
LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# if [ ! $VIM ]; then
#   # Execute when opening a terminal (outside vim/nvim)
#   neofetch
# fi

export LC_CTYPE=es_ES.UTF-8
export LC_ALL=es_ES.UTF-8


# Dotpyle autocompletion
source ~/.dotpyle-complete.zsh
source $HOME/.cargo/env
source ~/.dotpyle-complete.zsh

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/perseo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/perseo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/perseo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/perseo/google-cloud-sdk/completion.zsh.inc'; fi

export ANDROID_HOME=/Users/perseo/Library/Android/sdk
