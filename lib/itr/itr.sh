#!/bin/bash

itr_each_line() {
	local cb=$1	
	local file=$2	

	while read -r local line; do

		line=$(echo "${line}" | tr -d '\r')

		$cb $line
		local ret=$?

		if [ $ret -ne 0 ]; then
			break
		fi

	done < $file
}

itr_each_dir() {
	local cb=$1	
	local dir=$2	

	for d in $dir/*; do

		if [ ! -d $d ]; then
			continue
		fi

		$cb $d

		local ret=$?

		if [ $ret -ne 0 ]; then
			break
		fi
	done
}

