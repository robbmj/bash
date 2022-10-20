#!/bin/bash

source $MBH/lib/itr/itr.sh
source $MBH/lib/txt/txt.sh

run_test() {
	echo "running: $1/test.sh" 
	bash $1/test.sh
}


test_all() {
	itr_each_dir run_test $MBH/lib
}

test_all
