#!/bin/bash

str_starts_with() {
	if [[ $2 == $1* ]]; then
		echo true
	else
		echo false
	fi
}
