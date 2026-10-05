# 🧩 Bash Script Arguments

## 📌 Overview

Command-line arguments allow you to pass information to a Bash script when you execute it.

Instead of hard-coding values inside a script:

```bash
./backup.sh
```

you can pass values:

```bash
./backup.sh /var/www/html /backup
```

The script can then use those values.

Arguments are extremely useful for:

- Linux administration
- Backup automation
- Server monitoring
- Deployment scripts
- AWS automation
- DevOps automation
- CI/CD pipelines
- Troubleshooting scripts

---

# 🎯 Learning Objectives

After completing this topic, you should understand:

- What command-line arguments are
- `$0`
- `$1`, `$2`, `$3`
- `$#`
- `$@`
- `$*`
- `$?`
- `$$`
- `$!`
- `shift`
- Default arguments
- Argument validation
- `getopts`
- Command-line options
- Flags
- Required arguments
- Optional arguments
- Practical Linux scripts
- AWS automation scripts

---

# 1. What Are Script Arguments?

Consider:

```bash
./backup.sh /var/www/html /backup
```

Here:

```text
./backup.sh     → Script
/var/www/html   → Argument 1
/backup         → Argument 2
```

Bash makes these values available through positional parameters.

```text
$0 → Script name
$1 → First argument
$2 → Second argument
$3 → Third argument
...
```

---

# 2. Basic Example

Create:

```bash
vim arguments.sh
```

Add:

```bash
#!/bin/bash

echo "Script: $0"
echo "First argument: $1"
echo "Second argument: $2"
```

Run:

```bash
chmod +x arguments.sh
./arguments.sh hello linux
```

Output:

```text
Script: ./arguments.sh
First argument: hello
Second argument: linux
```

---

# 3. `$0`

`$0` normally contains the name or path used to invoke the script.

Example:

```bash
#!/bin/bash

echo "Script name: $0"
```

Run:

```bash
./script.sh
```

Output:

```text
Script name: ./script.sh
```

---

# 4. `$1`

`$1` represents the first argument.

```bash
#!/bin/bash

echo "First argument: $1"
```

Run:

```bash
./script.sh Linux
```

Output:

```text
First argument: Linux
```

---

# 5. `$2`

`$2` represents the second argument.

```bash
#!/bin/bash

echo "Name: $1"
echo "Role: $2"
```

Run:

```bash
./script.sh Rohit "Cloud Engineer"
```

Output:

```text
Name: Rohit
Role: Cloud Engineer
```

Always quote arguments that may contain spaces.

---

# 6. More Positional Arguments

Bash supports:

```text
$1
$2
$3
$4
$5
...
```

Example:

```bash
#!/bin/bash

echo "1: $1"
echo "2: $2"
echo "3: $3"
echo "4: $4"
```

Run:

```bash
./script.sh Linux AWS Azure Docker
```

---

# 7. `$#` — Number of Arguments

Use:

```bash
$#
```

to find the number of positional arguments.

Example:

```bash
#!/bin/bash

echo "Number of arguments: $#"
```

Run:

```bash
./script.sh Linux AWS Docker
```

Output:

```text
Number of arguments: 3
```

---

# 8. Validate the Number of Arguments

Suppose your script requires exactly two arguments.

```bash
#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <source> <destination>" >&2
    exit 1
fi

echo "Source: $1"
echo "Destination: $2"
```

Run:

```bash
./backup.sh /var/www/html /backup
```

Correct.

If you run:

```bash
./backup.sh /var/www/html
```

Output:

```text
Usage: ./backup.sh <source> <destination>
```

---

# 9. `$@` — All Arguments

`"$@"` expands to all positional arguments while preserving each argument as a separate word.

Example:

```bash
#!/bin/bash

for ARG in "$@"
do
    echo "Argument: $ARG"
done
```

Run:

```bash
./script.sh Linux AWS Azure
```

Output:

