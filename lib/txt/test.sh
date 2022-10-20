#!/bin/bash

source $MBH/lib/txt/txt.sh

# private helper function
_df_txt_() {
	echo "    -->    this should be default text"
}

test_txt_c() {
	echo "$(txt_c blue)this should be blue$(txt_c)"$(_df_txt_)
}

#
# TEST ALL COLORS
#

test_txt_black() {
	echo $(txt_black "this should be black")$(_df_txt_)
}

test_txt_red() {
	echo $(txt_red "this should be red")$(_df_txt_)
}

test_txt_green() {
	echo $(txt_green "this should be green")$(_df_txt_)
}

test_txt_blue() {
	echo $(txt_blue "this should be blue")$(_df_txt_)
}

test_txt_magenta() {
	echo $(txt_magenta "this should be magenta")$(_df_txt_)
}

test_txt_cyan() {
	echo $(txt_cyan "this should be cyan")$(_df_txt_)
}

test_txt_white() {
	echo $(txt_white "this should be white")$(_df_txt_)
}

test_all_colors() {
	test_txt_black
	test_txt_red
	test_txt_green
	test_txt_blue
	test_txt_magenta
	test_txt_cyan
	test_txt_white
}

#
# TEST ALL BG COLORS
#

test_txt_bg_black() {
	echo " TODO "
	#echo $(test_txt_bg_black "this background should be black")$(_df_txt_)
}

test_txt_bg_red() {
	echo " TODO "
	#echo $(test_txt_bg_red "this background should be red")$(_df_txt_)
}

test_txt_bg_green() {
	echo " TODO "
	#echo $(test_txt_bg_green "this background should be green")$(_df_txt_)
}

test_txt_bg_blue() {
	echo " TODO "
	#echo $(test_txt_bg_blue "this background should be blue")$(_df_txt_)
}

test_txt_bg_magenta() {
	echo " TODO "
	#echo $(test_txt_bg_magenta "this background should be magenta")$(_df_txt_)
}

test_txt_bg_cyan() {
	echo " TODO "
	#echo $(test_txt_bg_cyan "this background should be cyan")$(_df_txt_)
}

test_txt_bg_white() {
	echo " TODO "
	#echo $(test_txt_bg_white "this background should be white")$(_df_txt_)
}

test_all_bg_colors() {
	test_txt_bg_black
	test_txt_bg_red
	test_txt_bg_green
	test_txt_bg_blue
	test_txt_bg_magenta
	test_txt_bg_cyan
	test_txt_bg_white
}

#
# TEST ALL FONT FACES
#

test_txt_bold() {
	echo $(txt_bold "this should be bold")$(_df_txt_)
}

test_txt_ul() {
	echo $(txt_ul "this should be underlined")$(_df_txt_)
}

test_all_ff() {
	test_txt_bold
	test_txt_ul
}


#
# TEST MANY COMBOS 
#

test_txt_bold_and_red() {
	echo $(txt_bold txt_ul txt_red "this should be bold, red and underlined")$(_df_txt_)   
}

test_all_combos() {
	test_txt_bold_and_red
}

test_all() {
	test_txt_c
	test_all_colors
	test_all_ff
	test_all_combos
}

test_all
