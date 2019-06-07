# oh-my-zsh setup
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bureau"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# User configuration

# Path manipulation
export PATH="/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.7.3:/usr/games/bin:"
if [ -r ~/cross-compilers/list ]; then
    for i in $(cat ~/cross-compilers/list); do
        export PATH="$HOME/cross-compilers/${i}/bin:$PATH"
    done
fi

# Activate oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Aliases
alias mplayer="mplayer2"
if [ -x $(which nvim) ]; then
    alias vim="nvim"
fi

# Custom functions
cleanup_cmake() {
    rm CMakeCache.txt cmake_install.cmake compile_commands.json Makefile
    rm -rf CMakeFiles
}

# Set up rust if we have it
if [ -r ${HOME}/.cargo/env ]; then
    source ${HOME}/.cargo/env
fi

# Perform machine-specific configuration, if we have it
if [ -r ${HOME}/.zshrc.local ]; then
    source ${HOME}/.zshrc.local
fi
