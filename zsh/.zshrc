#+----------------------+
#|     export env       |
#+----------------------+
HISTFILE=$HOME/.config/zsh/zsh_history
HISTSIZE=10000
SAVEHIST=1000000
setopt share_history
setopt histappend
export ZIM_HOME=$HOME/.config/zsh
export JAVA_HOME=$HOME/.local/env/jdk-17.0.11
export GOPATH=$HOME/.local/env/go

export PATH="$PATH:$JAVA_HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
#+----------------------+
#|        alias         |
#+----------------------+
alias nf="neofetch"
alias ra="joshuto"
alias vim="nvim"
alias fm="thunar"



# Initialize modules.
source ${ZIM_HOME}/init.zsh




#+----------------------+
#|       plugins        |
#+----------------------+
zstyle ':zim:zmodule' use 'degit'
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
