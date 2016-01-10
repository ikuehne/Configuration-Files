# OPAM configuration
. /home/ikuehne/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
eval `opam config env`

# OSX configuration.
if [ `uname` = "Darwin" ]; then
	# Get brew things to override XCode.
	export PATH=/usr/local/sbin:/usr/local/bin:$PATH
	# Allow Swift tools.
	export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
	# Get ds9 to be more pretty.
	alias ds9 "ds9 -zscale"
	alias gcc=/usr/local/bin/gcc-5
	alias gemacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
fi

autoload -U colors && colors

PROMPT="%{$fg_bold[green]%}%n@%m%{$fg_bold[blue]%} %# %{$reset_color%}"

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
        && type -p dircolors >/dev/null \
        && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if type -p dircolors >/dev/null ; then
	if [[ -f ~/.dir_colors ]] ; then
		eval $(dircolors -b ~/.dir_colors)
	elif [[ -f /etc/DIR_COLORS ]] ; then
		eval $(dircolors -b /etc/DIR_COLORS)
	else
		eval $(dircolors)
	fi
fi

alias ls='ls -G'
alias grep='grep -G'

autoload -U zmv
setopt autocd
alias zcp='noglob zmv -C'
alias zln='noglob zmv -L'
alias zmv='noglob zmv'

function chpwd() {
    emulate -L zsh
    ls
}

autoload -U compinit
compinit

ls
