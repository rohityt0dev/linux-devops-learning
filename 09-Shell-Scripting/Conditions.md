# 🔀 Bash Conditions

## 📌 Overview

Conditions allow a Bash script to **make decisions**.

Instead of always executing the same commands, a script can check a situation and decide what to do.

For example:

```text
Is the user root?
        │
   ┌────┴────┐
  YES        NO
   │          │
Continue    Show error
```

Conditions are extremely important for:

- Server monitoring
- User validation
- File checking
- Service checking
- Disk monitoring
- Backup scripts
- Deployment automation
- AWS EC2 automation
- Troubleshooting

---

# 🎯 Learning Objectives

After completing this topic, you should understand:

- `if`
- `elif`
- `else`
- `[[ ]]`
- `[ ]`
- File tests
- Directory tests
- String comparisons
- Numeric comparisons
- Logical operators
- Command exit status
- `case`
- Nested conditions
- Input validation
- Practical Linux automation
- AWS condition-based automation

---

# 1. Basic `if` Statement

The basic syntax is:

```bash
if condition
then
    commands
fi
```

Example:

```bash
#!/bin/bash

AGE=25

if [[ "$AGE" -ge 18 ]]
then
    echo "You are an adult"
fi
```

Output:

```text
You are an adult
```

---

# 2. One-Line `if`

Bash also supports:

```bash
if [[ "$AGE" -ge 18 ]]; then
    echo "Adult"
fi
```

This is commonly used in scripts.

---

# 3. Understanding `then`

The `then` keyword starts the commands that should execute when the condition is true.

Example:

```bash
if [[ "$USER" == "root" ]]; then
    echo "Running as root"
fi
```

---

# 4. `else`

Use `else` when you want an alternative action.

Syntax:

```bash
if condition
then
    commands
else
    commands
fi
```

Example:

```bash
#!/bin/bash

AGE=16

if [[ "$AGE" -ge 18 ]]; then
    echo "Adult"
else
    echo "Minor"
fi
```

Output:

```text
Minor
```

---

# 5. `elif`

Use `elif` when there are multiple possible conditions.

Syntax:

```bash
if condition1; then
    commands
elif condition2; then
    commands
else
    commands
fi
```

Example:

```bash
#!/bin/bash

AGE=25

if [[ "$AGE" -lt 13 ]]; then
    echo "Child"
elif [[ "$AGE" -lt 18 ]]; then
    echo "Teenager"
else
    echo "Adult"
fi
```

Output:

```text
Adult
```

---

# 6. Multiple Conditions

Example:

```bash
#!/bin/bash

AGE=25
COUNTRY="India"

if [[ "$AGE" -ge 18 && "$COUNTRY" == "India" ]]; then
    echo "Condition matched"
else
    echo "Condition did not match"
fi
```

---

# 7. `[[ ]]` Test Syntax

Modern Bash scripts commonly use:

```bash
[[ condition ]]
```

Example:

```bash
if [[ "$NAME" == "Rohit" ]]; then
    echo "Name matched"
fi
```

Advantages of `[[ ]]` include safer handling of many common string and pattern comparisons.

For Bash scripts, prefer `[[ ]]` when you don't need POSIX `sh` compatibility.

---

# 8. `[ ]` Test Syntax

You may also see:

```bash
[ condition ]
```

Example:

```bash
if [ "$AGE" -ge 18 ]; then
    echo "Adult"
fi
```

Important:

```bash
[ "$AGE" -ge 18 ]
```

contains spaces.

This is incorrect:

```bash
["$AGE" -ge 18]
```

---

# 🆚 `[[ ]]` vs `[ ]`

| Syntax | Purpose |
|---|---|
| `[[ ]]` | Bash conditional expression |
| `[ ]` | Traditional `test` command syntax |

For Bash scripts:

```bash
[[ ]]
```

is generally preferred.

---

# 9. String Comparisons

String comparisons are used to compare text.

Example:

```bash
NAME="Rohit"

if [[ "$NAME" == "Rohit" ]]; then
    echo "Name matched"
fi
```

---

# 10. String Equal

```bash
if [[ "$NAME" == "Rohit" ]]; then
    echo "Equal"
fi
```

---

# 11. String Not Equal

```bash
if [[ "$NAME" != "Rohit" ]]; then
    echo "Not equal"
fi
```

---

# 12. Check Empty String

Use `-z`:

```bash
if [[ -z "$NAME" ]]; then
    echo "NAME is empty"
fi
```

