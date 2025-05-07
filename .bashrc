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
# Colors section of "Alacritty - TOML configuration file format"
# https://github.com/alacritty/alacritty/blob/master/extra/man/alacritty.5.scd#colors

[colors.primary]
foreground = "#e0def4"
background = "#000000"
dim_foreground = "#908caa"
bright_foreground = "#e0def4"

[colors.cursor]
text = "#e0def4"
cursor = "#524f67"

[colors.vi_mode_cursor]
text = "#e0def4"
cursor = "#524f67"

[colors.search.matches]
foreground = "#908caa"
background = "#26233a"

[colors.search.focused_match]
foreground = "#191724"
background = "#ebbcba"

[colors.hints.start]
foreground = "#908caa"
background = "#1f1d2e"

[colors.hints.end]
foreground = "#6e6a86"
background = "#1f1d2e"

[colors.line_indicator]
foreground = "None"
background = "None"

[colors.footer_bar]
foreground = "#e0def4"
background = "#1f1d2e"

[colors.selection]
text = "#e0def4"
background = "#403d52"

[colors.normal]
black = "#26233a"
red = "#eb6f92"
green = "#31748f"
yellow = "#f6c177"
blue = "#9ccfd8"
magenta = "#c4a7e7"
cyan = "#ebbcba"
white = "#e0def4"

[colors.bright]
black = "#6e6a86"
red = "#eb6f92"
green = "#31748f"
yellow = "#f6c177"
blue = "#9ccfd8"
magenta = "#c4a7e7"
cyan = "#ebbcba"
white = "#e0def4"

[colors.dim]
black = "#6e6a86"
red = "#eb6f92"
green = "#31748f"
yellow = "#f6c177"
blue = "#9ccfd8"
magenta = "#c4a7e7"
cyan = "#ebbcba"
white = "#e0def4"

[font]
normal = { family = "MesloLGS Nerd Font Mono", style = "Regular" }

[window]
decorations = "None"
'

ALACRITTY_MOON='
# Colors section of "Alacritty - TOML configuration file format"
# https://github.com/alacritty/alacritty/blob/master/extra/man/alacritty.5.scd#colors

[colors.primary]
foreground = "#e0def4"
background = "#232136"
dim_foreground = "#908caa"
bright_foreground = "#e0def4"

[colors.cursor]
text = "#e0def4"
cursor = "#56526e"

[colors.vi_mode_cursor]
text = "#e0def4"
cursor = "#56526e"

[colors.search.matches]
foreground = "#908caa"
background = "#393552"

[colors.search.focused_match]
foreground = "#232136"
background = "#ea9a97"

[colors.hints.start]
foreground = "#908caa"
background = "#2a273f"

[colors.hints.end]
foreground = "#6e6a86"
background = "#2a273f"

[colors.line_indicator]
foreground = "None"
background = "None"

[colors.footer_bar]
foreground = "#e0def4"
background = "#2a273f"

[colors.selection]
text = "#e0def4"
background = "#44415a"

[colors.normal]
black = "#393552"
red = "#eb6f92"
green = "#3e8fb0"
yellow = "#f6c177"
blue = "#9ccfd8"
magenta = "#c4a7e7"
cyan = "#ea9a97"
white = "#e0def4"

[colors.bright]
black = "#6e6a86"
red = "#eb6f92"
green = "#3e8fb0"
yellow = "#f6c177"
blue = "#9ccfd8"
magenta = "#c4a7e7"
cyan = "#ea9a97"
white = "#e0def4"

[colors.dim]
black = "#6e6a86"
red = "#eb6f92"
green = "#3e8fb0"
yellow = "#f6c177"
blue = "#9ccfd8"
magenta = "#c4a7e7"
cyan = "#ea9a97"
white = "#e0def4"

[font]
normal = { family = "MesloLGS Nerd Font Mono", style = "Regular" }

[window]
decorations = "None"
'

ALACRITTY_LIGHT='
# Colors section of "Alacritty - TOML configuration file format"
# https://github.com/alacritty/alacritty/blob/master/extra/man/alacritty.5.scd#colors

[colors.primary]
foreground = "#575279"
background = "#faf4ed"
dim_foreground = "#797593"
bright_foreground = "#575279"

[colors.cursor]
text = "#575279"
cursor = "#cecacd"

[colors.vi_mode_cursor]
text = "#575279"
cursor = "#cecacd"

[colors.search.matches]
foreground = "#797593"
background = "#f2e9e1"

[colors.search.focused_match]
foreground = "#faf4ed"
background = "#d7827e"

[colors.hints.start]
foreground = "#797593"
background = "#fffaf3"

[colors.hints.end]
foreground = "#9893a5"
background = "#fffaf3"

[colors.line_indicator]
foreground = "None"
background = "None"

[colors.footer_bar]
foreground = "#575279"
background = "#fffaf3"

[colors.selection]
text = "#575279"
background = "#dfdad9"

[colors.normal]
black = "#f2e9e1"
red = "#b4637a"
green = "#286983"
yellow = "#ea9d34"
blue = "#56949f"
magenta = "#907aa9"
cyan = "#d7827e"
white = "#575279"

[colors.bright]
black = "#9893a5"
red = "#b4637a"
green = "#286983"
yellow = "#ea9d34"
blue = "#56949f"
magenta = "#907aa9"
cyan = "#d7827e"
white = "#575279"

[colors.dim]
black = "#9893a5"
red = "#b4637a"
green = "#286983"
yellow = "#ea9d34"
blue = "#56949f"
magenta = "#907aa9"
cyan = "#d7827e"
white = "#575279"

[font]
normal = { family = "MesloLGS Nerd Font Mono", style = "Regular" }

[window]
decorations = "None"
'

alias ad="echo -e \"\${ALACRITTY_DARK}\" > ~/.config/alacritty/alacritty.toml"
alias am="echo -e \"\${ALACRITTY_MOON}\" > ~/.config/alacritty/alacritty.toml"
alias al="echo -e \"\${ALACRITTY_LIGHT}\" > ~/.config/alacritty/alacritty.toml"
