# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setup oh-my-zsh
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  archlinux
  autojump
  fzf
  ripgrep
  git
  systemd
  tmux
)
source $ZSH/oh-my-zsh.sh

# Setup default program to edit stuff
if [ -x "$(command -v neovide)" ]; then
  # If neovide exist
  export VISUAL="neovide --multigrid"
  export WINIT_UNIX_BACKEND=x11
  alias v="neovide --multigrid"
else
  export VISUAL="code"
  alias v="nvim"
fi
export EDITOR="nvim"

# Use ccache whenever possible to make recompilation faster
[[ ! -d /usr/lib/ccache ]] || export PATH="/usr/lib/ccache/bin":${PATH}

# Add cargo bin to path if exist
[[ ! -d ~/.cargo/bin ]] || export PATH="${HOME}/.cargo/bin":${PATH}

# to make Zsh terminal not have shared history
# just like how it works in bash
setopt no_share_history

# Ignore following commands in history so it doesn't get full so fast
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

# Use exa as more superior ls
# if it's available
if [ -x "$(command -v exa)" ]; then
  alias ls='exa -al --color=always --group-directories-first' # my preferred listing
  alias la='exa -a --color=always --group-directories-first'  # all files and dirs
  alias ll='exa -l --color=always --group-directories-first'  # long format
  alias lt='exa -aT --color=always --group-directories-first' # tree listing
  alias l.='exa -a | egrep "^\."'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Run DT's colorscript if it exist
if [ -x "$(command -v colorscript random )" ]; then
  colorscript random
fi

alias kitty_ssh="kitty +kitten ssh"