Example:

```bash
NAME=""

if [[ -z "$NAME" ]]; then
    echo "No name provided"
fi
```

---

# 13. Check Non-Empty String

Use `-n`:

```bash
if [[ -n "$NAME" ]]; then
    echo "NAME contains a value"
fi
```

Example:

```bash
NAME="Rohit"

if [[ -n "$NAME" ]]; then
    echo "Name provided"
fi
```

---

# 📊 String Operators

| Operator | Meaning |
|---|---|
| `==` | Equal |
| `!=` | Not equal |
| `-z` | String is empty |
| `-n` | String is not empty |

---

# 14. Case Sensitivity

Bash string comparisons are case-sensitive.

Example:

```bash
NAME="Rohit"

if [[ "$NAME" == "rohit" ]]; then
    echo "Matched"
else
    echo "Not matched"
fi
```

Output:

```text
Not matched
```

---

# 15. Numeric Comparisons

For numbers, use numeric operators.

Example:

```bash
AGE=25

if [[ "$AGE" -ge 18 ]]; then
    echo "Adult"
fi
```

---

# 📊 Numeric Operators

| Operator | Meaning |
|---|---|
| `-eq` | Equal |
| `-ne` | Not equal |
| `-gt` | Greater than |
| `-ge` | Greater than or equal |
| `-lt` | Less than |
| `-le` | Less than or equal |

---

# 16. Examples of Numeric Comparisons

### Equal

```bash
if [[ "$A" -eq "$B" ]]; then
    echo "Equal"
fi
```

### Not Equal

```bash
if [[ "$A" -ne "$B" ]]; then
    echo "Not equal"
fi
```

### Greater Than

```bash
if [[ "$A" -gt "$B" ]]; then
    echo "A is greater"
fi
```

### Greater Than or Equal

```bash
if [[ "$A" -ge "$B" ]]; then
    echo "A is greater or equal"
fi
```

### Less Than

```bash
if [[ "$A" -lt "$B" ]]; then
    echo "A is smaller"
fi
```

### Less Than or Equal

```bash
if [[ "$A" -le "$B" ]]; then
    echo "A is smaller or equal"
fi
```

---

# 17. Arithmetic Conditions

You can also use arithmetic evaluation:

```bash
if (( AGE >= 18 )); then
    echo "Adult"
fi
```

Example:

```bash
A=20
B=10

if (( A > B )); then
    echo "A is greater than B"
fi
```

For arithmetic conditions, `(( ))` is often cleaner than using `-gt`, `-lt`, etc.

---

# 18. File Conditions

Bash provides many file tests.

These are extremely useful for Linux administration.

---

# 📁 File Test Operators

| Operator | Meaning |
|---|---|
| `-e` | Path exists |
| `-f` | Regular file exists |
| `-d` | Directory exists |
| `-r` | File is readable |
| `-w` | File is writable |
| `-x` | File is executable |
| `-s` | File exists and is not empty |
| `-L` | Symbolic link |
| `-b` | Block device |
| `-c` | Character device |

---

# 19. Check Whether a File Exists

```bash
if [[ -e "/etc/passwd" ]]; then
    echo "Path exists"
fi
```

---

# 20. Check Regular File

Use `-f`:

```bash
FILE="/etc/passwd"

if [[ -f "$FILE" ]]; then
    echo "$FILE is a regular file"
fi
```

---

# 21. Check Directory

Use `-d`:

```bash
DIR="/var/log"

if [[ -d "$DIR" ]]; then
    echo "$DIR exists"
fi
```

---

# 22. Check Read Permission

```bash
FILE="/etc/passwd"

if [[ -r "$FILE" ]]; then
    echo "File is readable"
fi
```

---

# 23. Check Write Permission

```bash
FILE="test.txt"

if [[ -w "$FILE" ]]; then
    echo "File is writable"
fi
```

---

# 24. Check Execute Permission

```bash
FILE="script.sh"

if [[ -x "$FILE" ]]; then
    echo "File is executable"
fi
```

---

# 25. Check File Size

Use:

```bash
-s
```

Example:

```bash
FILE="data.txt"

if [[ -s "$FILE" ]]; then
    echo "File contains data"
else
    echo "File is empty or does not exist"
fi
```

---

# 26. Check Symbolic Link

```bash
if [[ -L "$FILE" ]]; then
    echo "It is a symbolic link"
fi
```

---

