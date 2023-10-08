# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setup oh-my-zsh
export ZSH="${HOME}/.oh-my-zsh"
if [ "$TERM" = "linux" ] || [ ! -d ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k ]; then
  ZSH_THEME="flazz"
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi
plugins=(
  archlinux
  autojump
  fzf
  history
  ripgrep
  git
  systemd
  tmux
)
source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=vim
else
  export EDITOR=nvim
fi
# Setup default program to edit
export VISUAL="code --wait"
alias v="nvim"

. /etc/os-release
case "$ID" in
  # If it's Ubuntu Linux machine
  ubuntu)
    # Use ccache whenever possible to make recompilation faster
    [[ ! -d /usr/lib/ccache ]] || export PATH="/usr/lib/ccache/bin":${PATH}

    # Use distcc whenever possible
    [[ ! -d /usr/lib/distcc ]] || export PATH="/usr/lib/distcc/bin":${PATH}
esac

# Add .local if it exist
[[ ! -d ${HOME}/.local/bin ]] || export PATH="${HOME}/.local/bin":${PATH}
[[ ! -d ${HOME}/.local/lib ]] || export LD_LIBRARY_PATH=${HOME}/.local/lib:${LD_LIBRARY_PATH}
[[ ! -d ${HOME}/.local/lib/pkgconfig ]] || export PKG_CONFIG_PATH=${HOME}/.local/lib/pkgconfig:${PKG_CONFIG_PATH}

# Add cuda {bin,lib,lib64} if it exists
[[ ! -d /usr/local/cuda/bin ]] || export PATH="/usr/local/cuda/bin":${PATH}
[[ ! -d /usr/local/cuda/lib ]] || export LD_LIBRARY_PATH=/usr/local/cuda/lib:${LD_LIBRARY_PATH}
[[ ! -d /usr/local/cuda/lib64 ]] || export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}

# Add cargo bin to path if exist
[[ ! -d ~/.cargo/bin ]] || export PATH="${HOME}/.cargo/bin":${PATH}

# to make Zsh terminal not have shared history
# just like how it works in bash
setopt no_share_history

# Ignore following commands in history so it doesn't get full so fast
export HISTORY_IGNORE="(ls|ll|cd|pwd|exit|sudo reboot|history|cd -|cd ..|clear|man|man *|[n,]vi[m,]|[n,]vi[m,] *)"

# Use exa as more superior ls
# if it's available
if [ -x "$(command -v eza)" ]; then
  alias ls='eza --color=always --group-directories-first'
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

# Use difft as more superior diff if it's available
if [ -x "$(command -v difft)" ]; then
  export GIT_EXTERNAL_DIFF=difft
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize each devices, especially one that suppose to be private
[[ ! -f ~/.$(hostname).zsh ]] || source ~/.$(hostname).zsh

# Run DT's colorscript if it exist
if [ -x "$(command -v colorscript random )" ]; then
  colorscript random
fi

# Automatically generate compile commands on catkin workspace root, useful for clangd
catkin_compile_commands(){( set -e
  curr_ws=$(catkin locate)
  jq -s 'map(.[])' ${curr_ws}/**/compile_commands.json > ${curr_ws}/compile_commands.json
  echo "${curr_ws}/compile_commands.json created"
)}

alias kitty_ssh="kitty +kitten ssh"
# Automatically source current ROS workspace
alias source_devel='source $(catkin locate)/devel/setup.zsh'
alias source_install='source $(catkin locate)/install/setup.zsh'

# alias to proper clear in tmux
if [[ $TMUX ]]; then
  alias clear='clear && tmux clear-history'
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ ! -d ~/.rvm/bin ]] || export PATH="$PATH:$HOME/.rvm/bin"

# https://code.visualstudio.com/docs/terminal/shell-integration#_manual-installation
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
