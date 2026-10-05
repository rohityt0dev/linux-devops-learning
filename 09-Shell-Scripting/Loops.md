# 🔁 Bash Loops

## 📌 Overview

Loops allow a Bash script to **repeat a command or group of commands**.

Instead of writing:

```bash
echo "Server 1"
echo "Server 2"
echo "Server 3"
echo "Server 4"
```

you can use a loop:

```bash
for SERVER in server1 server2 server3 server4
do
    echo "$SERVER"
done
```

Loops are extremely useful for Linux and Cloud automation.

Common use cases:

- Processing multiple files
- Checking multiple servers
- Creating multiple users
- Installing packages
- Monitoring services
- Processing logs
- Working with arrays
- AWS resource automation
- Backup automation
- Server health checks

---

# 🎯 Learning Objectives

After completing this topic, you should understand:

- `for` loops
- `while` loops
- `until` loops
- C-style `for` loops
- `break`
- `continue`
- Nested loops
- Arrays with loops
- Reading files with loops
- Command output with loops
- Loop conditions
- Infinite loops
- Practical Linux automation
- AWS automation using loops

---

# 🔄 Types of Bash Loops

Bash provides several common loop structures:

```text
for
│
├── List-based for loop
├── C-style for loop
└── Loop through files

while
│
└── Repeat while condition is true

until
│
└── Repeat until condition becomes true
```

---

# 1. Basic `for` Loop

Syntax:

```bash
for VARIABLE in VALUE1 VALUE2 VALUE3
do
    commands
done
```

Example:

```bash
#!/bin/bash

for SERVER in server1 server2 server3
do
    echo "Server: $SERVER"
done
```

Output:

```text
Server: server1
Server: server2
Server: server3
```

---

# 2. One-Line `for` Loop

You can also write:

```bash
for SERVER in server1 server2 server3; do
    echo "$SERVER"
done
```

This is useful for short scripts.

---

# 3. Loop Through Numbers

```bash
for NUMBER in 1 2 3 4 5
do
    echo "Number: $NUMBER"
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

---

# 4. Using Brace Expansion

Bash supports:

```bash
{1..5}
```

Example:

```bash
for NUMBER in {1..5}
do
    echo "$NUMBER"
done
```

Output:

```text
1
2
3
4
5
```

---

# 5. Reverse Number Loop

```bash
for NUMBER in {5..1}
do
    echo "$NUMBER"
done
```

Output:

```text
5
4
3
2
1
```

---

# 6. Loop With a Step

You can specify a step:

```bash
for NUMBER in {0..10..2}
do
    echo "$NUMBER"
done
```

Output:

```text
0
2
4
6
8
10
```

---

# 7. C-Style `for` Loop

Bash supports C-style loops.

Syntax:

```bash
for (( initialization; condition; increment ))
do
    commands
done
```

Example:

```bash
for (( i=1; i<=5; i++ ))
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

---

# 8. Incrementing a Variable

Example:

```bash
COUNT=1

while [[ "$COUNT" -le 5 ]]
do
    echo "Count: $COUNT"
    ((COUNT++))
done
```

Output:

```text
Count: 1
Count: 2
Count: 3
Count: 4
Count: 5
```

---

# 9. Decrementing

```bash
COUNT=5

while [[ "$COUNT" -ge 1 ]]
do
    echo "Count: $COUNT"
    ((COUNT--))
done
```

Output:

```text
5
4
3
2
1
```

---

# 10. Loop Through an Array

Create an array:

```bash
SERVERS=("web01" "web02" "db01")
```

Loop:

```bash
for SERVER in "${SERVERS[@]}"
do
    echo "Server: $SERVER"
done
```

Output:

```text
Server: web01
Server: web02
Server: db01
```

---

# ⚠️ Why Use `"${ARRAY[@]}"`?

Prefer:

```bash
for SERVER in "${SERVERS[@]}"
```

instead of:

```bash
for SERVER in ${SERVERS[@]}
```

Quoting preserves each array element as a separate item, including elements containing spaces.

---

# 11. Array Index Loop

You can also loop through indexes.

```bash
SERVERS=("web01" "web02" "db01")

for INDEX in "${!SERVERS[@]}"
do
    echo "Index: $INDEX"
    echo "Server: ${SERVERS[$INDEX]}"
done
```

Output:

