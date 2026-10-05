# 📦 Bash Variables

## 📌 Overview

Variables are one of the most important concepts in Bash scripting.

A variable allows a script to **store and reuse information** such as:

```text
Names
Numbers
File paths
Directory paths
User input
Command output
Environment settings
Configuration values
```

Example:

```bash
NAME="Rohit"

echo "$NAME"
```

Output:

```text
Rohit
```

Variables make shell scripts flexible and reusable.

---

# 🎯 Learning Objectives

After completing this topic, you should understand:

- What a Bash variable is
- How to create variables
- How to access variables
- Variable naming rules
- Strings and numbers
- Command substitution
- Environment variables
- Exporting variables
- Read-only variables
- User input
- Quoting
- Arrays
- Special variables
- Default values
- Variable expansion
- Practical AWS examples

---

# 1. What Is a Variable?

A variable is a name that stores a value.

Example:

```bash
NAME="Rohit"
```

Here:

```text
NAME  → Variable name
Rohit → Variable value
```

Use the variable:

```bash
echo "$NAME"
```

Output:

```text
Rohit
```

---

# 2. Creating Variables

Basic syntax:

```bash
VARIABLE="value"
```

Example:

```bash
NAME="Rohit"
CITY="Maharashtra"
ROLE="Cloud Engineer"
```

Print them:

```bash
echo "$NAME"
echo "$CITY"
echo "$ROLE"
```

---

# ⚠️ Important: No Spaces Around `=`

Correct:

```bash
NAME="Rohit"
```

Incorrect:

```bash
NAME = "Rohit"
```

Bash interprets the second form as a command rather than a variable assignment.

---

# 3. Variable Naming Rules

Variable names can contain:

```text
Letters
Numbers
Underscores
```

Examples:

```bash
NAME="Rohit"
USER_NAME="admin"
SERVER1="web-server"
BACKUP_DIR="/backup"
```

Do not start a variable name with a number:

```bash
1SERVER="web"
```

This is invalid.

Prefer meaningful names:

```bash
BACKUP_DIR="/backup"
LOG_FILE="/var/log/app.log"
SERVER_NAME="web01"
```

---

# 4. Accessing Variables

Use `$` before the variable name:

```bash
NAME="Rohit"

echo "$NAME"
```

You can also use braces:

```bash
echo "${NAME}"
```

Both work.

---

# 5. Why Use `${VARIABLE}`?

Braces are especially useful when text immediately follows a variable.

Example:

```bash
NAME="Rohit"

echo "${NAME}Cloud"
```

Output:

```text
RohitCloud
```

Without braces:

```bash
echo "$NAMECloud"
```

Bash may interpret `NAMECloud` as the variable name.

---

# 6. Strings

Bash variables can store strings.

Example:

```bash
NAME="Rohit"
CITY="Mumbai"
ROLE="AWS Cloud Engineer"
```

Print:

```bash
echo "$NAME"
echo "$CITY"
echo "$ROLE"
```

Strings can contain spaces when quoted:

```bash
MESSAGE="Welcome to Linux Shell Scripting"
```

---

# 7. Numbers

Variables can also contain numbers.

```bash
AGE=25
COUNT=10
PORT=8080
```

Print:

```bash
echo "$AGE"
echo "$PORT"
```

Bash treats these as shell values; arithmetic operations use arithmetic syntax.

Example:

```bash
A=10
B=20

SUM=$((A + B))

echo "$SUM"
```

Output:

```text
30
```

---

# 8. Arithmetic Operations

Bash provides arithmetic expansion:

```bash
$(( ))
```

Example:

```bash
A=10
B=5

echo $((A + B))
echo $((A - B))
echo $((A * B))
echo $((A / B))
echo $((A % B))
```

Output:

```text
15
5
50
2
0
```

---

# 9. Arithmetic Assignment

You can calculate and store the result:

```bash
A=10
B=20

SUM=$((A + B))

echo "Sum = $SUM"
```

Another example:

```bash
COUNT=10

COUNT=$((COUNT + 1))

echo "$COUNT"
```

Output:

```text
11
```

---

# 10. Command Substitution

Command substitution allows you to store command output inside a variable.

Syntax:

```bash
VARIABLE=$(command)
```

Example:

```bash
HOSTNAME=$(hostname)

echo "$HOSTNAME"
```

Another example:

```bash
CURRENT_USER=$(whoami)

echo "$CURRENT_USER"
```

---

# 11. Practical Command Substitution

