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

test_txt_yellow() {
	echo $(txt_yellow "this should be yellow")$(_df_txt_)
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
	test_txt_yellow
	test_txt_green
	test_txt_blue
	test_txt_magenta
	test_txt_cyan
	test_txt_white
}

#
# TEST ALL BG COLORS
#

test_txt_black_bg() {
	echo $(txt_black_bg "this background should be black")$(_df_txt_)
}

test_txt_red_bg() {
	echo $(txt_red_bg "this background should be red")$(_df_txt_)
}

test_txt_yellow_bg() {
	echo $(txt_yellow_bg "this background should be yellow")$(_df_txt_)
}

test_txt_green_bg() {
	echo $(txt_green_bg "this background should be green")$(_df_txt_)
}

test_txt_blue_bg() { 
	echo $(txt_blue_bg "this background should be blue")$(_df_txt_)
}

test_txt_magenta_bg() { 
	echo $(txt_magenta_bg "this background should be magenta")$(_df_txt_)
}

test_txt_cyan_bg() { 
	echo $(txt_cyan_bg "this background should be cyan")$(_df_txt_)
}

test_txt_white_bg() { 
	echo $(txt_white_bg "this background should be white")$(_df_txt_)
}

test_all_colors_bg() { 
	test_txt_black_bg
	test_txt_red_bg
	test_txt_yellow_bg
	test_txt_green_bg
	test_txt_blue_bg
	test_txt_magenta_bg
	test_txt_cyan_bg
	test_txt_white_bg
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

test_txt_italic() {
	echo $(txt_italic "this should be italic")$(_df_txt_)
}

test_txt_blink() {
	echo $(txt_blink "this should be blinking")$(_df_txt_)
}

test_all_ff() {
	test_txt_bold
	test_txt_ul
	test_txt_italic
	test_txt_blink
}


#
# TEST MANY COMBOS 
#

test_txt_bold_red_ul() {
	echo $(txt_bold txt_ul txt_red "this should be bold, red and underlined")$(_df_txt_)   
}

test_txt_bold_ul_italic() {
	echo $(txt_bold txt_ul txt_italic "this should be bold, underlined and italic")$(_df_txt_)   
}

test_txt_bold_green_blue_bg() {
	echo $(txt_bold txt_green txt_blue_bg "this should be bold, green text, blue background")$(_df_txt_)   
}

test_txt_black_bold_white_bg() {
	echo $(txt_bold txt_black txt_white_bg "Black BOLD text on a White background")$(_df_txt_)
}

test_multiple_colors() {
	echo $(txt_red txt_blue "i don't know")$(_df_txt_)
}

test_all_combos() {
	test_txt_bold_ul_italic
	test_txt_bold_green_blue_bg
	test_txt_bold_and_red
	test_txt_black_bold_white_bg
	test_multiple_colors
}

test_all() {
	test_txt_c
	test_all_colors
	test_all_colors_bg
	test_all_ff
	test_all_combos
}

test_all