```text
Index: 0
Server: web01
Index: 1
Server: web02
Index: 2
Server: db01
```

---

# 12. Loop Through Files

Example:

```bash
for FILE in *.txt
do
    echo "File: $FILE"
done
```

This processes `.txt` files in the current directory.

---

# 13. Check Whether Files Exist

A safer pattern when a glob may not match anything:

```bash
for FILE in *.txt
do
    [[ -e "$FILE" ]] || continue

    echo "File: $FILE"
done
```

Another Bash-specific option is `nullglob`:

```bash
shopt -s nullglob

for FILE in *.txt
do
    echo "File: $FILE"
done
```

With `nullglob`, an unmatched pattern expands to nothing.

---

# 14. Process Multiple File Types

```bash
for FILE in *.log
do
    [[ -e "$FILE" ]] || continue
    echo "Processing: $FILE"
done
```

Useful for:

```text
Log processing
Backup
Compression
Cleanup
File analysis
```

---

# 15. Loop Through Directories

```bash
for DIR in */
do
    echo "Directory: $DIR"
done
```

This lists directories in the current directory.

---

# 16. Loop Through Command Output

Example:

```bash
for USER in $(cut -d: -f1 /etc/passwd)
do
    echo "User: $USER"
done
```

This can work when the command output is simple and whitespace-separated.

However, command substitution performs word splitting, so it is **not safe for arbitrary filenames or data containing spaces/newlines**.

For line-oriented data, prefer a `while read` loop.

---

# 17. Read a File Line by Line

Suppose:

```text
servers.txt
```

contains:

```text
web01
web02
web03
db01
```

Use:

```bash
while IFS= read -r SERVER
do
    echo "Server: $SERVER"
done < servers.txt
```

This is the preferred pattern for reading a text file line by line.

---

# 18. Why `IFS= read -r`?

This pattern:

```bash
while IFS= read -r LINE
```

helps preserve the contents of each line.

- `IFS=` prevents unwanted trimming/splitting
- `-r` prevents backslash escaping

This is safer than:

```bash
for LINE in $(cat file.txt)
```

for general text processing.

---

# 19. Read File With Line Numbers

```bash
LINE_NUMBER=1

while IFS= read -r LINE
do
    echo "$LINE_NUMBER: $LINE"
    ((LINE_NUMBER++))
done < servers.txt
```

Output:

```text
1: web01
2: web02
3: web03
4: db01
```

---

# 20. Read CSV-Style Data

Example file:

```text
users.txt
```

contains:

```text
rohit,cloud
rahul,devops
amit,linux
```

Read fields:

```bash
while IFS=',' read -r USER ROLE
do
    echo "User: $USER"
    echo "Role: $ROLE"
done < users.txt
```

Output:

```text
User: rohit
Role: cloud
User: rahul
Role: devops
User: amit
Role: linux
```

---

# 21. `while` Loop

A `while` loop executes while a condition is true.

Syntax:

```bash
while condition
do
    commands
done
```

Example:

```bash
COUNT=1

while [[ "$COUNT" -le 5 ]]
do
    echo "Count: $COUNT"
    ((COUNT++))
done
```

---

# 22. Infinite `while` Loop

Example:

```bash
while true
do
    echo "Running..."
    sleep 5
done
```

Stop with:

```text
Ctrl + C
```

Infinite loops can be useful for long-running monitoring scripts, but they should have a clear exit or signal-handling strategy in production.

---

# 23. `while` Loop With User Input

```bash
while true
do
    read -p "Enter command: " COMMAND

    if [[ "$COMMAND" == "exit" ]]; then
        break
    fi

    echo "You entered: $COMMAND"
done
```

This continues until the user enters:

```text
exit
```

---

# 24. `until` Loop

An `until` loop runs until a condition becomes true.

Syntax:

```bash
until condition
do
    commands
done
```

Example:

```bash
COUNT=1

until [[ "$COUNT" -gt 5 ]]
do
    echo "Count: $COUNT"
    ((COUNT++))
done
```

Output:

```text
Count: 1
Count: 2
Count: 3
Count: 4
Count: 5
```

---

# 25. `while` vs `until`

| Loop | Continues While |
|---|---|
| `while` | Condition is true |
| `until` | Condition is false |

Example:

```text
while
condition = true
     ↓
continue
```

```text
until
condition = false
     ↓
continue
```

---

# 26. `break`

`break` immediately exits the loop.