```bash
KERNEL=$(uname -r)
IP_ADDRESS=$(hostname -I)

echo "Kernel: $KERNEL"
echo "IP Address: $IP_ADDRESS"
```

Another example:

```bash
DATE=$(date)

echo "Current date: $DATE"
```

This is extremely useful in automation scripts.

---

# 12. Old Command Substitution Syntax

Older shell scripts may use backticks:

```bash
DATE=`date`
```

Modern Bash scripts should generally prefer:

```bash
DATE=$(date)
```

The `$(...)` syntax is easier to read and nest.

---

# 13. Environment Variables

Linux provides many environment variables.

Check:

```bash
env
```

or:

```bash
printenv
```

Examples:

```bash
echo "$HOME"
echo "$USER"
echo "$PATH"
echo "$SHELL"
echo "$PWD"
```

Common environment variables:

| Variable | Meaning |
|---|---|
| `$HOME` | User's home directory |
| `$USER` | Current username |
| `$SHELL` | Current/default shell |
| `$PATH` | Command search path |
| `$PWD` | Current working directory |
| `$OLDPWD` | Previous working directory |
| `$HOSTNAME` | System hostname |

---

# 14. `$HOME`

Check:

```bash
echo "$HOME"
```

Example:

```text
/home/rohit
```

Go to home directory:

```bash
cd "$HOME"
```

---

# 15. `$USER`

Check current user:

```bash
echo "$USER"
```

Example:

```text
rohit
```

You can use it in scripts:

```bash
echo "Welcome $USER"
```

---

# 16. `$PATH`

Check:

```bash
echo "$PATH"
```

Example:

```text
/usr/local/bin:/usr/bin:/bin
```

Linux searches these directories when you run a command.

For example:

```bash
ls
```

Bash searches directories in `$PATH` until it finds the executable.

Check a command:

```bash
command -v ls
```

---

# 17. Exporting Variables

A normal shell variable belongs to the current shell.

Example:

```bash
NAME="Rohit"
```

A child process does not automatically receive every shell variable.

To export it:

```bash
export NAME
```

Or create and export it in one command:

```bash
export NAME="Rohit"
```

Check:

```bash
echo "$NAME"
```

---

# 18. Parent and Child Shell

Consider:

```text
Current Shell
     │
     └── Child Process
```

Normal variable:

```bash
NAME="Rohit"
```

Exported variable:

```bash
export NAME="Rohit"
```

Exported variables are inherited by child processes.

---

# 🧪 Lab — Environment Variable

Create:

```bash
export PROJECT="Linux-Learning"
```

Check:

```bash
echo "$PROJECT"
```

Then:

```bash
bash
```

Inside the new shell:

```bash
echo "$PROJECT"
```

You should still see:

```text
Linux-Learning
```

Exit:

```bash
exit
```

---

# 19. Temporary Environment Variables

You can provide an environment variable for one command:

```bash
NAME="Rohit" bash -c 'echo "$NAME"'
```

Output:

```text
Rohit
```

This is useful when running commands or applications with temporary configuration.

---

# 20. Read-Only Variables

Use:

```bash
readonly
```

Example:

```bash
readonly APP_NAME="MyApplication"
```

Trying to change it:

```bash
APP_NAME="NewApplication"
```

will fail.

Check read-only variables:

```bash
readonly -p
```

---

# 21. Unset Variables

Remove a variable:

```bash
unset NAME
```

Example:

```bash
NAME="Rohit"

echo "$NAME"

unset NAME

echo "$NAME"
```

After `unset`, the variable no longer has its previous value.

---

# ⚠️ Important With `set -u`

If your script uses:

```bash
set -u
```

referencing an unset variable can cause an error.

Example:

```bash
#!/bin/bash

set -u

echo "$NAME"
```

If `NAME` is not defined, the script can fail.

This is one reason to use default values where appropriate.

---

# 22. Default Variable Values

Bash provides parameter expansion for defaults.

Example:

```bash
NAME="${NAME:-Guest}"

echo "$NAME"
```

If `NAME` is empty or unset:

```text
Guest
```

is used.

---

# 23. Default Value Example

```bash
#!/bin/bash

NAME="${1:-Guest}"

echo "Hello $NAME"
```

Run:

```bash
./hello.sh
```

Output:

```text
Hello Guest
```

Run:

```bash
./hello.sh Rohit
```

Output:

```text
Hello Rohit
```

This is very useful when building reusable scripts.

---

# 24. User Input with `read`

The `read` command accepts input from the user.

Example:

```bash
#!/bin/bash

echo "Enter your name:"
read NAME

echo "Hello $NAME"
```

Run:

```bash
./hello.sh
```

Example:

```text
Enter your name:
Rohit
Hello Rohit
```

---

# 25. `read -p`

Instead of using separate `echo` and `read`:

```bash
read -p "Enter your name: " NAME

echo "Hello $NAME"
```

This is cleaner.

---

# 26. Silent Input

For passwords or sensitive input:

```bash
read -s -p "Enter password: " PASSWORD
echo
```

The `-s` option prevents the input from being displayed.

> Avoid storing or printing passwords unnecessarily.

---

# 27. Read Multiple Values

```bash
read -p "Enter first name and city: " NAME CITY

echo "Name: $NAME"
echo "City: $CITY"
```

Bash splits input according to shell word splitting rules.

For more controlled input, quote and validate values carefully.

---

# 28. Quoting Variables

Quoting is extremely important in Bash.

Prefer:

```bash
echo "$NAME"
```

instead of:

```bash
echo $NAME
```

Consider:

```bash
NAME="Rohit Tambadkar"
```

Then:

```bash
echo "$NAME"
```

preserves it as one word.

Unquoted variables can be subject to:

```text
Word splitting
Filename expansion
```

---

# 29. Double Quotes

Double quotes allow variable expansion.

Example:

```bash
NAME="Rohit"

echo "Hello $NAME"
```

Output:

```text
Hello Rohit
```

---

# 30. Single Quotes

Single quotes prevent variable expansion.

Example:

```bash
NAME="Rohit"

echo 'Hello $NAME'
```

Output:

```text
Hello $NAME
```

---

# 🆚 Single vs Double Quotes

| Quotes | Variable Expansion |
|---|---|
| `"..."` | Yes |
| `'...'` | No |

Example:

```bash
NAME="Rohit"

echo "Hello $NAME"
echo 'Hello $NAME'
```

Output:

```text
Hello Rohit
Hello $NAME
```

---

# 31. Escaping Variables

Use a backslash when you want to prevent special interpretation.

Example:

```bash
echo "\$HOME"
```

Output:

```text
$HOME
```

Without escaping:

```bash
echo "$HOME"
```

Bash prints the actual home directory.

---

# 32. Arrays

Bash supports indexed arrays.

Create:

```bash
SERVERS=("web01" "web02" "db01")
```

Access the first item:

```bash
echo "${SERVERS[0]}"
```

Output:

```text
web01
```

Second item:

```bash
echo "${SERVERS[1]}"
```

---

# 33. Print All Array Elements

```bash
echo "${SERVERS[@]}"
```

Output:

```text
web01 web02 db01
```

Number of elements:

```bash
echo "${#SERVERS[@]}"
```

Output:

```text
3
```

---

# 34. Add an Array Element

```bash
SERVERS=("web01" "web02")

SERVERS+=("db01")

echo "${SERVERS[@]}"
```

Output:

```text
web01 web02 db01
```

---

# 35. Loop Through an Array

```bash
SERVERS=("web01" "web02" "db01")

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

You will learn loops in detail in:

👉 [Loops.md](./Loops.md)

---

# 36. Special Bash Variables

Bash provides special variables.

| Variable | Meaning |
|---|---|
| `$0` | Script name |
| `$1` | First argument |
| `$2` | Second argument |
| `$#` | Number of arguments |
| `$@` | All arguments |
| `$?` | Previous command exit status |
| `$$` | Current shell process ID |
| `$!` | PID of most recent background process |
| `$-` | Current shell options |

Example:

```bash
#!/bin/bash

echo "Script: $0"
echo "First argument: $1"
echo "Argument count: $#"
```

Detailed argument handling is covered in:

👉 [Arguments.md](./Arguments.md)

---

# 37. Process ID

The `$$` variable contains the current shell's process ID.

Example:

```bash
echo "Process ID: $$"
```

Output may look like:

```text
Process ID: 12345
```

This can be useful for temporary files or process-related scripting, although secure temporary-file tools such as `mktemp` are generally preferable for temporary files.

---

# 38. Last Exit Status

The `$?` variable contains the exit status of the previous command.

Example:

```bash
ls /etc

echo "$?"
```

Successful command:

```text
0
```

Failed command:

```bash
ls /does-not-exist

echo "$?"
```

Possible output:

```text
2
```

---

# 39. Practical Example — System Information