```text
Argument: Linux
Argument: AWS
Argument: Azure
```

---

# 10. Why Quote `"$@"`?

Prefer:

```bash
"$@"
```

instead of:

```bash
$@
```

For example:

```bash
./script.sh "Linux Administration" "AWS Cloud"
```

With:

```bash
for ARG in "$@"
```

you get:

```text
Linux Administration
AWS Cloud
```

as two separate arguments.

This is the safe and common pattern.

---

# 11. `$*` — All Arguments

`$*` also represents positional arguments, but its behavior differs from `"$@"`.

Example:

```bash
for ARG in "$*"
do
    echo "$ARG"
done
```

If called with:

```bash
./script.sh Linux AWS Azure
```

`"$*"` behaves as one combined string.

Conceptually:

```text
Linux AWS Azure
```

---

# 12. `"$@"` vs `"$*"`

This is a common interview question.

| Syntax | Behavior |
|---|---|
| `"$@"` | Preserves arguments separately |
| `"$*"` | Combines arguments into one string |
| `$@` | Unquoted expansion can cause word splitting |
| `$*` | Unquoted expansion can cause word splitting |

For most scripts where you need to process each argument separately:

```bash
"$@"
```

is the preferred choice.

---

# 13. `$?` — Previous Command Status

`$?` contains the exit status of the previous command.

Example:

```bash
ls /etc
echo "$?"
```

If `ls` succeeds:

```text
0
```

If a command fails:

```text
non-zero
```

Example:

```bash
ls /does-not-exist
echo "$?"
```

---

# 14. Checking Command Success

Instead of:

```bash
command
STATUS=$?

if [[ "$STATUS" -eq 0 ]]; then
    echo "Success"
fi
```

you can often write:

```bash
if command; then
    echo "Success"
else
    echo "Failed"
fi
```

Example:

```bash
if systemctl is-active --quiet nginx; then
    echo "Nginx is running"
else
    echo "Nginx is not running"
fi
```

---

# 15. `$$` — Current Shell PID

`$$` contains the process ID of the current shell.

Example:

```bash
#!/bin/bash

echo "Current shell PID: $$"
```

This can be useful for temporary files or identifying a running script.

For temporary files, however, prefer tools such as `mktemp` rather than constructing predictable filenames manually.

---

# 16. `$!` — Last Background Process PID

When a command runs in the background:

```bash
command &
```

`$!` contains the PID of the most recently started background process.

Example:

```bash
sleep 30 &
PID=$!

echo "Background process PID: $PID"
```

Wait for it:

```bash
wait "$PID"
```

---

# 17. `shift`

`shift` moves positional parameters.

Suppose:

```bash
./script.sh one two three
```

Initially:

```text
$1 = one
$2 = two
$3 = three
```

After:

```bash
shift
```

they become:

```text
$1 = two
$2 = three
```

---

# 18. `shift` Example

```bash
#!/bin/bash

echo "First: $1"

shift

echo "New first: $1"
```

Run:

```bash
./script.sh one two three
```

Output:

```text
First: one
New first: two
```

---

# 19. Processing Arguments With `shift`

A simple example:

```bash
#!/bin/bash

while [[ $# -gt 0 ]]
do
    echo "Processing: $1"
    shift
done
```

Run:

```bash
./script.sh Linux AWS Azure Docker
```

Output:

```text
Processing: Linux
Processing: AWS
Processing: Azure
Processing: Docker
```

This is useful for custom argument parsers.

---

# 20. Required Argument

Example:

```bash
#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <filename>" >&2
    exit 1
fi

FILE="$1"

echo "File: $FILE"
```

Run:

```bash
./script.sh /etc/passwd
```

---

# 21. Multiple Required Arguments

```bash
#!/bin/bash

if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <source> <destination>" >&2
    exit 1
fi

SOURCE="$1"
DESTINATION="$2"

echo "Source: $SOURCE"
echo "Destination: $DESTINATION"
```