Example:

```bash
for NUMBER in {1..10}
do
    if [[ "$NUMBER" -eq 5 ]]; then
        break
    fi

    echo "$NUMBER"
done
```

Output:

```text
1
2
3
4
```

---

# 27. `continue`

`continue` skips the current iteration and moves to the next one.

Example:

```bash
for NUMBER in {1..5}
do
    if [[ "$NUMBER" -eq 3 ]]; then
        continue
    fi

    echo "$NUMBER"
done
```

Output:

```text
1
2
4
5
```

---

# 🆚 `break` vs `continue`

| Command | Action |
|---|---|
| `break` | Exit the loop |
| `continue` | Skip current iteration |

---

# 28. Nested Loops

A loop can contain another loop.

Example:

```bash
for SERVER in web db
do
    for ENV in dev test prod
    do
        echo "Server: $SERVER - Environment: $ENV"
    done
done
```

Output:

```text
Server: web - Environment: dev
Server: web - Environment: test
Server: web - Environment: prod
Server: db - Environment: dev
Server: db - Environment: test
Server: db - Environment: prod
```

---

# 29. Loop Through Users

Get users from `/etc/passwd`:

```bash
while IFS=: read -r USER _ UID _ _ HOME SHELL
do
    echo "User: $USER"
    echo "UID: $UID"
    echo "Home: $HOME"
    echo "Shell: $SHELL"
    echo
done < /etc/passwd
```

This is a useful Linux administration example.

---

# 30. Loop Through Running Processes

You can process command output using a pipeline or process substitution.

Simple example:

```bash
ps -eo pid,comm --no-headers |
while read -r PID COMMAND
do
    echo "PID: $PID - Command: $COMMAND"
done
```

Note that a loop fed by a pipeline may execute in a subshell in Bash, which matters if you need variables modified inside the loop to remain available afterward.

---

# 31. Process Command Output Safely

For Bash scripts where you need to preserve variables outside the loop, process substitution can be useful:

```bash
while read -r PID COMMAND
do
    echo "PID: $PID - Command: $COMMAND"
done < <(ps -eo pid,comm --no-headers)
```

---

# 32. Loop Through Services

You can check several services:

```bash
SERVICES=("ssh" "cron" "nginx")

for SERVICE in "${SERVICES[@]}"
do
    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE: Running"
    else
        echo "$SERVICE: Not running"
    fi
done
```

On different Linux distributions, service names can vary.

For example, SSH may be:

```text
ssh
```

or:

```text
sshd
```

---

# 33. Loop Through Packages

Example:

```bash
PACKAGES=("curl" "git" "vim")

for PACKAGE in "${PACKAGES[@]}"
do
    if command -v "$PACKAGE" &>/dev/null; then
        echo "$PACKAGE: Installed"
    else
        echo "$PACKAGE: Not installed"
    fi
done
```

This checks commands rather than package database records.

For package-specific checks, use the appropriate package manager.

---

# 34. Loop Through Users

Example:

```bash
USERS=("root" "nobody" "admin")

for USERNAME in "${USERS[@]}"
do
    if id "$USERNAME" &>/dev/null; then
        echo "$USERNAME exists"
    else
        echo "$USERNAME does not exist"
    fi
done
```

---

# 35. Loop Through Directories

```bash
DIRECTORIES=(
    "/etc"
    "/var/log"
    "/tmp"
    "/home"
)

for DIR in "${DIRECTORIES[@]}"
do
    if [[ -d "$DIR" ]]; then
        echo "$DIR exists"
    else
        echo "$DIR does not exist"
    fi
done
```

---

# 36. Loop Through Servers

Suppose:

```text
servers.txt
```

contains:

```text
192.168.1.10
192.168.1.20
192.168.1.30
```

Check connectivity:

```bash
while IFS= read -r SERVER
do
    if ping -c 1 -W 2 "$SERVER" &>/dev/null; then
        echo "$SERVER: Reachable"
    else
        echo "$SERVER: Unreachable"
    fi
done < servers.txt
```

This is a simple infrastructure monitoring example.

---

# 37. SSH Loop

Example:

```bash
while IFS= read -r SERVER
do
    echo "Checking $SERVER"

    if ssh -o BatchMode=yes -o ConnectTimeout=5 "$SERVER" "hostname" &>/dev/null; then
        echo "$SERVER: SSH OK"
    else
        echo "$SERVER: SSH failed"
    fi
done < servers.txt
```

