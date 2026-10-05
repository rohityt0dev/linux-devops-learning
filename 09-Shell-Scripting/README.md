# 🐚 09 - Linux Shell Scripting

Shell scripting is one of the most important Linux skills for a **Cloud Engineer, DevOps Engineer, System Administrator, and AWS Engineer**.

A shell script allows you to automate repetitive Linux tasks such as:

- Server health checks
- User management
- File backups
- Disk monitoring
- Service monitoring
- Log management
- Software installation
- Deployment tasks
- AWS EC2 configuration
- System administration
- Scheduled jobs

This section focuses on learning **Bash Shell Scripting from beginner to practical automation level**.

---

## 📚 Learning Objectives

By completing this section, you will learn:

- What shell scripting is
- Bash shell fundamentals
- Variables
- Environment variables
- Command substitution
- Conditions
- File and string tests
- Loops
- Functions
- Script arguments
- Exit status
- Input handling
- Error handling
- Script debugging
- Shell scripting best practices
- Linux automation
- AWS EC2 automation

---

# 📂 Directory Structure

```text
09-Shell-Scripting/
│
├── README.md
│
├── Variables.md
├── Conditions.md
├── Loops.md
├── Functions.md
├── Arguments.md
│
└── Scripts/
    ├── backup.sh
    ├── disk-usage.sh
    ├── user-check.sh
    └── service-check.sh
```

---

# 🧠 What is Shell Scripting?

A **shell** is a command-line interpreter that allows users to interact with the Linux operating system.

A **shell script** is a file containing a sequence of shell commands.

Instead of manually running:

```bash
mkdir backup
cp file.txt backup/
date
ls -l backup/
```

we can put these commands into a script:

```bash
#!/bin/bash

mkdir backup
cp file.txt backup/
date
ls -l backup/
```

Then execute:

```bash
./backup.sh
```

This is the basic idea behind automation.

---

# 🐚 What is Bash?

**Bash** stands for:

> Bourne Again Shell

Bash is one of the most commonly used shells on Linux systems.

Check the current shell:

```bash
echo $SHELL
```

Example:

```text
/bin/bash
```

Check Bash version:

```bash
bash --version
```

List available shells:

```bash
cat /etc/shells
```

Example:

```text
/bin/sh
/bin/bash
/bin/dash
/bin/zsh
```

---

# 🔎 Shell vs Shell Script

| Shell                     | Shell Script                  |
| ------------------------- | ----------------------------- |
| Command interpreter       | File containing commands      |
| Interactive               | Automated                     |
| Commands entered manually | Commands executed from a file |
| Used for administration   | Used for automation           |
| Example: Bash             | Example: `backup.sh`          |

---

# 📝 Your First Shell Script

Create a file:

```bash
touch hello.sh
```

Open it:

```bash
vim hello.sh
```

Add:

```bash
#!/bin/bash

echo "Hello, Linux!"
echo "Welcome to Shell Scripting"
```

Make it executable:

```bash
chmod +x hello.sh
```

Run it:

```bash
./hello.sh
```

Output:

```text
Hello, Linux!
Welcome to Shell Scripting
```

---

# 🔰 Shebang

The first line of many Bash scripts is:

```bash
#!/bin/bash
```

This is called the **shebang**.

It tells Linux which interpreter should execute the script.

Example:

```bash
#!/bin/bash

echo "Hello"
```

Another common approach is:

```bash
#!/usr/bin/env bash
```

This searches for Bash using the user's `PATH`.

---

# ▶️ Ways to Execute a Script

Suppose the script is:

```text
hello.sh
```

### Method 1 - Bash

```bash
bash hello.sh
```

### Method 2 - Make executable

```bash
chmod +x hello.sh
```

Then:

```bash
./hello.sh
```

### Method 3 - Absolute path

```bash
/bin/bash hello.sh
```

### Method 4 - Relative path

```bash
./hello.sh
```

---

# 🔐 Script Permissions

Check permissions:

```bash
ls -l hello.sh
```

Example:

```text
-rw-r--r-- 1 user user 80 Oct 5 hello.sh
```

Make executable:

```bash
chmod +x hello.sh
```

Check again:

```bash
ls -l hello.sh
```

Example:

```text
-rwxr-xr-x 1 user user 80 Oct 5 hello.sh
```

The `x` permission means the file can be executed.

---

# 📦 Shell Script Components

A typical Bash script can contain:

```bash
#!/bin/bash

# Comment

NAME="Rohit"

echo "Hello $NAME"

if [[ -f /etc/passwd ]]; then
    echo "File exists"
fi
```

Common components:

1. Shebang
2. Comments
3. Variables
4. Commands
5. Conditions
6. Loops
7. Functions
8. Arguments
9. Exit status
10. Error handling

---

# 📌 Comments

Single-line comments begin with:

```bash
#
```

Example:

```bash
# This is a comment

echo "Hello"
```

Comments are ignored by Bash.

Use comments to explain important logic:

```bash
# Check whether Apache is running
systemctl is-active --quiet apache2
```

---

# 📦 Variables

Variables store information.

Example:

```bash
NAME="Rohit"
AGE=25
```

Use variables:

```bash
echo "$NAME"
echo "$AGE"
```

Example:

```text
Rohit
25
```

Learn more:

👉 [Variables.md](Variables.md)

---

# 🔀 Conditions

Conditions allow scripts to make decisions.

Example:

```bash
if [[ $AGE -ge 18 ]]; then
    echo "Adult"
else
    echo "Minor"
fi
```

Common conditions:

```bash
-e
-f
-d
-r
-w
-x
-z
-n
-eq
-ne
-gt
-ge
-lt
-le
```

Learn more:

👉 [Conditions.md](Conditions.md)

---

# 🔁 Loops

Loops allow you to execute commands repeatedly.

Example:

```bash
for i in 1 2 3 4 5
do
    echo "Number: $i"
done
```

Output:

```text
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5
```

Learn more:

👉 [Loops.md](Loops.md)

---

# 🧩 Functions

Functions allow you to organize reusable code.

Example:

```bash
#!/bin/bash

hello() {
    echo "Hello Linux"
}

hello
```

Output:

```text
Hello Linux
```

Functions are especially useful for larger automation scripts.

Learn more:

👉 [Functions.md](Functions.md)

---

# 🎯 Script Arguments

Arguments allow users to pass information to scripts.

Example:

```bash
./hello.sh Rohit
```

Inside the script:

```bash
echo "Hello $1"
```

Output:

```text
Hello Rohit
```

Important variables:

| Variable | Meaning                         |
| -------- | ------------------------------- |
| `$0`     | Script name                     |
| `$1`     | First argument                  |
| `$2`     | Second argument                 |
| `$#`     | Number of arguments             |
| `$@`     | All arguments                   |
| `$?`     | Exit status of previous command |
| `$$`     | Current process ID              |

Learn more:

👉 [Arguments.md](Arguments.md)

---

# 🚦 Exit Status

Linux commands return an exit status.

Usually:

```text
0 = Success
Non-zero = Failure
```

Example:

```bash
ls /etc
echo $?
```

If successful:

```text
0
```

Example:

```bash
ls /does-not-exist
echo $?
```

Possible output:

```text
2
```

This is extremely important for automation and troubleshooting.

---

# 🛡️ Basic Error Handling

A common Bash practice is:

```bash
set -euo pipefail
```

Example:

```bash
#!/bin/bash

set -euo pipefail

echo "Starting script"

mkdir /tmp/my-test

echo "Script completed successfully"
```

Meaning:

### `-e`

Exit when a command fails.

### `-u`

Treat unset variables as errors.

### `pipefail`

A pipeline fails if an earlier command fails.

For example:

```bash
set -euo pipefail
```

is useful for production-style scripts, although individual scripts may need exceptions or more explicit error handling.

---

# 🐞 Debugging Shell Scripts

Run a script with tracing:

```bash
bash -x script.sh
```

Example:

```bash
bash -x backup.sh
```

You can also add:

```bash
set -x
```

inside a script.

Disable tracing:

```bash
set +x
```

Check syntax without executing:

```bash
bash -n script.sh
```

Example:

```bash
bash -n backup.sh
```

---

# 🔍 ShellCheck

**ShellCheck** is a static analysis tool for shell scripts.

It can identify:

- Quoting problems
- Incorrect syntax
- Common Bash mistakes
- Unused variables
- Unsafe command usage
- Potential bugs

Install on Ubuntu/Debian:

```bash
sudo apt update
sudo apt install shellcheck
```

Check a script:

```bash
shellcheck script.sh
```

Example:

```bash
shellcheck backup.sh
```

Using ShellCheck is a good habit for professional scripting.

---

# 🧪 Hands-On Lab 1 - Hello World

Create:

```bash
mkdir -p ~/shell-labs
cd ~/shell-labs

touch hello.sh
```