---

# 22. Optional Arguments

You can provide a default value.

```bash
#!/bin/bash

NAME="${1:-Linux}"

echo "Hello $NAME"
```

Run:

```bash
./script.sh
```

Output:

```text
Hello Linux
```

Run:

```bash
./script.sh Rohit
```

Output:

```text
Hello Rohit
```

---

# 23. Important Default-Value Syntax

```bash
${VAR:-default}
```

means:

> Use `default` if `VAR` is unset or empty.

Example:

```bash
BACKUP_DIR="${1:-/backup}"
```

---

# 24. Required Value With `${VAR:?}`

You can require a value:

```bash
SOURCE="${1:?Source directory is required}"
```

If no argument is supplied, Bash prints an error and exits from the current shell context.

For reusable scripts, an explicit validation block can sometimes provide a clearer usage message:

```bash
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <source>" >&2
    exit 1
fi
```

---

# 25. Validate a File Argument

```bash
#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <file>" >&2
    exit 1
fi

FILE="$1"

if [[ ! -f "$FILE" ]]; then
    echo "ERROR: File does not exist: $FILE" >&2
    exit 1
fi

echo "Processing: $FILE"
```

---

# 26. Validate a Directory Argument

```bash
#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <directory>" >&2
    exit 1
fi

DIRECTORY="$1"

if [[ ! -d "$DIRECTORY" ]]; then
    echo "ERROR: Directory does not exist: $DIRECTORY" >&2
    exit 1
fi

echo "Directory: $DIRECTORY"
```

---

# 27. Safe Argument Quoting

Always quote variables when they represent paths or user input:

```bash
"$FILE"
```

instead of:

```bash
$FILE
```

Example:

```bash
rm -- "$FILE"
```

The `--` tells many commands that following arguments should not be interpreted as options.

Be especially careful with commands that delete or modify files.

---

# 28. `getopts`

For professional scripts, you will often want options such as:

```bash
./backup.sh -s /var/www/html -d /backup
```

Bash provides the built-in:

```bash
getopts
```

for parsing short command-line options.

---

# 29. Basic `getopts` Example

```bash
#!/bin/bash

while getopts "n:r:" OPTION
do
    case "$OPTION" in
        n)
            NAME="$OPTARG"
            ;;
        r)
            ROLE="$OPTARG"
            ;;
        *)
            echo "Usage: $0 -n <name> -r <role>" >&2
            exit 1
            ;;
    esac
done

echo "Name: $NAME"
echo "Role: $ROLE"
```

Run:

```bash
./script.sh -n Rohit -r "Cloud Engineer"
```

---

# 30. Understanding `getopts`

In:

```bash
getopts "n:r:" OPTION
```

the option string:

```text
n:
r:
```

means:

```text
-n requires a value
-r requires a value
```

For example:

```bash
-n Rohit
-r "Cloud Engineer"
```

---

# 31. Option Without Value

A letter without `:` does not require an argument.

Example:

```bash
getopts "v:f:" OPTION
```

means:

```text
-v → flag
-f → requires a value
```

Usage:

```bash
./script.sh -v -f file.txt
```

---

# 32. Example — Backup Script With Options

```bash
#!/bin/bash

SOURCE=""
DESTINATION=""
VERBOSE=false

usage() {
    echo "Usage: $0 -s <source> -d <destination> [-v]"
}

while getopts "s:d:v" OPTION
do
    case "$OPTION" in
        s)
            SOURCE="$OPTARG"
            ;;
        d)
            DESTINATION="$OPTARG"
            ;;
        v)
            VERBOSE=true
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done

if [[ -z "$SOURCE" || -z "$DESTINATION" ]]; then
    usage
    exit 1
fi

echo "Source: $SOURCE"
echo "Destination: $DESTINATION"
echo "Verbose: $VERBOSE"
```

Run:

```bash
./backup.sh -s /var/www/html -d /backup -v
```

