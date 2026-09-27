# 🐧 Linux Commands

> A practical Linux command reference and hands-on lab collection for Cloud Engineers, DevOps Engineers, and System Administrators.

This section covers the most commonly used Linux commands for **file management, system navigation, searching, text processing, and archive/compression operations**.

The goal is not just to memorize commands, but to understand how they are used in real-world Linux and cloud environments.

---

## 🎯 Learning Objectives

By completing this section, you will learn how to:

* Navigate the Linux filesystem
* Work with files and directories
* Create, copy, move, rename, and delete files
* Search for files and text
* Process and analyze text
* Work with Linux pipes and redirection
* Create and extract archives
* Compress and decompress files
* Analyze application and system logs
* Use common commands used on cloud servers
* Practice Linux commands through hands-on labs

---

## 📚 Topics Covered

| #  | Topic                     | File                                                         | What You Will Learn                                     |
| -- | ------------------------- | ------------------------------------------------------------ | ------------------------------------------------------- |
| 01 | Basic Commands            | [`Basic-Commands.md`](./Basic-Commands.md)                   | Navigation, system information, files and command help  |
| 02 | File & Directory Commands | [`File-Directory-Commands.md`](./File-Directory-Commands.md) | Create, copy, move, rename and remove files/directories |
| 03 | Text Processing           | [`Text-Processing.md`](./Text-Processing.md)                 | grep, sort, uniq, cut, tr, awk, sed and redirection     |
| 04 | Search Commands           | [`Search-Commands.md`](./Search-Commands.md)                 | find, locate, which, whereis and grep                   |
| 05 | Archive & Compression     | [`Archive-Compression.md`](./Archive-Compression.md)         | tar, gzip, zip and unzip                                |
| 06 | Command Reference         | [`Command-Reference.md`](./Command-Reference.md)             | Quick reference for frequently used Linux commands      |

---

# 🗂️ Directory Structure

```text
02-Linux-Commands/
│
├── README.md
│
├── Basic-Commands.md
├── File-Directory-Commands.md
├── Text-Processing.md
├── Search-Commands.md
├── Archive-Compression.md
└── Command-Reference.md
```

---

# 🧭 01. Basic Commands

Learn the fundamental commands used for Linux navigation and system information.

### Commands Covered

```text
pwd
ls
cd
clear
whoami
hostname
date
uname
history
man
echo
cat
less
head
tail
wc
```

### Example

```bash
pwd
whoami
hostname
uname -a
ls -lah
```

### Real-World Usage

These commands are frequently used when connecting to:

* AWS EC2 instances
* Azure Virtual Machines
* Linux servers
* Containers
* Cloud development environments

📖 **Learn more:** [`Basic-Commands.md`](./Basic-Commands.md)

---

# 📁 02. File & Directory Commands

Learn how to manage files and directories from the Linux terminal.

### Commands Covered

```text
mkdir
touch
cp
mv
rm
file
stat
tree
```

### Example

```bash
mkdir -p project/app/logs

touch project/app/app.log

cp project/app/app.log backup.log

mv backup.log project/

stat project/app/app.log
```

### Important Safety Rule

Be careful with destructive commands:

```bash
rm
rm -r
rm -rf
```

Always verify the path before deleting files or directories.

### Cloud Usage

File management commands are commonly used when managing application files on an EC2 instance:

```text
/var/www/html/

├── index.html
├── css/
├── js/
└── images/
```

📖 **Learn more:** [`File-Directory-Commands.md`](./File-Directory-Commands.md)

---

# 🔎 03. Search Commands

Linux provides several powerful commands for finding files, directories, commands, and text.

### Commands Covered

```text
find
locate
which
whereis
grep
```

### Examples

Find files:

```bash
find . -name "*.log"
```

Find directories:

```bash
find . -type d
```

Find large files:

```bash
find . -type f -size +100M
```

Find a command:

```bash
which bash
```

Search inside files:

```bash
grep "error" application.log
```

Search recursively:

```bash
grep -r "error" /var/log
```

### Cloud Usage

Search commands are especially useful for:

* Troubleshooting applications
* Finding configuration files
* Searching server logs
* Locating large files
* Investigating errors

📖 **Learn more:** [`Search-Commands.md`](./Search-Commands.md)

---

# 🔤 04. Text Processing

Linux provides powerful tools for analyzing and manipulating text.

These commands are particularly important for **log analysis and troubleshooting**.

### Commands Covered

```text
grep
sort
uniq
cut
tr
awk
sed
```

### Example Pipeline

```bash
ps aux | grep nginx
```

### Log Analysis

Search for errors:

```bash
grep "ERROR" application.log
```

Count errors:

```bash
grep -c "ERROR" application.log
```

Search for warnings:

```bash
grep "WARNING" application.log
```

