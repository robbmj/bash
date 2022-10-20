#!/bin/bash

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


txt_ul() {
	local msg=$(_txt_chain_ "$@")
	echo "$(tput smul)"$(_txt_h_ "$msg")
}

txt_bold() {
	local msg=$(_txt_chain_ "$@")
	echo "$(tput bold)"$(_txt_h_ "$msg")
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

txt_c() {
	case $1 in
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
		*)
			echo $(tput sgr0)
		;;
	esac
}
