####add color to commands###############################
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
####auto completion#####################################
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
####navigation##########################################
alias ch1='cd /home/ubuntu/cppGame/chapter1'
alias ch2='cd /home/ubuntu/cppGame/chapter2'
alias ch3='cd /home/ubuntu/cppGame/chapter3'
alias ch4='cd /home/ubuntu/cppGame/chapter4'
alias ch5='cd /home/ubuntu/cppGame/chapter5'
alias dotFiles='cd ~/dotfiles/'
alias curopengl='cd /home/ubuntu/openGl/coordinateSystems'
####random##############################################
alias cpdot='cp ~/.tcshrc ~/.bashrc ~/.vimrc ~/.gitconfig ~/dotfiles/'
alias clear='clear -x'
alias cp='cp -r'
alias rm='rm -rf'
#prompt
PS1='\[\033[0;32m\]\W $ \[\033[0m\]'
#history
HISTSIZE=1000
#scroll rate
xset r rate 350 40
#title
alias setTitle='printf "\033]0;%s\007" "$*"'
#source bashrc
alias sbr='source ~/.bashrc'
#copy dot files
alias cpdot='cp ~/.tcshrc ~/.bashrc ~/.vimrc ~/dotfiles/'
#edit bashrc
alias bashrc='vim ~/.bashrc'
#edit vimrc
alias vimrc='vim ~/.vimrc'
#source2make
alias source2make='/home/ubuntu/cppGame/source2make.sh'
#sdl2
alias sdl2='/home/ubuntu/cppGame/sdl2.sh'
#xdg-open
alias view='xdg-open'
#clang format
clangFormat() {
    clang-format --style=file:$HOME/.clang-format "$@"
}
#python shebang
py_shebang() {
  file="$1"
  if [ -f "$file" ]; then
    # Insert the shebang at the first line
    sed -i '1i#!/usr/bin/env python3' "$file"
  else
    echo "File not found: $file"
  fi
}
alias gvimt='gvim --remote-tab-silent'
alias tree2='tree -L 2 -f -P "*"'
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