---

# 33. `OPTARG`

When an option requires a value:

```bash
-n Rohit
```

the value:

```text
Rohit
```

is stored in:

```bash
$OPTARG
```

Example:

```bash
while getopts "n:" OPTION
do
    case "$OPTION" in
        n)
            echo "Name: $OPTARG"
            ;;
    esac
done
```

---

# 34. `OPTIND`

`OPTIND` keeps track of the next argument to be processed by `getopts`.

A common pattern is:

```bash
while getopts "s:d:v" OPTION
do
    ...
done

shift $((OPTIND - 1))
```

This removes the parsed options from the positional-argument list.

---

# 35. `getopts` + Positional Arguments

Example:

```bash
#!/bin/bash

VERBOSE=false

while getopts "v" OPTION
do
    case "$OPTION" in
        v)
            VERBOSE=true
            ;;
        *)
            exit 1
            ;;
    esac
done

shift $((OPTIND - 1))

FILE="$1"

echo "Verbose: $VERBOSE"
echo "File: $FILE"
```

Run:

```bash
./script.sh -v /etc/passwd
```

---

# 36. Usage Function

Professional scripts should provide a help/usage message.

```bash
usage() {
    cat <<EOF
Usage: $0 [OPTIONS]

Options:
  -s SOURCE       Source directory
  -d DESTINATION  Destination directory
  -v              Verbose mode
  -h              Show help
EOF
}
```

---

# 37. `-h` Help Option

Example:

```bash
while getopts "s:d:vh" OPTION
do
    case "$OPTION" in
        s)
            SOURCE="$OPTARG"
            ;;
        d)
            DESTINATION="$OPTARG"
            ;;
        v)
            VERBOSE=true
            ;;
        h)
            usage
            exit 0
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done
```

Run:

```bash
./backup.sh -h
```

---

# 38. Professional Argument Structure

A reusable script can follow this structure:

```text
1. Variables
2. Functions
3. Usage function
4. Argument parsing
5. Input validation
6. Main logic
7. Exit status
```

Example:

```bash
#!/bin/bash

set -euo pipefail

SOURCE=""
DESTINATION=""
VERBOSE=false

usage() {
    echo "Usage: $0 -s <source> -d <destination> [-v]"
}

log_info() {
    if [[ "$VERBOSE" == true ]]; then
        echo "[INFO] $*"
    fi
}

main() {
    log_info "Source: $SOURCE"
    log_info "Destination: $DESTINATION"
}

while getopts "s:d:vh" OPTION
do
    case "$OPTION" in
        s) SOURCE="$OPTARG" ;;
        d) DESTINATION="$OPTARG" ;;
        v) VERBOSE=true ;;
        h)
            usage
            exit 0
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done

if [[ -z "$SOURCE" || -z "$DESTINATION" ]]; then
    usage
    exit 1
fi

main "$@"
```

---

# 39. Practical Project — Backup Script

Create:

```text
Scripts/
└── backup.sh
```

Example:

```bash
#!/bin/bash

set -euo pipefail

SOURCE=""
DESTINATION=""
VERBOSE=false

usage() {
    cat <<EOF
Usage: $0 -s <source> -d <destination> [-v]

Options:
  -s SOURCE       Source directory
  -d DESTINATION  Backup destination
  -v              Verbose output
  -h              Show help
EOF
}

log_info() {
    if [[ "$VERBOSE" == true ]]; then
        echo "$(date '+%F %T') [INFO] $*"
    fi
}

create_backup() {
    local SOURCE_DIR="$1"
    local DEST_DIR="$2"
    local NAME
    local TIMESTAMP
    local ARCHIVE

    [[ -d "$SOURCE_DIR" ]] || {
        echo "ERROR: Source directory does not exist: $SOURCE_DIR" >&2
        return 1
    }

    mkdir -p "$DEST_DIR"

    NAME=$(basename "$SOURCE_DIR")
    TIMESTAMP=$(date '+%Y%m%d-%H%M%S')
    ARCHIVE="$DEST_DIR/${NAME}-${TIMESTAMP}.tar.gz"

    log_info "Creating backup..."
    tar -czf "$ARCHIVE" "$SOURCE_DIR"

    echo "Backup created: $ARCHIVE"
}

while getopts "s:d:vh" OPTION
do
    case "$OPTION" in
        s)
            SOURCE="$OPTARG"
            ;;
        d)
            DESTINATION="$OPTARG"
            ;;
        v)
            VERBOSE=true
            ;;
        h)
            usage
            exit 0
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done

if [[ -z "$SOURCE" || -z "$DESTINATION" ]]; then
    usage
    exit 1
fi

create_backup "$SOURCE" "$DESTINATION"
```

