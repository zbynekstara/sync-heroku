# sync-heroku
A simple bash utility that synchronizes and pushes your github and heroku commits.

## Motivation
When working on a project, it is often annoying to keep the Heroku code up to date with the main Github repository. Thanks to this utility, you no longer need to manually copy-paste your Github files into your Heroku folder every time you make a change. Neat!

## How it works
Each time you call `sync-heroku.sh`, the current contents of your Github folder are copied over to your Heroku folder. (You can specify the files to be excluded from the sync – especially the `.git` folder.) Any changes made to your Heroku files will be discarded during synchronization; your Github folder is the master folder!

With identical files in both folders, `sync-heroku.sh` then calls
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
Clone this repository and copy `rsync-exclude.txt`, `rsync.sh`, and `sync-heroku.sh` into your github project folder.

From the command line, call `chmod 755 rsync.sh` and `chmod 755 sync-heroku.sh` to give yourself execute privileges to the scripts.

## Usage
Inside the folder of your github repository, call `./sync-heroku.sh "/path/to/github/folder/" "/path/to/heroku/folder/"
"rsync-exclude.txt" "commit_message"`.

The first argument is the path to the Github folder. Notice the trailing `/`.

The second argument is the path to the Heroku folder, again with a trailing `/`.

(For clarity, these two paths should be **absolute**.)

The third argument is the **relative** path to the `rsync-exclude.txt file`. (This is why you should be in the Github directory to begin with.)

The final argument is the message to be used for both the Github and Heroku commits.

## Caveats
`sync-heroku.sh` does not `git pull` before committing. Make sure you are up to date with the repositories before you use the utility.

You can add/remove files to be excluded from sync by modifying the `rsync-exclude.txt` file. However, in order for your Heroku repository to continue working after sync, `.git` **must** be part of this file; you do not want your Heroku git data to be overwritten with your Github git data!

## Tip
Since you will probably be calling `sync-heroku.sh` for the same pair of folders for one project, you can write your own `sync-heroku.sh` shortcut script to avoid typing long paths every single time you want to use this utility. An example of such shortcut script is included in this repository in `sync-heroku-shortcut.sh`.

To use, just replace the example folder/file paths with your own and voilà, you are good to go. (Also do not forget to give yourself execute privileges for the shortcut script.)