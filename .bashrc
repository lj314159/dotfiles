# ------------------------------------------------
# Environment Customization
# ------------------------------------------------

# Auto Completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Prompt
PS1='\[\033[0;32m\]\W $ \[\033[0m\]'

# Scroll Rate
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 40
gsettings set org.gnome.desktop.peripherals.keyboard delay 200


# X11 Scroll Rate
xset r rate 250 50

# Scroll Back History
HISTSIZE=1000

# Terminal Bell Off
gsettings set org.gnome.desktop.wm.preferences audible-bell false

# Source Bashrc
alias sbr='source ~/.bashrc'

# Dircolors Eval
eval $(dircolors ~/.dircolors)

# Shell Permissions
umask 0022





# ------------------------------------------------
# Environment Variables
# ------------------------------------------------





# ------------------------------------------------
# Aliases
# ------------------------------------------------

# Overwrite Commands / Command Shortcuts
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias clear='clear -x'
alias cp='cp -r'
alias rm='rm -rf'
alias view='xdg-open'
alias gvimt='gvim --remote-tab-silent'
alias sau='sudo apt update'
alias pip='sudo pip3'
alias tmuxkill='tmux kill-session'
alias histview='history | less'
alias ctagscpp='ctags --options=/home/ubuntu/.dotfiles/.ctags.cpp'
alias ctagspy='ctags --options=/home/ubuntu/.dotfiles/.ctags.py'
alias uctags='/snap/bin/universal-ctags'

# Edit Dotfiles
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias gitconfig='vim ~/.gitconfig'
alias gdbinit='vim ~/.gdbinit'
alias edircolors='vim ~/.dircolors'
alias tmuxconf='vim ~/.tmux.conf'
alias clangformat='vim ~/.clang-format'
alias ectagscpp='vim ~/.ctags.cpp'
alias ectagspy='vim ~/.ctags.py'

# Custom Aliases
alias cpdot='cp ~/.tcshrc ~/.bashrc ~/.vimrc ~/.gitconfig ~/.clang-format ~/.tmux.conf ~/.dircolors ~/.dotfiles/'
alias tree2='tree -L 2 -f -P "*"'





# ------------------------------------------------
# Navigation
# ------------------------------------------------

# Game Chapters
alias ch1='cd /home/ubuntu/cppGame/chapter1'
alias ch2='cd /home/ubuntu/cppGame/chapter2'
alias ch3='cd /home/ubuntu/cppGame/chapter3'
alias ch4='cd /home/ubuntu/cppGame/chapter4'
alias ch5='cd /home/ubuntu/cppGame/chapter5'
alias curopengl='cd /home/ubuntu/openGl/coordinateSystems'

# Root Of Repo
alias cdRoot='cd $(git rev-parse --show-toplevel)'

# Dotfiles Directory
alias dotFiles='cd ~/.dotfiles/'





# ------------------------------------------------
# Functions
# ------------------------------------------------

# Clang Format
clangFormat() {
    clang-format --style=file:"$HOME"/.clang-format "$@"
}

# Python Shebang
py_shebang() {
  file="$1"
  if [ -f "$file" ]; then
    # Insert the shebang at the first line
    sed -i '1i#!/usr/bin/env python3' "$file"
  else
    echo "File not found: $file"
  fi
}

# Yank Path To Clipboard
ypath() {
    realpath "$@" | tr -d '\n' | xsel --clipboard
}

# Create Cpp Ctags
ctags_cpp() {
    local dir_name=$(basename "$PWD")
    local tags_file="${dir_name}_ctags"
    ctags --options=/home/ubuntu/.dotfiles/.ctags.cpp -f "$tags_file"
    if [[ -f "$tags_file" ]]; then
        echo "$tags_file"
    else
        echo "Failed"
    fi
}

# ------------------------------------------------
# Shell Scripts / Python Scripts
# ------------------------------------------------

alias source2make='/home/ubuntu/cppGame/source2make.sh'
alias sdl2='/home/ubuntu/cppGame/sdl2.sh'





# ------------------------------------------------
# Conda
# ------------------------------------------------

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ubuntu/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ubuntu/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ubuntu/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ubuntu/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
