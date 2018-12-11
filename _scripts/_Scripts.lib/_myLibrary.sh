# Text Colors Vars
RED='\033[0;31m'
GRN='\033[0;32m'
GRY='\033[0;37m'
YEL='\033[1;33m'
NC='\033[0m'

# Init commands
function init {
	
	# cd -- "$(dirname "$0")"
	OLDIFS=$IFS
	IFS=$'\n'
	shopt -s nullglob
	shopt -s nocaseglob

}

# Close commands
function close {
	
	IFS=$OLDIFS
	shopt -u nocaseglob
	shopt -u nullglob
}

# Pushd no output
function pushd () {
	command pushd "$@" > /dev/null
}

# Popd no output
function popd () {
	command popd "$@" > /dev/null
}

# mkdir no output
function mkdir () {
	command mkdir -p "$@" &> /dev/null
}

# copy no output
function cp () {
	command cp "$@" &> /dev/null
}

# copy no output
function cpDir () {
	command cp -rf "$@" &> /dev/null
}

# move no output
function mv () {
	command mv "$@" &> /dev/null
}

# move no output
function mvDir () {
	command mv -f "$@" &> /dev/null
}

# mkdir no output
function rm () {
	command rm "$@" &> /dev/null
}

# unzip no output
function unzip () {
	command unzip "$@" > /dev/null
}

# Store variable into retroarch style file
function store {
	cfgFile="$1"
	key="$2"
	value="$3"

	mv "$cfgFile" "$cfgFile.sed"
	
	# sed 's:\('$vi'\) = \(".*"\):"\1 = "'$vo'":' <"$f" >"$f.sed"
	sed 's|'$key' = ".*"|'$key' = "'$value'"|' <"$cfgFile.sed" >"$cfgFile"
	 
	rm "$cfgFile.sed"
}