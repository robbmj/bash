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
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c black)"$(_txt_h_ "$msg")
}

txt_red() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c red)"$(_txt_h_ "$msg")
}

txt_yellow() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c yellow)"$(_txt_h_ "$msg")
}

txt_green() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c green)"$(_txt_h_ "$msg")
}

txt_blue() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c blue)"$(_txt_h_ "$msg")
}

txt_magenta() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c magenta)"$(_txt_h_ "$msg")
}

txt_cyan() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c cyan)"$(_txt_h_ "$msg")
}

txt_white() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c white)"$(_txt_h_ "$msg")
}

#
# Font Faces
#

txt_bold() {
	local msg=$(_txt_chain_ "$@")
	echo "$(txt_c bold)"$(_txt_h_ "$msg")
}

txt_ul() {
	local msg=$(_txt_chain_ "$@")
	echo "$(txt_c ul)"$(_txt_h_ "$msg")
}

txt_italic() {
	local msg=$(_txt_chain_ "$@")
	echo "$(txt_c italic)"$(_txt_h_ "$msg")
}

txt_blink() {
	local msg=$(_txt_chain_ "$@")
	echo "$(txt_c blink)"$(_txt_h_ "$msg")
}

#
# Background Colors
#

txt_black_bg() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c black_bg)"$(_txt_h_ "$msg")
}

txt_red_bg() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c red_bg)"$(_txt_h_ "$msg")
}

txt_yellow_bg() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c yellow_bg)"$(_txt_h_ "$msg")
}

txt_green_bg() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c green_bg)"$(_txt_h_ "$msg")
}

txt_blue_bg() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c blue_bg)"$(_txt_h_ "$msg")
}

txt_magenta_bg() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c magenta_bg)"$(_txt_h_ "$msg")
}

txt_cyan_bg() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c cyan_bg)"$(_txt_h_ "$msg")
}

txt_white_bg() {
	local msg=$(_txt_chain_ "$@")
	echo -e "$(txt_c white_bg)"$(_txt_h_ "$msg")
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
		yellow)
			echo $(tput setaf 3)
		;;
		green)
			echo $(tput setaf 2)
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
		yellow_bg)
			echo $(tput setab 3)
		;;
		green_bg)
			echo $(tput setab 2)
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

