# Application environment variables
# Note: ZIM_HOME is defined in ~/.config/zsh/.zshrc (needed by the sourcing loop)

export ENV_HOME=$HOME/.local/env
export GOPATH=$ENV_HOME/gopath
export GO_HOME=$ENV_HOME/go
#export NODE_HOME=$ENV_HOME/node-v18.20.4
#export NODE_HOME=$ENV_HOME/node-v22.15.0
#export NODE_HOME=$ENV_HOME/node-v16.20.2
export NODE_HOME=$ENV_HOME/node-v24.16.0
export SCRIPT_HOME=$HOME/.local/scripts
export MAVEN_HOME=$ENV_HOME/apache-maven-3.9.9
export SSLKEYLOGFILE=$HOME/.cache/sslog.log
export JAVA_8_HOME=$ENV_HOME/jdk1.8.0_431
export JAVA_11_HOME=$ENV_HOME/jdk-11.0.25+9
export JAVA_17_HOME=$ENV_HOME/jdk-17.0.13+11
export JAVA_21_HOME=$ENV_HOME/jdk-21.0.4
export JAVA_HOME=$JAVA_21_HOME
export CUDA_HOME=/opt/cuda/
export EDITOR="nvim"
export HOMEBREW_NO_AUTO_UPDATE=1
export RISCV_TOOLS_HOME=/usr/local/opt/riscv-gnu-toolchain
export BUN_INSTALL="$HOME/.bun"
