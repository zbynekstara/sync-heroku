#!/bin/bash
if [ $# -eq 1 ] # commit_message
	then
	./sync-heroku.sh /Users/zbynekstara/github/example/ /Users/zbynekstara/heroku/example rsync-exclude.txt "$1"
else
	echo 'commit_message is a required argument'
fi