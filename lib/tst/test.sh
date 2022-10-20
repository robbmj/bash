#!/bin/bash

source $MBH/lib/tst/tst.sh


test_assert_eq() {
	assert_eq true true
	assert_eq false false
	assert_eq 1 1 
	assert_eq 0 0 
	assert_eq '' ''
}


test_all() {
	test_assert_eq
}

test_all

