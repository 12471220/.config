#+----------------------+
#|     export env       |
#+----------------------+
HISTFILE=$HOME/.config/zsh/zsh_history
HISTSIZE=10000
SAVEHIST=1000000
setopt share_history
setopt histappend
export ENV_HOME=$HOME/.local/env
export ZIM_HOME=$HOME/.config/zsh
export GOPATH=$ENV_HOME/gopath
export GO_HOME=$ENV_HOME/go
#export NODE_HOME=$ENV_HOME/node-v18.20.4
export NODE_HOME=$ENV_HOME/node-v22.15.0
#export NODE_HOME=$ENV_HOME/node-v16.20.2
export SCRIPT_DIR=$HOME/Documents/scripts
export MAVEN_HOME=$ENV_HOME/apache-maven-3.9.9
export SSLKEYLOGFILE=$HOME/.config/sslogdir/sslog.log
export JAVA_8_HOME=$ENV_HOME/jdk1.8.0_431
export JAVA_11_HOME=$ENV_HOME/jdk-11.0.25+9
export JAVA_17_HOME=$ENV_HOME/jdk-17.0.13+11
export JAVA_21_HOME=$ENV_HOME/jdk-21.0.4
export JAVA_HOME=$JAVA_21_HOME
export CUDA_HOME=/opt/cuda/
export EDITOR="nvim"

export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$SCRIPT_DIR:$PATH:$PATH"
export PATH="$NODE_HOME/bin:$PATH"
export PATH="$GO_HOME/bin:$PATH"
export PATH="$GOPATH:$PATH"
export PATH="$MAVEN_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$CUDA_HOME/bin:$PATH"

# +----------------------+
# |        alias         |
# +----------------------+
alias nf="fastfetch"
alias ra="ranger"
alias nv="nvim"
alias lg="lazygit"
alias fl="figlet"
alias br='blendr'
alias fm='pcmanfm-qt'
alias cl='clear'

# +----------------------+
# |     init scripts     |
# +----------------------+
for file in ${ZIM_HOME}/init/*.sh; do
  if [[ -f $file ]]; then
    source $file
  fi
done
# source $ENV_HOME/pyenv/bin/activate