```bash
#!/bin/bash

HOST=$(hostname)
USER_NAME=$(whoami)
KERNEL=$(uname -r)
UPTIME=$(uptime -p)

echo "Hostname : $HOST"
echo "User     : $USER_NAME"
echo "Kernel   : $KERNEL"
echo "Uptime   : $UPTIME"
```

Run:

```bash
chmod +x system-info.sh
./system-info.sh
```

---

# 40. Practical Example — Backup Variables

```bash
#!/bin/bash

SOURCE="/var/www/html"
BACKUP_DIR="/backup"
DATE=$(date +%F)

BACKUP_FILE="$BACKUP_DIR/website-$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_FILE" "$SOURCE"

echo "Backup created: $BACKUP_FILE"
```

Variables make it easy to change:

```text
Source
Backup directory
Date
Backup filename
```

without rewriting the entire script.

---

# 41. Practical Example — AWS EC2

Variables are commonly used in EC2 automation.

```bash
#!/bin/bash

APP_NAME="my-web-app"
WEB_ROOT="/var/www/html"
PORT=80

echo "Application: $APP_NAME"
echo "Web root: $WEB_ROOT"
echo "Port: $PORT"
```

You can then reuse those values throughout the script.

---

# 42. AWS User Data Example

```bash
#!/bin/bash

APP_NAME="linux-learning"
WEB_ROOT="/usr/share/nginx/html"

dnf install -y nginx

systemctl enable --now nginx

echo "<h1>$APP_NAME</h1>" > "$WEB_ROOT/index.html"
```

Variables make EC2 User Data scripts easier to customize.

---

# 43. Practical Example — AWS CLI

You can store resource information in variables.

```bash
#!/bin/bash

BUCKET="my-linux-backup-bucket"
FILE="backup.tar.gz"

aws s3 cp "$FILE" "s3://$BUCKET/"
```

This is much easier to reuse than hard-coding the values throughout the script.

For production AWS automation, use IAM roles where possible rather than embedding access keys in scripts.

---

# 44. Variable Validation

Before using an important variable, validate it.

Example:

```bash
#!/bin/bash

BACKUP_DIR="${1:-}"

if [[ -z "$BACKUP_DIR" ]]; then
    echo "Error: Backup directory is required"
    exit 1
fi

echo "Backup directory: $BACKUP_DIR"
```

This prevents the script from continuing with missing input.

---

# 45. Checking Whether a Variable Is Set

Use:

```bash
[[ -v VARIABLE ]]
```

Example:

```bash
if [[ -v NAME ]]; then
    echo "NAME is set"
else
    echo "NAME is not set"
fi
```

This is useful when distinguishing between:

```text
Variable does not exist
```

and:

```text
Variable exists but is empty
```

---

# 46. Check Empty Variables

Use:

```bash
[[ -z "$NAME" ]]
```

Example:

```bash
NAME=""

if [[ -z "$NAME" ]]; then
    echo "NAME is empty"
fi
```

Check non-empty:

```bash
[[ -n "$NAME" ]]
```

---

# 🧪 Hands-On Lab 1 — Personal Information

Create:

```bash
vim variables-lab.sh
```

Add:

```bash
#!/bin/bash

NAME="Rohit"
ROLE="Cloud Engineer"
OS="Linux"

echo "Name: $NAME"
echo "Role: $ROLE"
echo "Operating System: $OS"
```

Run:

```bash
chmod +x variables-lab.sh
./variables-lab.sh
```

---

# 🧪 Hands-On Lab 2 — System Variables

Create:

```bash
vim system-variables.sh
```

Add:

```bash
#!/bin/bash

echo "User: $USER"
echo "Home: $HOME"
echo "Shell: $SHELL"
echo "Current Directory: $PWD"
echo "Hostname: $HOSTNAME"
```

Run:

```bash
chmod +x system-variables.sh
./system-variables.sh
```

---

# 🧪 Hands-On Lab 3 — Command Substitution

Create:

```bash
vim command-output.sh
```

Add:

```bash
#!/bin/bash

HOST=$(hostname)
KERNEL=$(uname -r)
DATE=$(date)

echo "Hostname: $HOST"
echo "Kernel: $KERNEL"
echo "Date: $DATE"
```

Run:

```bash
chmod +x command-output.sh
./command-output.sh
```

---

# 🧪 Hands-On Lab 4 — User Input

Create:

```bash
vim user-input.sh
```

Add:

```bash
#!/bin/bash

read -p "Enter your name: " NAME
read -p "Enter your role: " ROLE

echo
echo "Name: $NAME"
echo "Role: $ROLE"
```

