# 📚 Linux Command Reference

## 🎯 Objective

Learn and revise essential Linux commands for system administration, troubleshooting, and cloud engineering.

## 1. Navigation

| Command | Purpose |
|---|---|
| `pwd` | Show current directory |
| `ls` | List files |
| `ls -lah` | List all files with details |
| `cd` | Change directory |
| `tree` | Display directory tree |

## 2. System Information

| Command | Purpose |
|---|---|
| `whoami` | Show current user |
| `hostname` | Show hostname |
| `uname -a` | Show system information |
| `cat /etc/os-release` | Show Linux distribution |
| `date` | Display date and time |
| `uptime` | Show system uptime |
| `free -h` | Display memory usage |
| `df -h` | Display filesystem usage |
| `du -sh directory/` | Show directory size |

## 3. Files and Directories

| Command | Purpose |
|---|---|
| `touch file.txt` | Create an empty file |
| `cat file.txt` | Display file contents |
| `less file.txt` | View a file page by page |
| `head file.txt` | Show first lines |
| `tail file.txt` | Show last lines |
| `cp source destination` | Copy files |
| `mv source destination` | Move or rename files |
| `rm file.txt` | Remove a file |
| `file file.txt` | Identify file type |
| `stat file.txt` | Display file metadata |
| `mkdir directory` | Create a directory |
| `mkdir -p a/b` | Create nested directories |
| `rmdir directory` | Remove an empty directory |
| `ls -la` | Include hidden files |

## 4. Text Processing

| Command | Purpose |
|---|---|
| `grep "error" file.txt` | Search text |
| `sort file.txt` | Sort lines |
| `uniq file.txt` | Remove adjacent duplicates |
| `cut -d: -f1 file.txt` | Extract fields |
| `tr 'a-z' 'A-Z'` | Translate characters |
| `awk '{print $1}' file.txt` | Extract columns |
| `sed 's/old/new/g' file.txt` | Replace text in output |
| `wc -l file.txt` | Count lines |

## 5. Search Commands

| Command | Purpose |
|---|---|
| `find /path -name "*.log"` | Search for files |
| `locate file.txt` | Search filename database |
| `which python3` | Find executable in PATH |
| `whereis bash` | Find command-related files |
| `grep -i "error" file.txt` | Search text ignoring case |

## 6. Archive and Compression

| Command | Purpose |
|---|---|
| `tar -cvf backup