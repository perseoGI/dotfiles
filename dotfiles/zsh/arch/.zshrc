# Path to your oh-my-zsh installation.

export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="agnoster"
ZSH_TMUX_AUTOSTART=true

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
    docker
    docker-compose
    tmux
)

source $ZSH/oh-my-zsh.sh

## User configuration

# Make <C-P> and <C-N> also search
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

export VISUAL="nvim"
export EDITOR="nvim"
export READER="okular"
export TERMINAL="alacritty"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
#export MANPAGER='nvim +Man!'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias pac='sudo pacman -S'
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
	ffmpeg="ffmpeg -hide_banner" \
    # Use exa, ls made in Rust, with color highlighting
  l='exa -lagh'\
  ll='exa -lh' \
  du='dust' \
  df='duf' \
  ping='gping' \
  ps='process' \
  dig='dog'



# Also, bat is a very nice cat implementation which integrates a paginator and a syntax highlighter


# Export custom script and arm compiler
#PATH=$PATH:/home/perseo/scripts:/usr/local/arm/gcc-arm-none-eabi-4_9-2015q3/bin
#
## Add pip installed packages
PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin:/home/perseo/.local/share/gem/ruby/3.0.0/bin"
PATH="/opt/clang-format-static:$PATH"
#
#PATH="/home/perseo/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/perseo/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/perseo/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/perseo/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/perseo/perl5"; export PERL_MM_OPT;
#
## Export GNAT compiler
#PATH=$PATH:/Users/Perseo/opt/GNAT/2020/bin
#
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export PATH="$HOME/.poetry/bin:$PATH"

if [ ! $VIM ]; then
  # Execute when opening a terminal (outside vim/nvim)
  # neofetch
fi


source ~/.workrc
#source /home/perseo/.config/broot/launcher/bash/br

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select
