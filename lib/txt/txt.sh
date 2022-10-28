#!/bin/bash
#
#
# more info here:
# https://www.mankier.com/5/terminfo#Description-Predefined_Capabilities
#

source $MBH/lib/vec/vec.sh

#
# Foreground Colors
#

txt_black() {
	echo $(_txt_wrap_ black "$@")
}

txt_red() {
	echo $(_txt_wrap_ red "$@")
}

txt_green() {
	echo $(_txt_wrap_ green "$@")
}

txt_yellow() {
	echo $(_txt_wrap_ yellow "$@")
}

txt_blue() {
	echo $(_txt_wrap_ blue "$@")
}

txt_magenta() {
	echo $(_txt_wrap_ magenta "$@")
}

txt_cyan() {
	echo $(_txt_wrap_ cyan "$@")
}

txt_white() {
	echo $(_txt_wrap_ white "$@")
}

#
# Font Faces
#

txt_bold() {
	echo $(_txt_wrap_ bold "$@")
}

txt_ul() {
	echo $(_txt_wrap_ ul "$@")
}

txt_italic() {
	echo $(_txt_wrap_ italic "$@")
}

txt_blink() {
	echo $(_txt_wrap_ blink "$@")
}

#
# Background Colors
#

txt_black_bg() {
	echo $(_txt_wrap_ black_bg "$@")
}

txt_red_bg() {
	echo $(_txt_wrap_ red_bg "$@")
}

txt_green_bg() {
	echo $(_txt_wrap_ green_bg "$@")
}

txt_yellow_bg() {
	echo $(_txt_wrap_ yellow_bg "$@")
}

txt_blue_bg() {
	echo $(_txt_wrap_ blue_bg "$@")
}

txt_magenta_bg() {
	echo $(_txt_wrap_ magenta_bg "$@")
}

txt_cyan_bg() {
	echo $(_txt_wrap_ cyan_bg "$@")
}

txt_white_bg() {
	echo $(_txt_wrap_ white_bg "$@")
}

txt_c() {
	case $1 in
		# foregound colors
		black)
			echo $(tput setaf 0)
		;;
		red)
			echo $(tput setaf 1)
		;;
		green)
			echo $(tput setaf 2)
		;;
		yellow)
			echo $(tput setaf 3)
		;;
		blue)
			echo $(tput setaf 4)
		;;
		magenta)
			echo $(tput setaf 5)
		;;
		cyan)
			echo $(tput setaf 6)
		;;
		white)
			echo $(tput setaf 7)
		;;
		# font faces
		bold)
			echo $(tput bold)
		;;
		ul)
			echo $(tput smul)
		;;
		italic)
			echo $(tput sitm)
		;;
		blink)
			echo $(tput blink)
		;;
		# backgound colors
		black_bg)
			echo $(tput setab 0)
		;;
		red_bg)
			echo $(tput setab 1)
		;;
		green_bg)
			echo $(tput setab 2)
		;;
		yellow_bg)
			echo $(tput setab 3)
		;;
		blue_bg)
			echo $(tput setab 4)
		;;
		magenta_bg)
			echo $(tput setab 5)
		;;
		cyan_bg)
			echo $(tput setab 6)
		;;
		white_bg)
			echo $(tput setab 7)
		;;
		*)
			echo $(tput sgr0)
		;;
	esac
}

_txt_wrap_() {
	local highlight="$1"
	shift
	local msg=$(_txt_chain_ "$@")
	echo "$(txt_c $highlight)"$(_txt_h_ "$msg")
}

_txt_chain_() {

	local argc="$#"

	if [[ $argc == 0 ]]; then
		exit 1
	fi

	if [[ $argc == 1 ]]; then
		echo "$1"
		return 0
	fi

	local argv=()
	local argv=()
	a_new_rev_from_args argv "$@"

	local msg=""

	apop argv msg 

	while :
	do
		apop argv cb
		if [[ $cb == "" ]]; then
			break
		fi

		msg=$($cb "$msg")
	done

	echo "$msg"
}

_txt_h_() {
	echo  "$1$(txt_c)"
}

