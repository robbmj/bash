#!/bin/bash

assert_eq() {
	if [[ $1 != $2 ]]; then
		echo "'$1' does not equal '$2'; exiting"
		exit 1
	fi
}

