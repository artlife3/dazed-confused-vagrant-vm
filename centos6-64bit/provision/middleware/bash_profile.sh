# Bash profile

cat << EOT > /home/vagrant/.bash_profile
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

umask 002

export PATH
export TERM=xterm-color
export CLICOLOR="true"

mycolor=$'32m' # Change the color for each environment.
export PS1='\[\e]0;\w\a\]\n\[\e[\$mycolor\]\h@\u \[\e[33m\]\W\[\e[0m\] \$ '

#history
export HISTSIZE=10000
export HISTCONTROL=ignoredups
HISTTIMEFORMAT='%Y-%m-%d %T '; export HISTTIMEFORMAT

alias ll='ls -la'
EOT

