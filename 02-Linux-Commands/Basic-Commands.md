# 🐧 Linux Basic Commands

> Fundamental Linux commands for system navigation, user information, operating system identification, and basic file exploration.

---

## 🎯 Objective

The goal of this section is to learn the basic Linux commands used for:

- Identifying the current user
- Checking the hostname
- Finding the current working directory
- Checking Linux kernel information
- Identifying the Linux distribution
- Working with environment variables
- Navigating directories
- Listing files and directories
- Viewing hidden files
- Checking installed software versions
- Getting help from Linux documentation

These commands are the foundation for working with **Linux servers, AWS EC2, Azure Virtual Machines, DevOps environments, and cloud infrastructure**.

---

# 📚 Commands Covered

| # | Command | Purpose |
|---|---|---|
| 1 | `whoami` | Display current user |
| 2 | `hostname` | Display system hostname |
| 3 | `pwd` | Display current working directory |
| 4 | `uname -a` | Display complete system information |
| 5 | `uname -r` | Display kernel version |
| 6 | `cat /etc/os-release` | Display Linux distribution information |
| 7 | `echo $SHELL` | Display current shell |
| 8 | `echo $HOME` | Display home directory |
| 9 | `ls` | List files and directories |
| 10 | `ls -la` | List all files including hidden files |
| 11 | `cd` | Change directory |
| 12 | `systemctl --version` | Display systemd version |
| 13 | `clear` | Clear terminal |
| 14 | `date` | Display date and time |
| 15 | `history` | Display command history |
| 16 | `man` | Open command documentation |
| 17 | `echo` | Display text or variables |
| 18 | `cat` | Display file contents |
| 19 | `less` | View files page by page |
| 20 | `head` | Display beginning of a file |
| 21 | `tail` | Display end of a file |
| 22 | `wc` | Count lines, words, and bytes |

---

# 👤 1. whoami

The `whoami` command displays the username of the currently logged-in user.

### Syntax

```bash
whoami
```

### Example

```bash
whoami
```

Example output:

```text
ec2-user
```

The output depends on the Linux distribution and the user account.

### Cloud Usage

Useful when working with an EC2 or Linux server to verify which user you are currently using.

---

# 🖥️ 2. hostname

The `hostname` command displays the hostname of the system.

### Syntax

```bash
hostname
```

### Example

```bash
hostname
```

Example output:

```text
ip-10-0-1-25
```

### Why It Is Useful

When working with multiple servers, the hostname helps identify which server you are connected to.

---

# 📍 3. pwd

`pwd` stands for **Print Working Directory**.

It shows the directory you are currently working in.

### Syntax

```bash
pwd
```

### Example

```bash
pwd
```

Output:

```text
/home/user
```

### Why It Is Useful

Before creating, moving, or deleting files, checking your current directory helps prevent mistakes.

---

# ⚙️ 4. uname

The `uname` command displays information about the Linux system.

## Display complete system information

```bash
uname -a
```

Example:

```text
Linux server 6.x.x-generic x86_64 GNU/Linux
```

## Display kernel version

```bash
uname -r
```

Example:

```text
6.8.0-xx-generic
```

## Display machine architecture

```bash
uname -m
```

Example:

```text
x86_64
```

### Useful Options

| Command | Purpose |
|---|---|
| `uname` | Kernel name |
| `uname -a` | All available information |
| `uname -r` | Kernel release |
| `uname -m` | Machine architecture |

---

# 🐧 5. Check Linux Distribution

Linux distribution information is available in:

```text
/etc/os-release
```

Use:

```bash
cat /etc/os-release
```

Example output:

```text
NAME="Ubuntu"
VERSION="24.04 LTS"
ID=ubuntu
```

The exact output depends on your Linux distribution.

### Common Distributions

- Ubuntu
- Amazon Linux
- Debian
- Red Hat Enterprise Linux
- Rocky Linux
- AlmaLinux
- Fedora

### Cloud Usage

This is useful when you need to determine which Linux distribution is running on an EC2 instance or virtual machine.

---

# 🐚 6. Check Current Shell

The `$SHELL` environment variable shows the user's default shell.

```bash
echo $SHELL
```

Example:

```text
/bin/bash
```

Other commonly used shells include:

```text
/bin/bash
/bin/zsh
/bin/sh
```

> Linux environment variables are case-sensitive, so use `$SHELL`, not `$shell`.

