#!/bin/bash

source $MBH/lib/str/str.sh
source $MBH/lib/tst/tst.sh

test_str_starts_with(){
	assert_eq $(str_starts_with r run) true
	assert_eq $(str_starts_with ru run) true
	assert_eq $(str_starts_with run run) true
	assert_eq $(str_starts_with run- run) false
	assert_eq $(str_starts_with n run) false
}

test_all() {
	test_str_starts_with
}

test_all
