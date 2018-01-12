#!/usr/bin/bash

for entry in /usr/share/nano/*
do
	echo "include \"$entry\""
done
