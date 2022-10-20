#!/bin/bash

should_skip_line() {
	local line=$1

	if $(starts_with "#" $line) == true; then
		echo true
	else
		echo false
	fi
}

main() {
	echo "todo"
}