Create an error report:

```bash
grep "ERROR" application.log > errors.txt
```

### Useful Pipeline

```bash
sort users.txt | uniq -c
```

This sorts the data and counts duplicate entries.

### Cloud Usage

Text-processing commands are extremely useful for:

* Application logs
* Web server logs
* System logs
* Configuration files
* Monitoring
* Troubleshooting
* Incident investigation

📖 **Learn more:** [`Text-Processing.md`](./Text-Processing.md)

---

# 📦 05. Archive & Compression

Learn how to create archives, compress files, and extract backups.

### Commands Covered

```text
tar
gzip
gunzip
zip
unzip
```

### Create TAR Archive

```bash
tar -cvf backup.tar files/
```

### Create TAR.GZ Archive

```bash
tar -czvf backup.tar.gz files/
```

### Extract TAR.GZ

```bash
tar -xzvf backup.tar.gz
```

### Create ZIP

```bash
zip -r backup.zip directory/
```

### Extract ZIP

```bash
unzip backup.zip
```

### Backup Example

```bash
tar -czvf application-backup.tar.gz /var/www/html/
```

Verify the archive:

```bash
tar -tzf application-backup.tar.gz
```

### Cloud Usage

Archives and compression are commonly used for:

* Application backups
* Log collection
* File transfer
* Deployment packages
* Configuration backups
* Cloud storage uploads

For example, an archive can later be uploaded to **Amazon S3** for centralized storage.

📖 **Learn more:** [`Archive-Compression.md`](./Archive-Compression.md)

---

# 🔀 Pipes & Redirection

Linux commands become much more powerful when combined using pipes and redirection.

## Pipe

Send the output of one command to another:

```bash
command1 | command2
```

Example:

```bash
ps aux | grep nginx
```

---

## Output Redirection

Write command output to a file:

```bash
ls > files.txt
```

---

## Append Output

Add output to an existing file:

```bash
ls >> files.txt
```

---

## Error Redirection

Redirect errors:

```bash
command 2> errors.txt
```

---

## Output + Error

Redirect both standard output and errors:

```bash
command > output.txt 2>&1
```

Understanding pipes and redirection is an important step toward writing effective Linux shell scripts.

---

# 🧪 Hands-On Practice

This section is designed around practical exercises instead of only theoretical learning.

## Lab 1 — Basic Commands

Practice:

```bash
pwd
whoami
hostname
date
uname -a
ls -lah
df -h
free -h
uptime
```

---

## Lab 2 — File Management

Create a project structure:

```bash
mkdir -p cloud-lab/{aws,azure,backups}
```

Create files:

```bash
touch cloud-lab/aws/aws.txt
touch cloud-lab/azure/azure.txt
touch cloud-lab/backups/backup.txt
```

Practice:

```bash
cp
mv
rm
file
stat
```

---

## Lab 3 — Search

Create a search environment:

```bash
mkdir -p search-lab/{logs,configs,scripts}

touch search-lab/logs/app.log
touch search-lab/logs/error.log
touch search-lab/configs/app.conf
touch search-lab/scripts/backup.sh
```

Search:

```bash
find search-lab -name "*.log"

find search-lab -name "*.conf"

find search-lab -type d

find search-lab -type f -name "*.sh"
```

---

## Lab 4 — Text Processing

Create a sample user file:

```bash
cat > users.txt <<EOF
alice
bob
alice
charlie
bob
david
alice
EOF
```

Practice:

```bash
sort users.txt

sort users.txt | uniq

sort users.txt | uniq -c

grep "alice" users.txt

grep -c "alice" users.txt
```

---

## Lab 5 — Log Analysis

Create a sample application log:

```bash
cat > application.log <<EOF
INFO Application started
INFO User login
ERROR Database connection failed
INFO User logout
WARNING Disk usage high
ERROR Database timeout
INFO Application stopped
EOF
```

Analyze the log:

```bash
grep "ERROR" application.log

grep -c "ERROR" application.log

grep "WARNING" application.log
```

Create an error report:

```bash
grep "ERROR" application.log > errors.txt
```

---

## Lab 6 — Archive & Compression

Create test files:

```bash
mkdir archive-lab

touch archive-lab/file1.txt
touch archive-lab/file2.txt
touch archive-lab/file3.txt
```

Create TAR:

```bash
tar -cvf archive.tar archive-lab/
```

Create TAR.GZ:

```bash
tar -czvf archive.tar.gz archive-lab/
```

List contents:

```bash
tar -tzf archive.tar.gz
```

Extract:

```bash
mkdir extracted

tar -xzvf archive.tar.gz -C extracted/
```

Create ZIP:

```bash
zip -r archive.zip archive-lab/
```

Extract ZIP:

```bash
unzip archive.zip
```

---

# ☁️ Linux in Cloud Engineering