This assumes:

- SSH access is configured
- Authentication is available
- The servers are authorized for your use

---

# 38. Loop Through Log Files

Example:

```bash
for LOG in /var/log/*.log
do
    [[ -f "$LOG" ]] || continue

    echo "Checking: $LOG"
    tail -n 5 "$LOG"
done
```

This can be useful for log analysis.

---

# 39. Search Logs With a Loop

```bash
for LOG in /var/log/*.log
do
    [[ -f "$LOG" ]] || continue

    if grep -q "ERROR" "$LOG"; then
        echo "ERROR found in $LOG"
    fi
done
```

---

# 40. Backup Multiple Directories

```bash
#!/bin/bash

BACKUP_DIR="/backup"
DATE=$(date +%F)

DIRECTORIES=(
    "/etc"
    "/var/www/html"
    "/home"
)

mkdir -p "$BACKUP_DIR"

for DIR in "${DIRECTORIES[@]}"
do
    NAME=$(basename "$DIR")

    tar -czf "$BACKUP_DIR/${NAME}-${DATE}.tar.gz" "$DIR"

    echo "Backed up: $DIR"
done
```

This demonstrates:

```text
Arrays
Loops
Variables
Command substitution
File paths
Backup automation
```

---

# 41. Retry Logic With `while`

A common automation pattern is retrying a command.

Example:

```bash
#!/bin/bash

MAX_RETRIES=5
COUNT=1

while (( COUNT <= MAX_RETRIES ))
do
    echo "Attempt $COUNT"

    if curl -fsS https://example.com &>/dev/null; then
        echo "Connection successful"
        break
    fi

    echo "Connection failed"
    ((COUNT++))
    sleep 2
done
```

A production script should also handle the case where all retries fail.

---

# 42. Retry With Failure

```bash
#!/bin/bash

MAX_RETRIES=5
COUNT=1

while (( COUNT <= MAX_RETRIES ))
do
    echo "Attempt $COUNT"

    if curl -fsS https://example.com &>/dev/null; then
        echo "Connection successful"
        exit 0
    fi

    ((COUNT++))
    sleep 2
done

echo "ERROR: Operation failed after $MAX_RETRIES attempts"
exit 1
```

---

# 43. Wait for a Service

Example:

```bash
#!/bin/bash

SERVICE="nginx"
MAX_ATTEMPTS=10
ATTEMPT=1

while (( ATTEMPT <= MAX_ATTEMPTS ))
do
    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE is running"
        exit 0
    fi

    echo "Waiting for $SERVICE..."
    sleep 2
    ((ATTEMPT++))
done

echo "$SERVICE did not become active"
exit 1
```

This pattern is useful in automation.

---

# 44. Wait for a Port

Using `nc`:

```bash
#!/bin/bash

HOST="localhost"
PORT=80
MAX_ATTEMPTS=10
ATTEMPT=1

while (( ATTEMPT <= MAX_ATTEMPTS ))
do
    if nc -z "$HOST" "$PORT" &>/dev/null; then
        echo "Port $PORT is open"
        exit 0
    fi

    echo "Waiting for port $PORT..."
    sleep 2
    ((ATTEMPT++))
done

echo "Port $PORT did not become available"
exit 1
```

---

# 45. AWS EC2 — Loop Through Instances

AWS CLI can be combined with Bash.

For example:

```bash
aws ec2 describe-instances \
    --query 'Reservations[].Instances[].InstanceId' \
    --output text
```

You can process returned instance IDs:

```bash
for INSTANCE_ID in $(aws ec2 describe-instances \
    --query 'Reservations[].Instances[].InstanceId' \
    --output text)
do
    echo "Instance: $INSTANCE_ID"
done
```

For simple whitespace-separated AWS CLI output this can work.

For more complex data, prefer structured output such as JSON and tools like `jq`.

---

# 46. AWS S3 Loop

Suppose you have:

```text
backup1.tar.gz
backup2.tar.gz
backup3.tar.gz
```

Upload each file:

```bash
for FILE in *.tar.gz
do
    [[ -f "$FILE" ]] || continue

    aws s3 cp "$FILE" "s3://my-linux-backup/"
done
```

This can automate backups to S3.

---

# 47. AWS EC2 Health Check

Suppose:

```text
servers.txt
```

