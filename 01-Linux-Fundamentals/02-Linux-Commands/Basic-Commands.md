📘 Basic-Commands.md
Linux Basic Commands
🎯 Objective

Learn the commands used for basic Linux system navigation and information gathering.

1. pwd

Print current working directory.

pwd

Example:

/home/user
2. ls

List files and directories.

ls

Useful options:

ls -l
ls -a
ls -la
ls -lh
ls -lt
3. cd

Change directory.

cd /etc
cd /var/log
cd ..
cd ~
cd -
4. clear

Clear terminal screen.

clear

Shortcut:

Ctrl + L
5. whoami

Show current user.

whoami
6. hostname

Show system hostname.

hostname
7. date

Show date and time.

date
8. uname

Show system information.

uname
uname -a
uname -r
uname -m
9. history

Show previously executed commands.

history

Run a previous command:

!100
10. man

Read command documentation.

man ls
man cp
man grep

Search within a man page:

/

Exit:

q
11. echo

Print text.

echo "Hello Linux"

Variables:

echo $HOME
echo $USER
echo $SHELL
12. cat

Display file contents.

cat file.txt

Multiple files:

cat file1.txt file2.txt
13. less

View large files page by page.

less file.txt

Useful keys:

Space  → next page
b      → previous page
/word  → search
q      → exit
14. head

Show beginning of a file.

head file.txt

First 20 lines:

head -20 file.txt
15. tail

Show end of a file.

tail file.txt

Last 20 lines:

tail -20 file.txt

Follow a log:

tail -f application.log
16. wc

Count lines, words, and characters.

wc file.txt

Lines:

wc -l file.txt

Words:

wc -w file.txt

Characters/bytes:

wc -c file.txt
17. Command Options

Example:

ls -lh

Breakdown:

ls = command
-l = long format
-h = human-readable sizes
🧪 Basic Command Lab

Run:

pwd
whoami
hostname
date
uname -a
echo $HOME
echo $SHELL
ls -la
history

Then investigate:

man ls
man pwd
man cp
🎯 Challenge

Without looking at your notes:

Display your username.
Display your hostname.
Display your current directory.
Display kernel version.
Display hidden files.
Display the last 10 lines of a file.
Follow a log file in real time.
Open command documentation.