Run:

```bash
chmod +x backup.sh
```

Then:

```bash
./backup.sh -s /var/www/html -d /backup -v
```

---

# 40. Practical Project — Disk Usage Script

Create:

```text
Scripts/
└── disk-usage.sh
```

Example:

```bash
#!/bin/bash

set -u

THRESHOLD="${1:-80}"

if ! [[ "$THRESHOLD" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Threshold must be a number" >&2
    exit 1
fi

USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Root filesystem usage: ${USAGE}%"
echo "Threshold: ${THRESHOLD}%"

if (( USAGE >= THRESHOLD )); then
    echo "WARNING: Disk usage is above threshold"
    exit 1
fi

echo "Disk usage is within limits"
```

Run:

```bash
./disk-usage.sh
```

Or:

```bash
./disk-usage.sh 90
```

---

# 41. AWS Example — EC2 Instance IDs

Suppose you want to process multiple EC2 instances:

```bash
#!/bin/bash

for INSTANCE_ID in "$@"
do
    echo "Checking instance: $INSTANCE_ID"

    aws ec2 describe-instances \
        --instance-ids "$INSTANCE_ID" \
        --query 'Reservations[].Instances[].State.Name' \
        --output text
done
```

Run:

```bash
./ec2-check.sh i-1234567890abcdef0 i-abcdef1234567890
```

---

# 42. AWS Example — Region Argument

```bash
#!/bin/bash

REGION="${1:-ap-south-1}"

echo "Using AWS region: $REGION"

aws ec2 describe-instances \
    --region "$REGION" \
    --query 'Reservations[].Instances[].InstanceId' \
    --output table
```

Run:

```bash
./ec2-list.sh
```

or:

```bash
./ec2-list.sh us-east-1
```

---

# 43. AWS Example — S3 Bucket Argument

```bash
#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <bucket-name>" >&2
    exit 1
fi

BUCKET="$1"

aws s3 ls "s3://$BUCKET"
```

Run:

```bash
./s3-check.sh my-backup-bucket
```

---

# 44. AWS Security Best Practice

Do **not** do this:

```bash
AWS_ACCESS_KEY_ID="..."
AWS_SECRET_ACCESS_KEY="..."
```

inside a GitHub script.

Never commit AWS credentials to GitHub.

For EC2 automation, prefer:

```text
EC2
 ↓
IAM Role
 ↓
AWS CLI
 ↓
AWS Service
```

For local development, use an appropriate AWS credential mechanism such as AWS CLI profiles rather than hard-coding secrets.

---

# 45. Argument Parsing Flow

A professional script often follows:

```text
             Start
               │
               ▼
       Parse arguments
               │
               ▼
       Validate arguments
               │
               ▼
      Validate dependencies
               │
               ▼
          Run logic
               │
               ▼
        Return status
               │
               ▼
             Exit
```

---

# 🧪 Hands-On Lab 1 — Basic Arguments

Create:

```bash
arguments-lab.sh
```

Print:

```text
Script name
First argument
Second argument
Number of arguments
```

Run:

```bash
./arguments-lab.sh Linux AWS
```

---

# 🧪 Hands-On Lab 2 — File Checker

Create:

```bash
file-check.sh /etc/passwd
```

The script should:

1. Check the number of arguments
2. Check whether the file exists
3. Print its size
4. Return `0` for success
5. Return non-zero for failure

Useful commands:

```bash
stat
du
wc
```

---

# 🧪 Hands-On Lab 3 — Directory Backup

Create:

```bash
backup.sh /var/www/html /backup
```

The script should:

1. Validate two arguments
2. Check the source directory
3. Create the destination directory
4. Create a `.tar.gz` archive
5. Print the backup path
6. Return an appropriate exit status

---

# 🧪 Hands-On Lab 4 — `getopts`

Build:

```bash
server-check.sh -h
```

Support:

```text
-h → Help
-v → Verbose
-s → Service name
```

Example:

```bash
./server-check.sh -v -s nginx
```

---

# 🧪 Hands-On Lab 5 — AWS Region

Create:

```bash
aws-instances.sh
```

Usage:

```bash
./aws-instances.sh ap-south-1
```

The script should:

1. Accept the region
2. Validate AWS CLI
3. Query EC2
4. Display instance IDs
5. Handle errors

---

# 🧪 Hands-On Lab 6 — AWS S3 Upload

Create:

```bash
s3-upload.sh
```

Usage:

```bash
./s3-upload.sh backup.tar.gz my-bucket
```

The script should:

1. Validate two arguments
2. Check the file
3. Check AWS CLI
4. Upload to S3
5. Return success/failure

---

# 🏗️ Mini Project — Linux Backup CLI Tool

Build:

```text
linux-backup-tool/
│
├── backup.sh
├── functions.sh
├── README.md
└── backups/
```

The script should support:

```bash
./backup.sh -s /var/www/html -d ./backups
```

Options:

```text
-s → Source
-d → Destination
-v → Verbose
-h → Help
```

Requirements:

- Argument validation
- Directory validation
- Logging
- Functions
- `getopts`
- Timestamped backup
- Exit codes
- Error handling
- Cleanup
- GitHub documentation

---

# 🏗️ Mini Project — AWS EC2 Health Tool

Build:

```text
aws-ec2-health/
│
├── ec2-health.sh
├── README.md
└── screenshots/
```

Usage:

```bash
./ec2-health.sh -r ap-south-1
```

The script should:

1. Accept AWS region
2. Check AWS CLI
3. List EC2 instances
4. Display instance ID
5. Display instance state
6. Display private IP
7. Handle AWS errors
8. Use IAM-based authentication
9. Never contain AWS credentials

---

# 🐞 Common Problems

## Problem 1 — Argument Missing

You run:

```bash
./script.sh
```

but the script expects:

```bash
$1
```

Solution:

```bash
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <argument>" >&2
    exit 1
fi
```

---

## Problem 2 — Spaces in Arguments

Incorrect:

```bash
./script.sh Linux Administration
```

This passes two arguments.

Correct:

```bash
./script.sh "Linux Administration"
```

---

## Problem 3 — Unquoted Variables

Avoid:

```bash
rm $FILE
```

Prefer:

```bash
rm -- "$FILE"
```

---

## Problem 4 — Confusing `$@` and `$*`

For processing individual arguments, normally use:

```bash
"$@"
```

---

## Problem 5 — Forgetting `shift`

When manually processing arguments in a loop, remember:

```bash
shift
```

otherwise `$1` never changes.

---

## Problem 6 — Invalid Option

Always provide a usage message:

```bash
usage() {
    echo "Usage: $0 -s <source> -d <destination>"
}
```

---

# 🔐 Security Best Practices

When accepting command-line arguments:

- [ ] Quote variables
- [ ] Validate paths
- [ ] Validate numeric input
- [ ] Avoid `eval`
- [ ] Avoid executing untrusted input
- [ ] Use `--` where supported
- [ ] Never store passwords in arguments
- [ ] Never store AWS access keys in scripts
- [ ] Never commit secrets to GitHub
- [ ] Use IAM roles for EC2
- [ ] Use least-privilege IAM permissions

Remember that command-line arguments can sometimes be visible through process inspection, so don't pass sensitive secrets as arguments.

---

# 📊 Argument Cheat Sheet

| Variable | Meaning |
|---|---|
| `$0` | Script name/path |
| `$1` | First argument |
| `$2` | Second argument |
| `$3` | Third argument |
| `$#` | Number of arguments |
| `"$@"` | All arguments separately |
| `"$*"` | All arguments as one string |
| `$?` | Previous command status |
| `$$` | Current shell PID |
| `$!` | Last background process PID |
| `$OPTARG` | `getopts` option value |
| `$OPTIND` | `getopts` argument index |

---

# 🎤 Interview Questions

## Beginner

1. What are command-line arguments?
2. What is `$0`?
3. What is `$1`?
4. What is `$#`?
5. What is `$@`?
6. What is `$*`?
7. What is `$?`?
8. What is `$$`?
9. What is `$!`?
10. What does `shift` do?

## Intermediate

11. What is the difference between `"$@"` and `"$*"`?
12. How do you validate the number of arguments?
13. How do you provide default argument values?
14. How do you validate a file argument?
15. How do you validate a directory argument?
16. What is `getopts`?
17. What is `$OPTARG`?
18. What is `$OPTIND`?
19. How do you implement a `-h` option?
20. How do you implement a verbose `-v` flag?
21. Why should arguments be quoted?
22. Why should you avoid `eval` with user input?

## AWS / DevOps

23. How would you pass an AWS region to a Bash script?
24. How would you pass an EC2 instance ID?
25. How would you build an S3 upload script?
26. How would you build an EC2 health-check script?
27. How would you securely authenticate AWS CLI from EC2?
28. Why should AWS credentials never be hard-coded?
29. How would you build a Bash script suitable for a CI/CD pipeline?
30. How would you make a Bash script reusable across multiple environments?

---

# 🧠 Practice Challenges

### Challenge 1

Create:

```bash
./greet.sh Rohit
```

Output:

```text
Hello Rohit
```

---

### Challenge 2

Create:

```bash
./calculator.sh 10 20
```

Output:

```text
Addition: 30
Subtraction: -10
Multiplication: 200
```

---

### Challenge 3

Create:

```bash
./file-info.sh /etc/passwd
```

Display:

```text
File
Owner
Permissions
Size
```

---

### Challenge 4

Create:

```bash
./service-check.sh nginx
```

Output:

```text
Service: nginx
Status: Running
```

---

### Challenge 5

Create:

```bash
./disk-check.sh 80
```

The script should use `80` as the disk usage threshold.

---

### Challenge 6

Create:

```bash
./backup.sh -s /var/www/html -d /backup -v
```

Implement:

```text
-s source
-d destination
-v verbose
-h help
```

---

### Challenge 7

Create:

```bash
./ec2-check.sh -r ap-south-1
```

Display EC2:

```text
Instance ID
State
Private IP
Instance Type
```

---

# 📋 Final Checklist

Before moving forward, make sure you can:

- [ ] Understand command-line arguments
- [ ] Use `$0`
- [ ] Use `$1`
- [ ] Use `$2`
- [ ] Use `$#`
- [ ] Use `"$@"`
- [ ] Understand `"$*"`
- [ ] Use `$?`
- [ ] Understand `$$`
- [ ] Understand `$!`
- [ ] Use `shift`
- [ ] Validate required arguments
- [ ] Set default arguments
- [ ] Validate files
- [ ] Validate directories
- [ ] Quote user input
- [ ] Use `getopts`
- [ ] Use `$OPTARG`
- [ ] Use `$OPTIND`
- [ ] Create `-
