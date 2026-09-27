📚 Command-Reference.md
Linux Command Reference
Navigation
Command	Purpose
pwd	Show current directory
ls	List files
cd	Change directory
tree	Show directory tree
System Information
Command	Purpose
whoami	Current user
hostname	Hostname
uname -a	System information
date	Date/time
uptime	System uptime
free -h	Memory information
df -h	Disk filesystem usage
du -sh	Directory size
Files
Command	Purpose
touch	Create file
cat	Display file
less	View file
head	First lines
tail	Last lines
cp	Copy
mv	Move/rename
rm	Remove
file	File type
stat	File metadata
Directories
Command	Purpose
mkdir	Create directory
mkdir -p	Create nested directories
rmdir	Remove empty directory
ls -la	List including hidden files
Text Processing
Command	Purpose
grep	Search text
sort	Sort lines
uniq	Remove/count duplicates
cut	Extract fields
tr	Translate characters
awk	Process text
sed	Edit/process streams
wc	Count lines/words/bytes
Search
Command	Purpose
find	Search files/directories
locate	Search filename database
which	Find executable
whereis	Find command locations
grep	Search file contents
Archive & Compression
Command	Purpose
tar	Create/extract archives
gzip	Compress
gunzip	Decompress gzip
zip	Create ZIP archive
unzip	Extract ZIP archive
🔀 Pipes & Redirection
Pipe
command1 | command2

Example:

ps aux | grep nginx
Output
command > file.txt
Append
command >> file.txt
Error
command 2> error.txt
Output + Error
command > output.txt 2>&1
🔥 Most Useful Commands for Cloud Engineers
ls
cd
pwd
cat
less
tail
grep
find
cp
mv
rm
df
du
free
ps
top
systemctl
journalctl
ssh
tar

The commands related to processes, services, networking, storage, SSH, and other administration topics are covered in their dedicated repository sections.

🧪 Daily Command Practice

Every Linux practice session, run:

pwd
whoami
hostname
date
ls -lah
df -h
free -h
uptime

Then choose one log:

tail -20 /var/log/syslog

or, depending on your distribution:

tail -20 /var/log/messages

Search:

grep -i "error" /var/log/*.log

---
