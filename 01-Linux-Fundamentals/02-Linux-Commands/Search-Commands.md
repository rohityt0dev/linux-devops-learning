🔎 Search-Commands.md
Linux Search Commands
🎯 Objective

Learn how to locate files, directories, commands, and text.

1. find

Search files and directories.

find /tmp -name "test.txt"

Search by extension:

find . -name "*.log"

Directories only:

find . -type d

Files only:

find . -type f

Search by size:

find . -type f -size +100M

Search by modification time:

find . -type f -mtime -1
2. locate

Search filenames using a database:

locate nginx.conf

The database may need updating depending on the distribution.

3. which

Find the executable used for a command:

which bash
which python3
which ls
4. whereis

Find binary, source, and manual locations:

whereis bash
whereis nginx
5. grep

Search inside files:

grep "error" application.log

Recursive:

grep -r "error" /var/log
6. Search Command Output

Example:

ps aux | grep nginx

Another:

systemctl list-units | grep ssh
🧪 Search Lab

Create:

mkdir -p search-lab/{logs,configs,scripts}
touch search-lab/logs/app.log
touch search-lab/logs/error.log
touch search-lab/configs/app.conf
touch search-lab/scripts/backup.sh

Find logs:

find search-lab -name "*.log"

Find configuration:

find search-lab -name "*.conf"

Find directories:

find search-lab -type d

Find shell scripts:

find search-lab -type f -name "*.sh"
🎯 Search Challenge

Find:

All .log files.
All .conf files.
All directories.
All files larger than 1 MB.
All files modified in the last day.
Location of the bash command.
Location of the ls command.

---