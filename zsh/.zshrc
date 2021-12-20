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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=vim
else
  export EDITOR=nvim
fi

# Use ccache whenever possible to make recompilation faster
[[ ! -d /usr/lib/ccache ]] || export PATH="/usr/lib/ccache/bin":${PATH}

# Add .local if it exist
[[ ! -d ~/.local/bin ]] || export PATH="~/.local/bin":${PATH}
[[ ! -d ~/.local/lib ]] || export LD_LIBRARY_PATH=~/.local/lib:${LD_LIBRARY_PATH}
[[ ! -d ~/.local/lib/pkgconfig ]] || export PKG_CONFIG_PATH=~/.local/lib/pkgconfig:${PKG_CONFIG_PATH}

# Add cargo bin to path if exist
[[ ! -d ~/.cargo/bin ]] || export PATH="${HOME}/.cargo/bin":${PATH}

# to make Zsh terminal not have shared history
# just like how it works in bash
setopt no_share_history

# Ignore following commands in history so it doesn't get full so fast
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..|clear|man|man *|[n,]vi[m,]|[n,]vi[m,] *)"

# Use exa as more superior ls
# if it's available
if [ -x "$(command -v exa)" ]; then
  alias ls='exa --color=always --group-directories-first'
  alias ll='ls -l --git'        # Long format, git status
  alias l='ll -a'               # Long format, all files
  alias lr='ll -T'              # Long format, recursive as a tree
  alias lx='ll -sextension'     # Long format, sort by extension
  alias lk='ll -ssize'          # Long format, largest file size last
  alias lt='ll -smodified'      # Long format, newest modification time last
  alias lc='ll -schanged'       # Long format, newest status change (ctime) last
fi

# Use bat as more superior cat if it's available
if [ -x "$(command -v bat)" ]; then
  alias cat='bat --theme=Dracula'
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize each devices, especially one that suppose to be private
[[ ! -f ~/.$(hostname).zsh ]] || source ~/.$(hostname).zsh

# Run DT's colorscript if it exist
if [ -x "$(command -v colorscript random )" ]; then
  colorscript random
fi

alias kitty_ssh="kitty +kitten ssh"

# alias to proper clear in tmux
if [[ $TMUX ]]; then
  alias clear='clear && tmux clear-history'
fi