Add:

```bash
#!/bin/bash

echo "Hello from Linux"
echo "My first shell script"
```

Make executable:

```bash
chmod +x hello.sh
```

Run:

```bash
./hello.sh
```

---

# 🧪 Hands-On Lab 2 - System Information

Create:

```bash
vim system-info.sh
```

Add:

```bash
#!/bin/bash

echo "===== System Information ====="

echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"
echo "User: $(whoami)"
echo "Date: $(date)"
echo "Uptime:"
uptime
```

Make executable:

```bash
chmod +x system-info.sh
```

Run:

```bash
./system-info.sh
```

---

# 🧪 Hands-On Lab 3 - Disk Monitoring

Create:

```bash
vim disk-check.sh
```

Add:

```bash
#!/bin/bash

USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Root filesystem usage: ${USAGE}%"

if [[ "$USAGE" -ge 80 ]]; then
    echo "WARNING: Disk usage is above 80%"
else
    echo "Disk usage is normal"
fi
```

Run:

```bash
chmod +x disk-check.sh
./disk-check.sh
```

This is a simple example of Linux server monitoring.

---

# 🧪 Hands-On Lab 4 - Service Monitoring

Create:

```bash
vim service-check.sh
```

Example:

```bash
#!/bin/bash

SERVICE="ssh"

if systemctl is-active --quiet "$SERVICE"; then
    echo "$SERVICE is running"
else
    echo "$SERVICE is NOT running"
fi
```

Run:

```bash
chmod +x service-check.sh
./service-check.sh
```

> On some distributions the SSH service may be named `sshd` instead of `ssh`.

---

# 🧪 Hands-On Lab 5 - User Check

Check whether a Linux user exists:

```bash
id username
```

Script:

```bash
#!/bin/bash

USERNAME="$1"

if id "$USERNAME" &>/dev/null; then
    echo "User $USERNAME exists"
else
    echo "User $USERNAME does not exist"
fi
```

Run:

```bash
chmod +x user-check.sh
```

Then:

```bash
./user-check.sh root
```

---

# 💾 Backup Automation

One of the most common shell scripting use cases is backups.

Example:

```bash
#!/bin/bash

SOURCE="/var/www/html"
BACKUP="/backup"

mkdir -p "$BACKUP"

tar -czf "$BACKUP/website-$(date +%F).tar.gz" "$SOURCE"

echo "Backup completed"
```

This can later be scheduled using:

```text
Cron
```

or:

```text
systemd timers
```

---

# ☁️ Shell Scripting and AWS

Shell scripting is extremely useful when working with AWS.

Common use cases:

```text
AWS EC2
│
├── Install packages
├── Configure web server
├── Configure users
├── Configure SSH
├── Mount EBS
├── Configure application
├── Collect logs
├── Monitor disk
├── Monitor services
└── Automate deployments
```

---

# 🚀 AWS EC2 User Data

EC2 User Data can execute shell commands when an instance starts.

Example:

```bash
#!/bin/bash

dnf update -y
dnf install -y nginx

systemctl enable --now nginx

echo "Hello from AWS EC2" > /usr/share/nginx/html/index.html
```

For Ubuntu:

```bash
#!/bin/bash

apt update -y
apt install -y nginx

systemctl enable --now nginx

echo "Hello from AWS EC2" > /var/www/html/index.html
```

This is an important connection between **Linux Shell Scripting and AWS Cloud Engineering**.

---

# ☁️ AWS CLI Automation

Shell scripts can also automate AWS CLI commands.

Example:

```bash
aws s3 ls
```

Example:

```bash
aws ec2 describe-instances
```

Example:

```bash
aws s3 cp backup.tar.gz s3://my-bucket/
```

A production script should also handle:

- AWS credentials
- IAM permissions
- Exit codes
- Logging
- Errors
- Retries
- Input validation

For AWS workloads, prefer **IAM roles** such as EC2 instance roles instead of hard-coding access keys into scripts.

---

# 🔄 Shell Scripting Automation Flow

```text
User
 │
 ▼
Shell Script
 │
 ├── Variables
 │
 ├── Conditions
 │
 ├── Loops
 │
 ├── Functions
 │
 ├── Commands
 │
 └── Error Handling
       │
       ▼
    Linux System
       │
       ├── Files
       ├── Users
       ├── Processes
       ├── Services
       ├── Network
       └── Storage
```

---

# 🏗️ Mini Project - Linux Server Health Check