# 27. Check Multiple Conditions

Use:

```bash
&&
```

for AND.

Example:

```bash
if [[ -f "$FILE" && -r "$FILE" ]]; then
    echo "File exists and is readable"
fi
```

---

# 28. OR Conditions

Use:

```bash
||
```

Example:

```bash
if [[ "$USER" == "root" || "$USER" == "admin" ]]; then
    echo "Privileged user"
fi
```

---

# 29. NOT Condition

Use:

```bash
!
```

Example:

```bash
if [[ ! -f "$FILE" ]]; then
    echo "File does not exist"
fi
```

---

# 📊 Logical Operators

| Operator | Meaning |
|---|---|
| `&&` | AND |
| `||` | OR |
| `!` | NOT |

---

# 30. Combining Conditions

Example:

```bash
AGE=25
USER_TYPE="admin"

if [[ "$AGE" -ge 18 && "$USER_TYPE" == "admin" ]]; then
    echo "Access allowed"
else
    echo "Access denied"
fi
```

---

# 31. Nested Conditions

A condition can contain another condition.

Example:

```bash
#!/bin/bash

FILE="/etc/passwd"

if [[ -e "$FILE" ]]; then

    echo "File exists"

    if [[ -r "$FILE" ]]; then
        echo "File is readable"
    else
        echo "File is not readable"
    fi

else

    echo "File does not exist"

fi
```

Nested conditions are useful but avoid excessive nesting when simpler logic is possible.

---

# 32. Command Success as a Condition

Linux commands return exit statuses.

Example:

```bash
if systemctl is-active --quiet ssh; then
    echo "SSH is running"
else
    echo "SSH is not running"
fi
```

This is a very important Bash pattern.

You don't always need to manually check `$?`.

---

# 33. Check Whether a Command Exists

Use:

```bash
command -v
```

Example:

```bash
if command -v nginx &>/dev/null; then
    echo "Nginx is installed"
else
    echo "Nginx is not installed"
fi
```

Another example:

```bash
if command -v aws &>/dev/null; then
    echo "AWS CLI is installed"
else
    echo "AWS CLI is not installed"
fi
```

This is very useful in automation scripts.

---

# 34. Check a Service

Example:

```bash
SERVICE="nginx"

if systemctl is-active --quiet "$SERVICE"; then
    echo "$SERVICE is running"
else
    echo "$SERVICE is not running"
fi
```

This is useful for:

```text
Nginx
Apache
SSH
Docker
Database services
Cloud agents
```

---

# 35. Check a User

Use:

```bash
id
```

Example:

```bash
USERNAME="rohit"

if id "$USERNAME" &>/dev/null; then
    echo "User exists"
else
    echo "User does not exist"
fi
```

This is useful for provisioning scripts.

---

# 36. Check Disk Usage

Example:

```bash
USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [[ "$USAGE" -ge 80 ]]; then
    echo "WARNING: Disk usage is high"
else
    echo "Disk usage is normal"
fi
```

This is a real-world Linux monitoring example.

---

# 37. Check Memory

You can use:

```bash
free
```

Example:

```bash
MEMORY=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

if [[ "$MEMORY" -ge 80 ]]; then
    echo "WARNING: Memory usage is high"
else
    echo "Memory usage is normal"
fi
```

---

# 38. Check CPU Load

Example:

```bash
LOAD=$(awk '{print $1}' /proc/loadavg)

echo "Current load: $LOAD"
```

For a production health-check script, compare load against a threshold appropriate for the number of CPU cores rather than using a universal fixed value.

---

# 39. Check Network Connectivity

Example:

```bash
if ping -c 1 -W 2 8.8.8.8 &>/dev/null; then
    echo "Network is reachable"
else
    echo "Network is unavailable"
fi
```

This checks basic IP connectivity.

For DNS:

```bash
if getent hosts example.com &>/dev/null; then
    echo "DNS is working"
else
    echo "DNS lookup failed"
fi
```

---

# 40. Check HTTP Service

Using `curl`:

```bash
if curl -fsS http://localhost &>/dev/null; then
    echo "Web server is responding"
else
    echo "Web server is not responding"
fi
```

This is useful for monitoring web applications.

---

# 41. `case` Statement

`case` is useful when you have many possible values.

Syntax:

```bash
case "$VARIABLE" in
    value1)
        commands
        ;;
    value2)
        commands
        ;;
    *)
        default commands
        ;;
esac
```

---