contains private or public IP addresses.

```bash
while IFS= read -r SERVER
do
    if ping -c 1 -W 2 "$SERVER" &>/dev/null; then
        echo "$SERVER: UP"
    else
        echo "$SERVER: DOWN"
    fi
done < servers.txt
```

For AWS environments, remember that ICMP may be blocked by Security Groups or network controls, so failure to ping does not always mean an EC2 instance is down.

---

# 48. Loop Through AWS Regions

Example:

```bash
REGIONS=(
    "ap-south-1"
    "us-east-1"
    "us-west-2"
)

for REGION in "${REGIONS[@]}"
do
    echo "Checking region: $REGION"

    aws ec2 describe-instances \
        --region "$REGION" \
        --query 'Reservations[].Instances[].InstanceId' \
        --output text
done
```

This is a practical Cloud Engineer automation pattern.

---

# 49. Nested AWS Automation

Example:

```bash
REGIONS=(
    "ap-south-1"
    "us-east-1"
)

for REGION in "${REGIONS[@]}"
do
    echo "Region: $REGION"

    for INSTANCE in $(aws ec2 describe-instances \
        --region "$REGION" \
        --query 'Reservations[].Instances[].InstanceId' \
        --output text)
    do
        echo "  Instance: $INSTANCE"
    done
done
```

For production scripts, consider handling empty results and AWS CLI failures explicitly.

---

# 50. Loop Control

You can combine:

```text
for
while
until
if
break
continue
```

Example:

```bash
for SERVER in "${SERVERS[@]}"
do
    if [[ -z "$SERVER" ]]; then
        continue
    fi

    if ! ping -c 1 -W 1 "$SERVER" &>/dev/null; then
        echo "$SERVER is unreachable"
        continue
    fi

    echo "$SERVER is reachable"
done
```

---

# 51. Infinite Loop Protection

Never accidentally create:

```bash
while true
do
    echo "Running"
done
```

without a reason.

This can consume CPU.

Better:

```bash
while true
do
    echo "Running"
    sleep 10
done
```

Or provide an exit condition:

```bash
COUNT=1

while (( COUNT <= 10 ))
do
    echo "Iteration: $COUNT"
    ((COUNT++))
done
```

---

# 52. Signal Handling

Long-running loops may need cleanup when interrupted.

Example:

```bash
cleanup() {
    echo "Cleaning up..."
}

trap cleanup EXIT
```

For Ctrl+C:

```bash
trap 'echo "Interrupted"; exit 130' INT
```

This becomes especially useful for long-running monitoring scripts.

---

# 🧪 Hands-On Lab 1 — Number Loop

Create:

```bash
vim number-loop.sh
```

Add:

```bash
#!/bin/bash

for NUMBER in {1..10}
do
    echo "Number: $NUMBER"
done
```

Run:

```bash
chmod +x number-loop.sh
./number-loop.sh
```

---

# 🧪 Hands-On Lab 2 — Array Loop

```bash
#!/bin/bash

SERVERS=("web01" "web02" "db01")

for SERVER in "${SERVERS[@]}"
do
    echo "Server: $SERVER"
done
```

---

# 🧪 Hands-On Lab 3 — File Loop

Create test files:

```bash
touch file1.txt file2.txt file3.txt
```

Script:

```bash
#!/bin/bash

for FILE in *.txt
do
    [[ -e "$FILE" ]] || continue

    echo "Found: $FILE"
done
```

---

# 🧪 Hands-On Lab 4 — Read File

Create:

```bash
vim servers.txt
```

Add:

```text
server1
server2
server3
server4
```

Script:

```bash
#!/bin/bash

while IFS= read -r SERVER
do
    echo "Server: $SERVER"
done < servers.txt
```

---

# 🧪 Hands-On Lab 5 — Service Monitoring

```bash
#!/bin/bash

SERVICES=("ssh" "nginx")

for SERVICE in "${SERVICES[@]}"
do
    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE: Running"
    else
        echo "$SERVICE: Not running"
    fi
done
```

---

# 🧪 Hands-On Lab 6 — Disk Monitoring

Check several mount points:

```bash
#!/bin/bash

MOUNTS=("/" "/tmp" "/var")

for MOUNT in "${MOUNTS[@]}"
do
    if [[ -d "$MOUNT" ]]; then
        USAGE=$(df "$MOUNT" | awk 'NR==2 {print $5}')

        echo "$MOUNT: $USAGE"
    fi
done
```