Create:

```bash
vim server-health.sh
```

Example:

```bash
#!/bin/bash

set -u

echo "================================="
echo "       Linux Server Health"
echo "================================="

echo
echo "Hostname:"
hostname

echo
echo "Current User:"
whoami

echo
echo "Uptime:"
uptime

echo
echo "Memory:"
free -h

echo
echo "Disk:"
df -h /

echo
echo "Load Average:"
cat /proc/loadavg

echo
echo "Failed Services:"
systemctl --failed --no-pager

echo
echo "================================="
echo "Health Check Completed"
echo "================================="
```

Make executable:

```bash
chmod +x server-health.sh
```

Run:

```bash
./server-health.sh
```

---

# 📊 Useful Commands for Shell Scripts

| Command      | Purpose                   |
| ------------ | ------------------------- |
| `echo`       | Print output              |
| `printf`     | Formatted output          |
| `read`       | Read user input           |
| `cat`        | Read files                |
| `grep`       | Search text               |
| `awk`        | Process structured text   |
| `sed`        | Modify text               |
| `cut`        | Extract fields            |
| `sort`       | Sort output               |
| `uniq`       | Remove duplicates         |
| `head`       | First lines               |
| `tail`       | Last lines                |
| `find`       | Find files                |
| `xargs`      | Build commands from input |
| `df`         | Disk usage                |
| `du`         | Directory usage           |
| `ps`         | Processes                 |
| `systemctl`  | Services                  |
| `journalctl` | Logs                      |
| `ip`         | Network information       |
| `curl`       | HTTP requests             |

These commands become powerful when combined with shell scripting.

---

# 🔐 Shell Scripting Best Practices

## 1. Use a shebang

```bash
#!/bin/bash
```

## 2. Quote variables

Prefer:

```bash
echo "$NAME"
```

instead of:

```bash
echo $NAME
```

Especially important when variables can contain spaces or wildcard characters.

---

## 3. Use meaningful variable names

Good:

```bash
BACKUP_DIR="/backup"
LOG_FILE="/var/log/app.log"
```

Avoid:

```bash
x="/backup"
a="/var/log/app.log"
```

---

## 4. Validate input

Example:

```bash
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <username>"
    exit 1
fi
```

---

## 5. Check command failures

Example:

```bash
if ! systemctl restart nginx; then
    echo "Failed to restart nginx"
    exit 1
fi
```

---

## 6. Avoid hard-coded secrets

Never put credentials directly into scripts:

```bash
AWS_ACCESS_KEY_ID="..."
AWS_SECRET_ACCESS_KEY="..."
```

Use appropriate secret-management mechanisms and IAM roles where possible.

---

## 7. Use ShellCheck

```bash
shellcheck script.sh
```

---

## 8. Use logging

Example:

```bash
echo "$(date '+%F %T') - Backup started"
```

---

# 🐞 Common Shell Scripting Problems

### Permission denied

Error:

```text
Permission denied
```

Solution:

```bash
chmod +x script.sh
```

---

### Bad interpreter

Error:

```text
bad interpreter
```

Check:

```bash
head -n 1 script.sh
```

Expected:

```bash
#!/bin/bash
```

---

### Windows line endings

If a script was created on Windows, it may contain CRLF line endings.

Check:

```bash
file script.sh
```

Convert using:

```bash
dos2unix script.sh
```

---

### Command not found

Example:

```text
command not found
```

Check:

```bash
which command
```

or:

```bash
command -v command
```

---

### Script works manually but not from cron

Check:

```bash
echo "$PATH"
```

Cron may have a different environment.

Use absolute paths where appropriate:

```bash
/usr/bin/date
/usr/bin/tar
```

and define required environment variables explicitly.

---

# 🎯 Shell Scripting Learning Path

```text
Variables
    ↓
Conditions
    ↓
Loops
    ↓
Functions
    ↓
Arguments
    ↓
Exit Codes
    ↓
Error Handling
    ↓
Text Processing
    ↓
Automation
    ↓
Cron / Systemd Timers
    ↓
AWS CLI
    ↓
Cloud Automation
```

---

# 💼 Cloud Engineer Relevance

Shell scripting is commonly used in:

### AWS EC2

```text
Install software
Configure servers
Mount EBS
Configure applications
Monitor instances
```

### DevOps

```text
Build automation
Deployment scripts
CI/CD
Server configuration
Log collection
```

### Linux Administration

