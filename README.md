# sync-heroku
A simple Bash utility that synchronizes and pushes your Github and Heroku commits.

## Motivation
Working on a project deployed to Heroku, it is often annoying to keep the Heroku code up to date with the main Github repository. Thanks to this utility, you no longer need to manually copy-paste your Github files into your Heroku folder every time you make a change. Neat!

## How it works
Each time you call `sync-heroku`, the current contents of your Github folder are copied over to your Heroku folder. (Files and folders can be excluded from syncing, too.) Any changes made to your Heroku files will be discarded during synchronization; your Github folder is the master folder!

With identical files in both folders, `sync-heroku` then calls
```
git add -A
git commit -m "commit_message"
git push
```
for your Github folder, and
```
git add -A
git commit -m "commit_message"
git push heroku master
```
for your Heroku folder.

## Installation
Clone this repository and copy `rsync-exclude.txt`, `rsync.sh`, and `sync-heroku.sh` into your Github project folder.

From the command line, call `chmod 755 rsync.sh` and `chmod 755 sync-heroku.sh` to give yourself execute privileges to the scripts.

## Usage
Inside the folder of your Github repository, call `./sync-heroku.sh "/path/to/github/folder/" "/path/to/heroku/folder/"
"rsync-exclude.txt" "commit_message"`.

The first argument is the path to the Github folder. Notice the trailing `/`.

The second argument is the path to the Heroku folder, again with a trailing `/`.

(For clarity, these two paths should be **absolute**.)

The third argument is the **relative** path to the `rsync-exclude.txt file`. (This is why you should be in the Github directory to begin with.)

The final argument is the message to be used for both the Github and Heroku commits.

## Caveats
`sync-heroku` does not `git pull` before committing. This should not be a problem if you are working on a project by yourself, but if other people are contributing to the sodebases, make sure your repositories are up to date before you use `sync-heroku`!

You can add/remove files to be excluded from sync by modifying the `rsync-exclude.txt` file. However, `.git` **must** always be part of this file; you do not want your Heroku git data to be overwritten with your Github git data!

## Tip
Since you will probably be calling `sync-heroku` multiple times for the same pair of folders for one project, you might want to write your own shortcut script to avoid typing long paths every single time you want to use it. An example is included in this repository in `sync-heroku-shortcut.sh`.

To use, just replace the example folder/file paths with your own and voilà, you are good to go. (Also do not forget to give yourself execute privileges to the shortcut script!)