---

# 🏗️ Mini Project — Server Availability Checker

Create:

```bash
vim server-check.sh
```

Create:

```text
servers.txt
```

Example:

```text
8.8.8.8
1.1.1.1
```

Script:

```bash
#!/bin/bash

INPUT_FILE="servers.txt"

if [[ ! -f "$INPUT_FILE" ]]; then
    echo "ERROR: $INPUT_FILE not found"
    exit 1
fi

echo "================================"
echo "     Server Availability Check"
echo "================================"

while IFS= read -r SERVER
do
    [[ -z "$SERVER" ]] && continue

    if ping -c 1 -W 2 "$SERVER" &>/dev/null; then
        echo "✅ $SERVER: UP"
    else
        echo "❌ $SERVER: DOWN"
    fi
done < "$INPUT_FILE"

echo "================================"
echo "Check completed"
echo "================================"
```

Run:

```bash
chmod +x server-check.sh
./server-check.sh
```

---

# 🏗️ Mini Project — Automated Backup

Create:

```bash
vim multi-backup.sh
```

Example:

```bash
#!/bin/bash

BACKUP_DIR="/backup"
DATE=$(date +%F-%H%M%S)

DIRECTORIES=(
    "/etc"
    "/var/www/html"
    "/home"
)

mkdir -p "$BACKUP_DIR"

for DIR in "${DIRECTORIES[@]}"
do
    if [[ ! -d "$DIR" ]]; then
        echo "Skipping missing directory: $DIR"
        continue
    fi

    NAME=$(basename "$DIR")
    BACKUP_FILE="$BACKUP_DIR/${NAME}-${DATE}.tar.gz"

    if tar -czf "$BACKUP_FILE" "$DIR"; then
        echo "Backup successful: $DIR"
    else
        echo "Backup failed: $DIR"
    fi
done
```

This project combines:

```text
Variables
Conditions
Arrays
Loops
Command substitution
Backup
Error handling
```

---

# 🏗️ Mini Project — AWS S3 Backup Upload

Create:

```bash
vim upload-backups.sh
```

Example:

```bash
#!/bin/bash

BACKUP_DIR="/backup"
S3_BUCKET="my-linux-backup"

if ! command -v aws &>/dev/null; then
    echo "ERROR: AWS CLI is not installed"
    exit 1
fi

if [[ ! -d "$BACKUP_DIR" ]]; then
    echo "ERROR: Backup directory does not exist"
    exit 1
fi

for FILE in "$BACKUP_DIR"/*.tar.gz
do
    [[ -f "$FILE" ]] || continue

    echo "Uploading: $FILE"

    if aws s3 cp "$FILE" "s3://$S3_BUCKET/"; then
        echo "Upload successful"
    else
        echo "Upload failed"
    fi
done
```

For EC2, use an IAM role with only the required S3 permissions rather than storing AWS access keys inside the script.

---

# 🐞 Common Loop Problems

## Problem 1 — Infinite Loop

Wrong:

```bash
COUNT=1

while [[ "$COUNT" -le 5 ]]
do
    echo "$COUNT"
done
```

`COUNT` never changes.

Correct:

```bash
COUNT=1

while [[ "$COUNT" -le 5 ]]
do
    echo "$COUNT"
    ((COUNT++))
done
```

---

## Problem 2 — Incorrect Array Expansion

Risky:

```bash
for SERVER in ${SERVERS[@]}
```

Prefer:

```bash
for SERVER in "${SERVERS[@]}"
```

---

## Problem 3 — Reading Files With `for`

Avoid:

```bash
for LINE in $(cat servers.txt)
```

for general line-oriented data.

Prefer:

```bash
while IFS= read -r LINE
do
    echo "$LINE"
done < servers.txt
```

---

## Problem 4 — Forgetting `done`

Wrong:

```bash
for FILE in *.txt
do
    echo "$FILE"
```

Correct:

```bash
for FILE in *.txt
do
    echo "$FILE"
done
```

---

## Problem 5 — Command Failure Hidden in a Loop

Always consider whether a command inside the loop can fail.

Example:

```bash
for FILE in *.tar.gz
do
    if ! aws s3 cp "$FILE" "s3://my-bucket/"; then
        echo "Upload failed: $FILE"
    fi
done
```

---

