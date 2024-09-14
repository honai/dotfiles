#echo ".zprofile" 1>&2
# INCLUDES
setopt NULL_GLOB
for file ($ZDOTDIR/.zprofile.*) {
	source $file
}
unsetopt NULL_GLOB
