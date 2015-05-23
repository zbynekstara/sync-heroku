#!/bin/bash
if [ $# -eq 4 ] # github_dir, heroku_dir, rsync_exclude, commit_message
	then
	./rsync.sh $3 $1 $2

	cd $1

	git add -A
	git commit -m "$4"
	git push

	cd $2

	git add -A
	git commit -m "$4"
	git push heroku master
else
	echo 'github_dir, heroku_dir, rsync_exclude, and commit_message are required arguments'
fi