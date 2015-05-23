#!/bin/bash
if [ $# -eq 3 ] # rsync_exclude, github_dir, heroku_dir
	then
	rsync -avzru --delete --exclude-from $1 $2 $3
else
	echo 'rsync_exclude, github_dir, and heroku_dir are required arguments'
fi