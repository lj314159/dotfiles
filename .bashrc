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
alias cpdot='cp ~/.tcshrc ~/.bashrc ~/.vimrc ~/dotfiles/'
alias dotFiles='cd ~/dotfiles/'
####random##############################################
alias clear='clear -x'
#prompt
PS1='\[\033[0;32m\]\W $ \[\033[0m\]'
#history
HISTSIZE=1000
#title
alias setTitle='printf "\033]0;%s\007" "$*"'
#source bashrc
alias sbr='source ~/.bashrc'
#copy dot files
alias cpdot='cp ~/.tcshrc ~/.bashrc ~/.vimrc ~/dotfiles/'
#edit bashrc
alias bashrc='vim ~/.bashrc'