# 🐞 Debugging Loops

Run:

```bash
bash -x script.sh
```

Check syntax:

```bash
bash -n script.sh
```

Use ShellCheck:

```bash
shellcheck script.sh
```

---

# 📊 Loop Cheat Sheet

| Syntax | Purpose |
|---|---|
| `for x in ...` | Loop through values |
| `for ((...))` | C-style loop |
| `while` | Repeat while condition is true |
| `until` | Repeat until condition becomes true |
| `break` | Exit loop |
| `continue` | Skip iteration |
| `"${ARRAY[@]}"` | Iterate array elements |
| `while IFS= read -r` | Read file line by line |
| `sleep` | Pause execution |
| `trap` | Handle signals/cleanup |

---

# 🎤 Interview Questions

## Beginner

1. What is a loop?
2. What types of loops are available in Bash?
3. What is a `for` loop?
4. What is a `while` loop?
5. What is an `until` loop?
6. What does `break` do?
7. What does `continue` do?
8. What is a nested loop?
9. How do you loop through an array?
10. How do you loop through files?

## Intermediate

11. What is the difference between `while` and `until`?
12. How do you create an infinite loop?
13. How do you stop an infinite loop?
14. How do you read a file line by line?
15. Why is `while IFS= read -r` preferred for reading lines?
16. Why should `"${ARRAY[@]}"` be quoted?
17. What is a C-style Bash loop?
18. How do you increment a variable?
19. How do you decrement a variable?
20. What is a nested loop?
21. How do you retry a command using a loop?
22. How do you wait for a service using a loop?

## AWS / Cloud Engineer

23. How would you loop through multiple AWS regions?
24. How would you process multiple EC2 instance IDs?
25. How would you upload multiple backup files to S3?
26. How would you check multiple servers?
27. How would you automate multiple EC2 configurations?
28. How would you implement retry logic in a deployment script?
29. How would you wait for an application to become available?
30. How would you build a server monitoring script using loops?

---

# 🧠 Practice Challenges

### Challenge 1 — Numbers

Print:

```text
1
2
3
...
20
```

using a `for` loop.

---

### Challenge 2 — Even Numbers

Print:

```text
2
4
6
8
10
...
20
```

---

### Challenge 3 — Server List

Create:

```text
servers.txt
```

containing five servers.

Read the file line by line and print:

```text
Checking server: <server>
```

---

### Challenge 4 — Service List

Create an array:

```bash
SERVICES=("ssh" "nginx" "cron")
```

Check every service.

---

### Challenge 5 — Backup

Create an array containing:

```text
/etc
/var/log
/home
```

Create a compressed backup for each directory.

---

### Challenge 6 — Retry

Create a script that attempts an operation up to **5 times**.

If successful:

```text
Operation successful
```

Otherwise:

```text
Operation failed after 5 attempts
```

---

### Challenge 7 — AWS Regions

Create:

```bash
REGIONS=(
    "ap-south-1"
    "us-east-1"
    "us-west-2"
)
```

Loop through the regions and display:

```text
Checking region: ap-south-1
Checking region: us-east-1
Checking region: us-west-2
```

---

# 📋 Final Checklist

Before moving to `Functions.md`, make sure you can:

- [ ] Use `for`
- [ ] Use C-style `for`
- [ ] Use `while`
- [ ] Use `until`
- [ ] Use `break`
- [ ] Use `continue`
- [ ] Create infinite loops safely
- [ ] Use arrays with loops
- [ ] Loop through files
- [ ] Loop through directories
- [ ] Read files line by line
- [ ] Use `IFS= read -r`
- [ ] Use nested loops
- [ ] Loop through users
- [ ] Loop through services
- [ ] Loop through servers
- [ ] Implement retry logic
- [ ] Wait for services
- [ ] Wait for ports
- [ ] Automate backups
- [ ] Upload files to S3
- [ ] Loop through AWS regions
- [ ] Process AWS resources
- [ ] Debug loops
- [ ] Complete the server availability project

---

# 🚀 Next Topic

Continue with:

👉 **[Functions.md](./Functions.md)**

You will learn:

```text
Functions
Function Arguments
Local Variables
Return Values
Exit Status
Reusable Functions
Function Libraries
Error Handling
Logging Functions
AWS Automation Functions
```

---

⭐ **Goal:** Use loops to turn repetitive Linux administration tasks into reliable automation.