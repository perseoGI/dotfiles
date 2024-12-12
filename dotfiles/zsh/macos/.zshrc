# Path to your oh-my-zsh installation.

export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="agnoster"

export UPDATE_ZSH_DAYS=13

HIST_STAMPS="mm/dd/yyyy"

plugins=(
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

export XDG_CONFIG_HOME=~/.config
export LC_CTYPE=es_ES.UTF-8
export LC_ALL=es_ES.UTF-8

# Verbosity
alias \
        alacritty='WINIT_HIDPI_FACTOR=1 alacritty' \
        v=nvim \
        l='eza -lagh' \
        ll='eza -lh' \
	cp="cp -iv" \
        conandev="$HOME/sources/conan-io/venv/bin/conan" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	mkd="mkdir -v" \
	ffmpeg="ffmpeg -hide_banner" \
        # rm="trash" \
        brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# if [ ! $VIM ]; then
#   # Execute when opening a terminal (outside vim/nvim)
#   neofetch
# fi

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export ANDROID_HOME=/Users/perseo/Library/Android/sdk
export PATH=$PATH:/Users/perseo/Library/Android/sdk/emulator

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.rd/bin:$HOME/Library/Android/sdk/platform-tools/:/opt/homebrew/opt/ruby/bin:$PATH"

# Dotpyle autocompletion
#source ~/.dotpyle-complete.zsh
source $HOME/.cargo/env
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"


export ANDROID_NDK_HOME="/opt/homebrew/share/android-ndk"

# Zscaler CA certificate to allow conan/python requests validate zscaler cert
export REQUESTS_CA_BUNDLE=/opt/homebrew/Cellar/ca-certificates/2024-11-26/share/ca-certificates/cacert.pem
export CURL_CA_BUNDLE=/opt/homebrew/Cellar/ca-certificates/2024-11-26/share/ca-certificates/cacert.pem