---

# 🏠 7. Check Home Directory

The `$HOME` environment variable contains the current user's home directory.

```bash
echo $HOME
```

Example:

```text
/home/user
```

### Go to Home Directory

You can use:

```bash
cd ~
```

or:

```bash
cd $HOME
```

---

# 📂 8. ls

The `ls` command lists files and directories.

### Basic Usage

```bash
ls
```

### List a Specific Directory

```bash
ls /home
```

```bash
ls /etc
```

```bash
ls /var
```

### Long Format

```bash
ls -l
```

### Show Hidden Files

```bash
ls -a
```

### Long Format + Hidden Files

```bash
ls -la
```

### Human-Readable File Sizes

```bash
ls -lh
```

### Sort by Modification Time

```bash
ls -lt
```

### Common Options

| Option | Purpose |
|---|---|
| `-l` | Long listing format |
| `-a` | Show hidden files |
| `-h` | Human-readable sizes |
| `-t` | Sort by modification time |

### Recommended Combination

```bash
ls -lah
```

---

# 🧭 9. cd

The `cd` command is used to change directories.

### Go to `/etc`

```bash
cd /etc
```

### Go to `/var/log`

```bash
cd /var/log
```

### Go to Parent Directory

```bash
cd ..
```

### Go to Home Directory

```bash
cd ~
```

### Go to Previous Directory

```bash
cd -
```

---

# 🔍 10. ls -la

The following command displays all files, including hidden files, in long format:

```bash
ls -la
```

Example:

```text
drwxr-xr-x  5 user user 4096 .
drwxr-xr-x  3 root root 4096 ..
-rw-r--r--  1 user user  220 .bash_logout
-rw-r--r--  1 user user 3526 .bashrc
```

Files beginning with `.` are normally hidden.

Examples:

```text
.bashrc
.profile
.bash_history
```

---

# 🛠️ 11. systemctl --version

`systemctl` is commonly used to manage services on systems using **systemd**.

To check the installed systemd version:

```bash
systemctl --version
```

Example:

```text
systemd 255
```

### Important

`systemctl` will be covered in more detail in the **Linux Services / systemd** section.

---

# 🧹 12. clear

Clear the terminal screen:

```bash
clear
```

### Keyboard Shortcut

```text
Ctrl + L
```

---

# 📅 13. date

Display the current date and time:

```bash
date
```

Example:

```text
Thu Oct 2 16:00:00 IST 2026
```

The exact output depends on your system's timezone and configuration.

---

# 📜 14. history

The `history` command displays previously executed commands.

```bash
history
```

Example:

```text
100 pwd
101 ls
102 whoami
103 uname -a
```

You can execute a command from history using its number:

```bash
!100
```

---

# 📖 15. man

`man` provides Linux manual pages.

### Example

```bash
man ls
```

```bash
man cp
```

```bash
man grep
```

### Search Inside a Manual

Press:

```text
/word
```

For example:

```text
/search
```

### Exit

Press:

```text
q
```

---

# 🖨️ 16. echo

The `echo` command prints text or variable values.

### Print Text

```bash
echo "Hello Linux"
```

Output:

```text
Hello Linux
```

### Display Home Directory

```bash
echo $HOME
```

### Display Current User

```bash
echo $USER
```

### Display Current Shell

```bash
echo $SHELL
```

---

# 📄 17. cat

The `cat` command displays file contents.

### Example

```bash
cat file.txt
```

### Multiple Files

```bash
cat file1.txt file2.txt
```

### Linux Configuration Example

```bash
cat /etc/os-release
```

---

# 📖 18. less

`less` allows you to view large files page by page.

```bash
less file.txt
```

### Useful Keys

| Key | Action |
|---|---|
| `Space` | Next page |
| `b` | Previous page |
| `/word` | Search |
| `q` | Exit |

### Log Example

```bash
less /var/log/application.log
```

---

# ⬆️ 19. head

The `head` command displays the beginning of a file.

```bash
head file.txt
```

### Display First 20 Lines

```bash
head -20 file.txt
```

### Display First 5 Lines

```bash
head -5 file.txt
```

---

# ⬇️ 20. tail

The `tail` command displays the end of a file.

```bash
tail file.txt
```

### Display Last 20 Lines

```bash
tail -20 file.txt
```

### Follow a Log File