Run:

```bash
chmod +x user-input.sh
./user-input.sh
```

---

# 🧪 Hands-On Lab 5 — Arithmetic

Create:

```bash
vim calculator.sh
```

Add:

```bash
#!/bin/bash

A=20
B=10

echo "Addition: $((A + B))"
echo "Subtraction: $((A - B))"
echo "Multiplication: $((A * B))"
echo "Division: $((A / B))"
echo "Remainder: $((A % B))"
```

Run:

```bash
chmod +x calculator.sh
./calculator.sh
```

---

# 🧪 Hands-On Lab 6 — AWS Server Information

Create:

```bash
vim aws-server-info.sh
```

Add:

```bash
#!/bin/bash

HOST=$(hostname)
USER_NAME=$(whoami)
KERNEL=$(uname -r)
IP=$(hostname -I | awk '{print $1}')

echo "=============================="
echo "       Server Information"
echo "=============================="
echo "Hostname : $HOST"
echo "User     : $USER_NAME"
echo "Kernel   : $KERNEL"
echo "IP       : $IP"
echo "=============================="
```

Run:

```bash
chmod +x aws-server-info.sh
./aws-server-info.sh
```

This is a good starter script for an EC2 Linux instance.

---

# 🧪 Mini Project — Configurable Backup Script

Create:

```bash
vim backup.sh
```

Add:

```bash
#!/bin/bash

SOURCE_DIR="${1:-/var/www/html}"
BACKUP_DIR="${2:-/backup}"
DATE=$(date +%F-%H%M%S)

BACKUP_FILE="$BACKUP_DIR/backup-$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

echo "Backup completed successfully."
echo "Source : $SOURCE_DIR"
echo "Backup : $BACKUP_FILE"
```

Make executable:

```bash
chmod +x backup.sh
```

Run with defaults:

```bash
./backup.sh
```

Or specify directories:

```bash
./backup.sh /var/www/html /backup
```

This project combines:

```text
Variables
Command substitution
Default values
Arguments
File paths
Backup automation
```

---

# ⚠️ Common Variable Mistakes

## Mistake 1 — Spaces Around `=`

Incorrect:

```bash
NAME = "Rohit"
```

Correct:

```bash
NAME="Rohit"
```

---

## Mistake 2 — Forgetting `$`

Incorrect:

```bash
echo "NAME"
```

Correct:

```bash
echo "$NAME"
```

---

## Mistake 3 — Not Quoting Variables

Risky:

```bash
rm -rf $BACKUP_DIR/*
```

Prefer careful quoting and validation:

```bash
rm -rf -- "$BACKUP_DIR"/*
```

For destructive commands, validate paths before using them.

---

## Mistake 4 — Using an Unset Variable

With:

```bash
set -u
```

this can fail:

```bash
echo "$NAME"
```

Use a default when appropriate:

```bash
echo "${NAME:-Guest}"
```

---

## Mistake 5 — Hard-Coding Configuration

Instead of:

```bash
tar -czf /backup/website.tar.gz /var/www/html
```

use:

```bash
SOURCE_DIR="/var/www/html"
BACKUP_DIR="/backup"
```

This makes the script easier to maintain.

---

# 🔐 Variable Security

Never store secrets directly in GitHub.

Do **not** commit:

```bash
AWS_ACCESS_KEY_ID="..."
AWS_SECRET_ACCESS_KEY="..."
PASSWORD="..."
DATABASE_PASSWORD="..."
```

Instead consider:

```text
IAM Roles
AWS Secrets Manager
Environment variables
Secret management systems
Secure configuration
```

For your GitHub repository, use examples such as:

```bash
AWS_REGION="ap-south-1"
```

but never real credentials.

---

# 🐞 Debugging Variables

Use:

```bash
bash -x script.sh
```

Example:

```bash
bash -x backup.sh
```

You can also inspect a variable:

```bash
declare -p NAME
```

Example:

```bash
NAME="Rohit"

declare -p NAME
```

---

# 📊 Variable Cheat Sheet

| Syntax | Purpose |
|---|---|
| `NAME="Rohit"` | Create variable |
| `echo "$NAME"` | Read variable |
| `${NAME}` | Explicit variable expansion |
| `$(command)` | Command substitution |
| `export NAME` | Export variable |
| `unset NAME` | Remove variable |
| `readonly NAME` | Make variable read-only |
| `${NAME:-default}` | Use default if unset/empty |
| `${NAME-default}` | Use