# 42. Basic `case` Example

```bash
#!/bin/bash

CHOICE="start"

case "$CHOICE" in
    start)
        echo "Starting service"
        ;;
    stop)
        echo "Stopping service"
        ;;
    restart)
        echo "Restarting service"
        ;;
    *)
        echo "Unknown option"
        ;;
esac
```

---

# 43. `case` With User Input

```bash
#!/bin/bash

read -p "Enter action: " ACTION

case "$ACTION" in
    start)
        echo "Starting"
        ;;
    stop)
        echo "Stopping"
        ;;
    restart)
        echo "Restarting"
        ;;
    status)
        echo "Checking status"
        ;;
    *)
        echo "Invalid action"
        ;;
esac
```

---

# 44. Multiple Patterns in `case`

You can match multiple values.

```bash
case "$OS" in
    ubuntu|debian)
        echo "Debian-based system"
        ;;
    rhel|rocky|almalinux|fedora|amazon)
        echo "RPM-based system"
        ;;
    *)
        echo "Unknown distribution"
        ;;
esac
```

---

# 45. Wildcards in `case`

Example:

```bash
case "$FILE" in
    *.log)
        echo "Log file"
        ;;
    *.sh)
        echo "Shell script"
        ;;
    *.txt)
        echo "Text file"
        ;;
    *)
        echo "Unknown file type"
        ;;
esac
```

---

# 46. `if` vs `case`

Use `if` for:

```text
Conditions
Comparisons
Ranges
File tests
Logical expressions
```

Use `case` for:

```text
Multiple known values
Menu options
Commands
Modes
Actions
```

Example:

```text
if
│
├── Is disk > 80%?
├── Does file exist?
└── Is service running?

case
│
├── start
├── stop
├── restart
└── status
```

---

# 47. Input Validation

Always validate important user input.

Example:

```bash
#!/bin/bash

read -p "Enter age: " AGE

if [[ ! "$AGE" =~ ^[0-9]+$ ]]; then
    echo "Invalid age"
    exit 1
fi

if (( AGE >= 18 )); then
    echo "Adult"
else
    echo "Minor"
fi
```

The regular expression:

```text
^[0-9]+$
```

allows only digits.

---

# 48. Validate a Directory

```bash
#!/bin/bash

read -p "Enter directory: " DIR

if [[ -d "$DIR" ]]; then
    echo "Directory exists"
else
    echo "Directory does not exist"
    exit 1
fi
```

---

# 49. Validate a File

```bash
#!/bin/bash

read -p "Enter file: " FILE

if [[ -f "$FILE" ]]; then
    echo "File exists"
else
    echo "File does not exist"
    exit 1
fi
```

---

# 50. Check Root User

Some Linux administration tasks require root privileges.

Example:

```bash
if [[ "$EUID" -ne 0 ]]; then
    echo "Please run this script as root"
    exit 1
fi
```

This is useful for scripts that need to modify system files or services.

---

# 51. Check Root Privileges Safely

Example:

```bash
#!/bin/bash

if (( EUID != 0 )); then
    echo "ERROR: This script must be run as root."
    exit 1
fi

echo "Running with root privileges."
```

---

# 52. AWS EC2 Condition Example

Check whether AWS CLI exists:

```bash
if command -v aws &>/dev/null; then
    echo "AWS CLI is installed"
else
    echo "AWS CLI is not installed"
fi
```

---

# 53. AWS Region Validation

Example:

```bash
AWS_REGION="${AWS_REGION:-ap-south-1}"

if [[ -z "$AWS_REGION" ]]; then
    echo "AWS region is required"
    exit 1
fi

echo "Using region: $AWS_REGION"
```

---

# 54. Check S3 Bucket Access

Example:

```bash
BUCKET="my-linux-backup-bucket"

if aws s3 ls "s3://$BUCKET" &>/dev/null; then
    echo "S3 bucket is accessible"
else
    echo "Cannot access S3 bucket"
    exit 1
fi
```

This depends on:

```text
AWS CLI
IAM permissions
Network connectivity
Bucket name
AWS credentials or IAM role
```

For EC2, an IAM instance role is preferable to hard-coded access keys.

---

# 55. AWS EC2 Web Server Check

Example:

```bash
if systemctl is-active --quiet nginx; then
    echo "Nginx is running"
else
    echo "Nginx is not running"
    exit 1
fi
```

Then test HTTP:

```bash
if curl -fsS http://localhost &>/dev/null; then
    echo "Website is responding"
else
    echo "Website is not responding"
    exit 1
fi
```

---

# 🧪 Hands-On Lab 1 — File Check

Create:

```bash
vim file-check.sh
```

Add:

```bash
#!/bin/bash

FILE="/etc/passwd"

if [[ -f "$FILE" ]]; then
    echo "$FILE exists"
else
    echo "$FILE does not exist"
fi
```

Run:

```bash
chmod +x file-check.sh
./file-check.sh
```

---

# 🧪 Hands-On Lab 2 — Directory Check

```bash
#!/bin/bash

DIR="/var/log"

if [[ -d "$DIR" ]]; then
    echo "$DIR exists"
else
    echo "$DIR does not exist"
fi
```

---

# 🧪 Hands-On Lab 3 — Service Check

```bash
#!/bin/bash

SERVICE="$1"

if [[ -z "$SERVICE" ]]; then
    echo "Usage: $0 <service>"
    exit 1
fi

if systemctl is-active --quiet "$SERVICE"; then
    echo "$SERVICE is running"
else
    echo "$SERVICE is not running"
fi
```

Run:

```bash
chmod +x service-check.sh
./service-check.sh ssh
```

On some distributions:

```bash
./service-check.sh sshd
```

---

# 🧪 Hands-On Lab 4 — Disk Monitoring

Create:

```bash
vim disk-usage.sh
```

Add:

```bash
#!/bin/bash

USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [[ "$USAGE" -ge 80 ]]; then
    echo "WARNING: Disk usage is ${USAGE}%"
else
    echo "Disk usage is ${USAGE}%"
    echo "Disk usage is normal"
fi
```

Run:

```bash
chmod +x disk-usage.sh
./disk-usage.sh
```

---

# 🧪 Hands-On Lab 5 — User Check

Create:

```bash
vim user-check.sh
```

Add:

```bash
#!/bin/bash

USERNAME="$1"

if [[ -z "$USERNAME" ]]; then
    echo "Usage: $0 <username>"
    exit 1
fi

if id "$USERNAME" &>/dev/null; then
    echo "User $USERNAME exists"
else
    echo "User $USERNAME does not exist"
fi
```

Run:

```bash
chmod +x user-check.sh
./user-check.sh root
```

---

# 🧪 Hands-On Lab 6 — Network Check

```bash
#!/bin/bash

HOST="example.com"

if getent hosts "$HOST" &>/dev/null; then
    echo "DNS resolution works for $HOST"
else
    echo "DNS resolution failed for $HOST"
fi
```

---

# 🏗️ Mini Project — Linux Server Health Check

Create:

```bash
vim health-check.sh
```

Use conditions to check:

```text
1. Current user
2. Disk usage
3. Memory usage
4. SSH service
5. Network connectivity
6. HTTP service
```

Example:

```bash
#!/bin/bash

echo "================================"
echo "     Linux Server Health Check"
echo "================================"

# Check disk
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [[ "$DISK" -ge 80 ]]; then
    echo "❌ Disk: WARNING (${DISK}%)"
else
    echo "✅ Disk: OK (${DISK}%)"
fi

# Check SSH
if systemctl is-active --quiet ssh 2>/dev/null || \
   systemctl is-active --quiet sshd 2>/dev/null; then
    echo "✅ SSH: Running"
else
    echo "❌ SSH: Not running"
fi

# Check DNS
if getent hosts example.com &>/dev/null; then
    echo "✅ DNS: Working"
else
    echo "❌ DNS: Failed"
fi

echo "================================"
echo "Health check completed"
echo "================================"
```

---

# 🐞 Common Condition Errors

## Error 1 — Missing Spaces

Wrong:

```bash
if[ "$AGE" -ge 18 ]; then
```

Correct:

```bash
if [[ "$AGE" -ge 18 ]]; then
```

---

## Error 2 — Using `=` for Numeric Comparison

Wrong:

```bash
if [[ "$AGE" = 18 ]]; then
```

This is a string comparison.

For numeric equality:

```bash
if [[ "$AGE" -eq 18 ]]; then
```

Or:

```bash
if (( AGE == 18 )); then
```

---

## Error 3 — Forgetting `fi`

Wrong:

```bash
if [[ "$AGE" -ge 18 ]]; then
    echo "Adult"
```

Correct:

```bash
if [[ "$AGE" -ge 18 ]]; then
    echo "Adult"
fi
```