```bash
tail -f application.log
```

This is especially useful for monitoring logs in real time.

---

# 🔢 21. wc

`wc` stands for **Word Count** and can count lines, words, and bytes.

### Basic Usage

```bash
wc file.txt
```

### Count Lines

```bash
wc -l file.txt
```

### Count Words

```bash
wc -w file.txt
```

### Count Bytes

```bash
wc -c file.txt
```

---

# 🧪 Basic Command Lab

Practice the following commands in your Linux environment:

```bash
whoami

hostname

pwd

uname -a

uname -r

cat /etc/os-release

echo $SHELL

echo $HOME

ls /home

ls /etc

ls /var

ls -la

systemctl --version

date

history
```

---

# 🔬 Investigation Lab

Now investigate your Linux system.

### 1. Find your current user

```bash
whoami
```

### 2. Find your hostname

```bash
hostname
```

### 3. Find your current directory

```bash
pwd
```

### 4. Find your kernel version

```bash
uname -r
```

### 5. Find your Linux distribution

```bash
cat /etc/os-release
```

### 6. Find your shell

```bash
echo $SHELL
```

### 7. Find your home directory

```bash
echo $HOME
```

### 8. Explore common directories

```bash
ls /home
ls /etc
ls /var
```

### 9. Display hidden files

```bash
ls -la
```

### 10. Check systemd version

```bash
systemctl --version
```

---

# ☁️ Linux Commands in Cloud Engineering

These commands are frequently used when connecting to Linux cloud servers.

For example, after connecting to an AWS EC2 instance:

```bash
ssh user@server
```

You may first check:

```bash
whoami
hostname
pwd
uname -a
cat /etc/os-release
```

Then inspect the filesystem:

```bash
ls -lah
```

Check logs:

```bash
tail -f application.log
```

Check your environment:

```bash
echo $HOME
echo $SHELL
```

These simple commands help you understand **which server you are connected to, which user you are using, where you are located in the filesystem, and what operating system is running**.

---

# 🎯 Challenge

Try completing these tasks **without looking at your notes**.

### Challenge 1 — User & System

- [ ] Display your username
- [ ] Display your hostname
- [ ] Display your current directory
- [ ] Display the Linux kernel version
- [ ] Display the Linux distribution
- [ ] Display your current shell
- [ ] Display your home directory

### Challenge 2 — Filesystem

- [ ] List `/home`
- [ ] List `/etc`
- [ ] List `/var`
- [ ] Display hidden files
- [ ] Navigate to `/var/log`
- [ ] Return to your home directory

### Challenge 3 — System Information

- [ ] Check the complete kernel information
- [ ] Check the system architecture
- [ ] Check the systemd version
- [ ] Display the current date and time

### Challenge 4 — Documentation

Find the manual page for:

```bash
ls
```

```bash
cd
```

```bash
cat
```

```bash
grep
```

Then exit each manual page using:

```text
q
```

---

# ✅ Learning Checklist

- [ ] I understand `whoami`
- [ ] I understand `hostname`
- [ ] I understand `pwd`
- [ ] I can use `uname`
- [ ] I can identify my Linux distribution
- [ ] I understand `$SHELL`
- [ ] I understand `$HOME`
- [ ] I can navigate using `cd`
- [ ] I can list files using `ls`
- [ ] I can display hidden files
- [ ] I can check systemd version
- [ ] I can use `cat`
- [ ] I can use `less`
- [ ] I can use `head`
- [ ] I can use `tail`
- [ ] I can use `wc`
- [ ] I can use `man` pages

---

# 🚀 Next Step

After completing these basic commands, continue with:

```text
Basic Commands
      │
      ▼
File & Directory Commands
      │
      ▼
Search Commands
      │
      ▼
Text Processing
      │
      ▼
Archive & Compression
      │
      ▼
Linux Administration
      │
      ▼
AWS EC2 & Cloud Engineering
```

---

## 📚 Related Files

- [`File-Directory-Commands.md`](../File-Directory-Commands.md)
- [`Search-Commands.md`](../Search-Commands.md)
- [`Text-Processing.md`](../Text-Processing.md)
- [`Archive-Compression.md`](../Archive-Compression.md)
- [`Command-Reference.md`](../Command-Reference.md)

---

**🐧 Learn → Practice → Troubleshoot → Automate → Become Cloud Ready**