Linux is a fundamental skill for cloud engineers because many cloud workloads run on Linux-based systems.

### AWS

```text
AWS EC2
   │
   └── Linux Server
        │
        ├── Application
        ├── Logs
        ├── Configuration
        ├── Storage
        └── Services
```

Common commands used on an EC2 instance include:

```bash
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
systemctl
journalctl
ssh
tar
```

### Example

Check disk usage:

```bash
df -h
```

Check memory:

```bash
free -h
```

Check running processes:

```bash
ps aux
```

Check application logs:

```bash
tail -f application.log
```

Search logs:

```bash
grep -i "error" application.log
```

Create an application backup:

```bash
tar -czvf application-backup.tar.gz /var/www/html/
```

---

# 🎯 Challenges

After completing the labs, try these challenges without looking at your notes.

### Challenge 1 — System Information

Find commands to:

* Display your username
* Display your hostname
* Display your current directory
* Display the Linux kernel version
* Display hidden files
* Display system uptime
* Display available memory
* Display available disk space

### Challenge 2 — File Management

Create:

```text
cloud-lab/
├── aws/
│   ├── ec2/
│   ├── s3/
│   └── vpc/
├── azure/
└── backups/
```

Then:

* Create one file in every directory
* Copy AWS files into `backups`
* Rename one file
* Move one file
* Display the complete structure
* Delete only a test file

### Challenge 3 — Search

Find:

* All `.log` files
* All `.conf` files
* All directories
* Files larger than 1 MB
* Files modified within the last day
* Location of the `bash` command
* Location of the `ls` command

### Challenge 4 — Log Analysis

Given an application log:

* Find all errors
* Count errors
* Find warnings
* Search for a specific user
* Save errors into a separate report
* Follow the log in real time

### Challenge 5 — Backup

Create an archive containing an application directory.

Then:

1. Compress it
2. Verify its contents
3. Extract it
4. Compare the extracted files with the original

---

# 📘 Quick Command Reference

For a quick lookup of frequently used commands:

👉 [`Command-Reference.md`](./Command-Reference.md)

| Category      | Important Commands                                |
| ------------- | ------------------------------------------------- |
| Navigation    | `pwd`, `ls`, `cd`                                 |
| Files         | `touch`, `cat`, `cp`, `mv`, `rm`                  |
| Directories   | `mkdir`, `rmdir`, `tree`                          |
| Search        | `find`, `locate`, `which`, `whereis`              |
| Text          | `grep`, `sort`, `uniq`, `cut`, `tr`, `awk`, `sed` |
| System        | `uname`, `hostname`, `uptime`, `free`             |
| Storage       | `df`, `du`                                        |
| Processes     | `ps`, `top`                                       |
| Services      | `systemctl`, `journalctl`                         |
| Archive       | `tar`, `gzip`, `zip`, `unzip`                     |
| Remote Access | `ssh`                                             |

---

# 🧠 What I Learned

After completing this section, I should be able to:

* [ ] Navigate the Linux filesystem
* [ ] Create and manage files
* [ ] Create and manage directories
* [ ] Copy and move files
* [ ] Safely remove files and directories
* [ ] Search for files using `find`
* [ ] Search text using `grep`
* [ ] Process text using Linux utilities
* [ ] Use pipes and redirection
* [ ] Analyze application logs
* [ ] Create TAR and TAR.GZ archives
* [ ] Compress and extract ZIP files
* [ ] Create basic application backups
* [ ] Use Linux commands on cloud servers

---

# 🚀 Next Steps

After completing Linux commands, continue with more advanced Linux administration topics:

```text
Linux Commands
      │
      ▼
File Permissions
      │
      ▼
Users & Groups
      │
      ▼
Processes
      │
      ▼
Services & systemd
      │
      ▼
Networking
      │
      ▼
Storage & Disk Management
      │
      ▼
SSH
      │
      ▼
Shell Scripting
      │
      ▼
Linux on AWS EC2
```

These skills will provide a strong foundation for **AWS Cloud Engineering, DevOps, System Administration, and SRE**.

---

## 📚 Related Sections

Coming soon:

* `03-Linux-File-Permissions`
* `04-Linux-Users-Groups`
* `05-Linux-Processes`
* `06-Linux-Services`
* `07-Linux-Networking`
* `08-Linux-Storage`
* `09-Linux-SSH`
* `10-Linux-Shell-Scripting`

---

## ⭐ Repository Goal

This repository documents my **hands-on Linux learning journey** with practical commands, labs, challenges, and cloud-focused examples.

The focus is on building skills that can be applied to real-world **AWS Cloud and DevOps environments**.

---

**🐧 Learn Linux → Practice Linux → Build Projects → Become Cloud Ready**

⭐ If you find this repository useful, consider giving it a star.