---

## Error 4 — Forgetting `;;` in `case`

Wrong:

```bash
case "$ACTION" in
    start)
        echo "Starting"
    stop)
        echo "Stopping"
esac
```

Correct:

```bash
case "$ACTION" in
    start)
        echo "Starting"
        ;;
    stop)
        echo "Stopping"
        ;;
esac
```

---

## Error 5 — Unquoted Variables

Risky:

```bash
if [[ -f $FILE ]]; then
```

Prefer:

```bash
if [[ -f "$FILE" ]]; then
```

---

# 🧪 Syntax Checking

Before running your script:

```bash
bash -n script.sh
```

Example:

```bash
bash -n health-check.sh
```

Then run:

```bash
bash -x health-check.sh
```

Use ShellCheck:

```bash
shellcheck health-check.sh
```

---

# 🎤 Interview Questions

## Beginner

1. What is an `if` statement?
2. What is `elif`?
3. What is `else`?
4. What is `fi`?
5. What is the difference between `[[ ]]` and `[ ]`?
6. How do you compare strings?
7. How do you compare numbers?
8. How do you check whether a file exists?
9. How do you check whether a directory exists?
10. How do you check whether a variable is empty?

## Intermediate

11. What is `-eq`?
12. What is `-gt`?
13. What is `-ge`?
14. What is `-lt`?
15. What is `-le`?
16. What does `-f` mean?
17. What does `-d` mean?
18. What does `-r` mean?
19. What does `-x` mean?
20. What does `-z` mean?
21. What does `-n` mean?
22. How do you use AND conditions?
23. How do you use OR conditions?
24. How do you use NOT conditions?
25. What is a `case` statement?
26. When would you use `case` instead of `if`?

## AWS / Cloud Engineer

27. How would you check whether Nginx is running?
28. How would you check whether AWS CLI is installed?
29. How would you check whether an S3 bucket is accessible?
30. How would you create a disk-usage monitoring script?
31. How would you check whether EC2 has network connectivity?
32. How would you validate a required environment variable?
33. How would you write a Linux health-check script?
34. How would you use conditions in EC2 User Data?
35. How would you prevent a deployment script from continuing after a failed command?

---

# 🧠 Practice Challenges

### Challenge 1 — File Checker

Create:

```bash
./file-check.sh /etc/passwd
```

The script should print:

```text
File exists
```

or:

```text
File does not exist
```

---

### Challenge 2 — Directory Checker

Create:

```bash
./directory-check.sh /var/log
```

Check whether the directory exists.

---

### Challenge 3 — Service Checker

Create:

```bash
./service-check.sh nginx
```

Print:

```text
Nginx is running
```

or:

```text
Nginx is not running
```

---

### Challenge 4 — Disk Alert

Create a script that:

```text
< 70%  → Normal
70-80% → Warning
> 80%  → Critical
```

---

### Challenge 5 — User Validation

Create:

```bash
./user-check.sh rohit
```

Check whether the Linux user exists.

---

### Challenge 6 — Menu Script

Create a menu:

```text
1. Start Nginx
2. Stop Nginx
3. Restart Nginx
4. Check Status
5. Exit
```

Use `case` to process the user's selection.

---

# 📋 Final Checklist

Before moving to `Loops.md`, make sure you can:

- [ ] Use `if`
- [ ] Use `elif`
- [ ] Use `else`
- [ ] Use `fi`
- [ ] Use `[[ ]]`
- [ ] Understand `[ ]`
- [ ] Compare strings
- [ ] Compare numbers
- [ ] Use arithmetic conditions
- [ ] Check files
- [ ] Check directories
- [ ] Check permissions
- [ ] Check empty variables
- [ ] Use `&&`
- [ ] Use `||`
- [ ] Use `!`
- [ ] Check command success
- [ ] Check services
- [ ] Check users
- [ ] Check disk usage
- [ ] Check network connectivity
- [ ] Use `case`
- [ ] Validate user input
- [ ] Validate root privileges
- [ ] Use conditions in AWS automation
- [ ] Complete the Linux health-check project

---

# 🚀 Next Topic

Continue with:

👉 **[Loops.md](./Loops.md)**

You will learn:

```text
for
while
until
break
continue
C-style for loops
Reading files
Arrays with loops
Nested loops
Practical automation
```

---

⭐ **Goal:** Learn to make Bash scripts intelligent by allowing them to make decisions based on the current Linux system state.