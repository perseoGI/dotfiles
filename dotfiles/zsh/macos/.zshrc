# Path to your oh-my-zsh installation.
# zmodload zsh/zprof

export ZSH="${HOME}/.oh-my-zsh"

# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_AUTO_UPDATE=true

export UPDATE_ZSH_DAYS=13

# HIST_STAMPS="mm/dd/yyyy"

plugins=(
  git
  history-substring-search
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
  zsh-vi-mode
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit

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
        v=nvim \
        l="eza -l --icons --git -a"
        lt="eza --tree --level=2 --long --icons --git"
        ltree="eza --tree --level=2  --icons --git"
        ll='eza -lh' \
	cp="cp -iv" \
        conandev="$HOME/sources/conan-io/.venv/bin/conan" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	mkd="mkdir -v" \
	ffmpeg="ffmpeg -hide_banner" \
        # rm="trash" \
        # brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# if [ ! $VIM ]; then
#   # Execute when opening a terminal (outside vim/nvim)
#   neofetch
# fi

# NVM
# export NVM_DIR=~/.nvm
# TAKES a ton of time to load
# source $(brew --prefix nvm)/nvm.sh

export ANDROID_HOME=/Users/perseo/Library/Android/sdk
export PATH=$PATH:/Users/perseo/Library/Android/sdk/emulator

# Python pyenv 
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.rd/bin:$HOME/Library/Android/sdk/platform-tools/:/opt/homebrew/opt/ruby/bin:$PATH"

# Dotpyle autocompletion
#source ~/.dotpyle-complete.zsh
# source $HOME/.cargo/env
# source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
# source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"


export ANDROID_NDK_HOME="/opt/homebrew/share/android-ndk"

# Zscaler CA certificate to allow conan/python requests validate zscaler cert
#
export CURL_CA_BUNDLE=/opt/homebrew/Cellar/ca-certificates/2026-05-14/share/ca-certificates/cacert.pem

# zprof

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# . "$HOME/.atuin/bin/env"
#
eval "$(atuin init zsh)"

export GPG_TTY=$(tty)


# eval "$(oh-my-posh init zsh --config catppuccin_mocha)"
# eval "$(oh-my-posh init zsh --config ~/.config/catppuccin_mocha_custom.omp.json)"
eval "$(oh-my-posh init zsh --config 1_shell)"

export NODE_USE_SYSTEM_CA=1
export NODE_EXTRA_CA_CERTS="/Users/perseo/IT-Certs/package-route.pem"
export UV_NATIVE_TLS=true
export UV_SYSTEM_CERTS=true
export REQUESTS_CA_BUNDLE="/Users/perseo/IT-Certs/package-route.pem"


# PIP_CERT=/etc/ssl/certs/ca-certificates.crt
export PIP_INDEX_URL=https://jfrogrepo24.jfrog.io/artifactory/api/pypi/pypi-virtual/simple
export PIP_TRUSTED_HOST=jfrogrepo24.jfrog.io
