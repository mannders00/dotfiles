export TERM=xterm-256color

#export PATH=$PATH:/Users/matt/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/Users/matt/Development/Applications/dart-sass

set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

alias ls='ls --color=auto'
alias vi=nvim
alias py=python3

# Git aliases
alias ga='git add'
alias gcm='git commit -m'
alias gst='git status'
alias gp='git push'

alias vd='vd --theme asciimono'

export EDITOR='nvim'
export PATH=$PATH:/home/matt/Applications/lua_ls/bin

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#
n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn -C "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#. "$HOME/.cargo/env"
#


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH


ALACRITTY_DARK='
[colors.primary]
background = "#111111"
foreground = "#abb2bf"

[colors.bright]
black = "#282c34"
blue = "#61afef"
cyan = "#56b6c2"
green = "#98c379"
magenta = "#c678dd"
red = "#e06c75"
white = "#bfc5ce"
yellow = "#e5c07b"

[colors.normal]
black = "#282c34"
blue = "#61afef"
cyan = "#56b6c2"
green = "#98c379"
magenta = "#c678dd"
red = "#e06c75"
white = "#abb2bf"
yellow = "#e5c07b"

[font]
normal = { family = "Hack Nerd Font Mono", style = "Regular" }

[window]
decorations = "None"
'

ALACRITTY_LIGHT='
[colors.primary]
foreground = "#2a2b33"
background = "#ffffff"

[colors.normal]
black    = "#000000"
red      = "#b6443a"
green    = "#40803f"
yellow   = "#795300"
blue     = "#3360c1"
magenta  = "#841e83"
cyan     = "#006996"
white    = "#ccccc0"

[colors.bright]
black    = "#000000"
red      = "#b6443a"
green    = "#40803f"
yellow   = "#795300"
blue     = "#3360c1"
magenta  = "#841e83"
cyan     = "#006996"
white    = "#ccccc0"

[font]
normal = { family = "Hack Nerd Font Mono", style = "Regular" }

[window]
decorations = "None"
'

# Load bash-completion
# if [ -f "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
#   source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
# fi

alias ad="echo -e \"\${ALACRITTY_DARK}\" > ~/.config/alacritty/alacritty.toml"
alias al="echo -e \"\${ALACRITTY_LIGHT}\" > ~/.config/alacritty/alacritty.toml"

# alias kc=kubectl
# complete -o default -F __start_kubectl kc
# source <(kubectl completion bash)

export MANPAGER='nvim +Man!'

export FLYCTL_INSTALL="/home/matt/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