```text
User management
Backup
Monitoring
Service management
Disk management
```

### Cloud Automation

```text
AWS CLI
Infrastructure automation
Instance initialization
Operational scripts
Troubleshooting
```

---

# 🎤 Interview Questions

### Beginner

1. What is shell scripting?
2. What is Bash?
3. What is a shebang?
4. How do you execute a shell script?
5. How do you make a script executable?
6. What is the difference between `bash script.sh` and `./script.sh`?
7. What is a variable?
8. How do you access a variable?
9. What is `$PATH`?
10. What is an exit status?

### Intermediate

11. What is `$?`?
12. What is `$0`?
13. What is `$1`?
14. What is `$#`?
15. What is `$@`?
16. What is the difference between `$@` and `$*`?
17. How do you check whether a file exists?
18. How do you check whether a service is running?
19. What are loops?
20. What are functions?
21. How do you debug a shell script?
22. What does `set -e` do?
23. What does `set -u` do?
24. What does `set -o pipefail` do?
25. What is ShellCheck?

### AWS / Cloud Engineer

26. How would you configure an EC2 instance using User Data?
27. How would you automate Nginx installation on EC2?
28. How would you monitor disk usage using a shell script?
29. How would you check whether an EC2 service is running?
30. How can Bash scripts interact with AWS?
31. How would you upload a backup to S3 using AWS CLI?
32. How would you securely provide AWS permissions to an EC2 script?
33. How would you troubleshoot a User Data script that failed?
34. How would you create a server health-check script?
35. How would you automate deployment using Bash?

---

# 🧪 Practice Challenges

Try to create the following scripts yourself:

### Challenge 1

Create a script that prints:

```text
Hostname
IP Address
Current User
Kernel Version
Uptime
```

---

### Challenge 2

Create a script that checks disk usage.

If usage is greater than 80%:

```text
WARNING: Disk usage is high
```

Otherwise:

```text
Disk usage is normal
```

---

### Challenge 3

Create a script that accepts a username:

```bash
./user-check.sh username
```

Check whether the user exists.

---

### Challenge 4

Create a script that accepts a service name:

```bash
./service-check.sh nginx
```

Check whether the service is running.

---

### Challenge 5

Create a backup script:

```bash
./backup.sh /var/www/html /backup
```

Create a compressed backup containing the current date.

---

# 📋 Final Checklist

Before completing this section, make sure you can:

- [ ] Explain what shell scripting is
- [ ] Explain Bash
- [ ] Create a `.sh` file
- [ ] Use a shebang
- [ ] Execute a script
- [ ] Use variables
- [ ] Use environment variables
- [ ] Use command substitution
- [ ] Write `if` conditions
- [ ] Use file tests
- [ ] Use loops
- [ ] Create functions
- [ ] Pass arguments
- [ ] Understand exit codes
- [ ] Handle errors
- [ ] Debug scripts
- [ ] Use `bash -x`
- [ ] Use `bash -n`
- [ ] Use ShellCheck
- [ ] Create backup scripts
- [ ] Monitor disk usage
- [ ] Monitor services
- [ ] Check Linux users
- [ ] Automate EC2 configuration
- [ ] Use shell scripts with AWS CLI
- [ ] Understand IAM role usage with EC2 automation

---

# 📚 Files in This Section

| File                           | Topic                               |
| ------------------------------ | ----------------------------------- |
| [Variables.md](Variables.md)   | Variables and environment variables |
| [Conditions.md](Conditions.md) | `if`, tests and decision making     |
| [Loops.md](Loops.md)           | `for`, `while`, `until`             |
| [Functions.md](Functions.md)   | Reusable functions                  |
| [Arguments.md](Arguments.md)   | Script arguments and parameters     |

### Scripts

| Script                                       | Purpose            |
| -------------------------------------------- | ------------------ |
| [backup.sh](Scripts/backup.sh)               | Backup automation  |
| [disk-usage.sh](Scripts/disk-usage.sh)       | Disk monitoring    |
| [user-check.sh](Scripts/user-check.sh)       | User validation    |
| [service-check.sh](Scripts/service-check.sh) | Service monitoring |

---

# 🚀 Next Step

Continue with:

👉 **[Variables.md](Variables.md)**

You will learn how to work with:

```text
Variables
Environment Variables
Command Substitution
User Input
Quoting
Arrays
Readonly Variables
Export
```

---

⭐ **Goal:** Don't just memorize Bash commands. Build scripts that solve real Linux and AWS operational problems.
