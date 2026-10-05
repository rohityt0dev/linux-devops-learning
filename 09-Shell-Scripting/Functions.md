# 🧩 Bash Functions

## 📌 Overview

A **function** is a reusable block of Bash code that performs a specific task.

Instead of writing the same commands multiple times, you can place them inside a function and call the function whenever needed.

Without a function:

```bash
echo "Checking disk..."
df -h /

echo "Checking memory..."
free -h

echo "Checking disk..."
df -h /

echo "Checking memory..."
free -h
```

With functions:

```bash
check_disk() {
    df -h /
}

check_memory() {
    free -h
}

check_disk
check_memory
```

Functions make scripts:

- Easier to read
- Easier to maintain
- Easier to debug
- Easier to reuse
- More organized
- Better suited for automation

---

# 🎯 Learning Objectives

After completing this topic, you should understand:

- What a Bash function is
- How to create functions
- How to call functions
- Function arguments
- Function parameters
- Local variables
- Global variables
- Return status
- `return`
- `$?`
- Functions with conditions
- Functions with loops
- Function libraries
- Logging functions
- Error-handling functions
- AWS automation functions
- Practical Linux automation

---

# 1. What Is a Function?

A function is a named block of commands.

Basic syntax:

```bash
function_name() {
    commands
}
```

Example:

```bash
hello() {
    echo "Hello Linux"
}
```

Call the function:

```bash
hello
```

Output:

```text
Hello Linux
```

---

# 2. Defining a Function

Example:

```bash
#!/bin/bash

hello() {
    echo "Hello from Bash"
}
```

At this point, the function has only been defined.

To execute it:

```bash
hello
```

Complete script:

```bash
#!/bin/bash

hello() {
    echo "Hello from Bash"
}

hello
```

---

# 3. Alternative Function Syntax

Bash also supports:

```bash
function hello {
    echo "Hello Linux"
}
```

However, this style is less portable to shells other than Bash.

For Bash scripts, a common style is:

```bash
hello() {
    echo "Hello Linux"
}
```

---

# 4. Calling a Function

Example:

```bash
#!/bin/bash

welcome() {
    echo "Welcome to Linux"
}

welcome
```

A function can be called multiple times:

```bash
welcome
welcome
welcome
```

Output:

```text
Welcome to Linux
Welcome to Linux
Welcome to Linux
```

---

# 5. Functions With Variables

```bash
#!/bin/bash

NAME="Rohit"

welcome() {
    echo "Welcome $NAME"
}

welcome
```

Output:

```text
Welcome Rohit
```

The function can access variables from the surrounding shell unless they are local to another scope.

---

# 6. Function Arguments

Functions can receive arguments.

Example:

```bash
#!/bin/bash

hello() {
    echo "Hello $1"
}

hello "Rohit"
```

Output:

```text
Hello Rohit
```

Inside the function:

```text
$1 → First function argument
$2 → Second function argument
$# → Number of function arguments
$@ → All function arguments
```

---

# 7. Multiple Function Arguments

```bash
#!/bin/bash

show_info() {
    echo "Name: $1"
    echo "Role: $2"
}

show_info "Rohit" "Cloud Engineer"
```

Output:

```text
Name: Rohit
Role: Cloud Engineer
```

---

# 8. Function Argument Count

Use:

```bash
$#
```

Example:

```bash
show_args() {
    echo "Number of arguments: $#"
}

show_args one two three
```

Output:

```text
Number of arguments: 3
```

---

# 9. All Function Arguments

Use:

```bash
"$@"
```

Example:

```bash
show_args() {
    for ARG in "$@"
    do
        echo "Argument: $ARG"
    done
}

show_args one two three
```

Output:

```text
Argument: one
Argument: two
Argument: three
```

Always quote `"$@"` when you want to preserve each argument as a separate item.

---

# 10. Function Argument `$0`

Inside a function, `$0` normally refers to the **script name**, not the function name.

Example:

```bash
#!/bin/bash

show_info() {
    echo "Script: $0"
    echo "First function argument: $1"
}

show_info "Rohit"
```

Output might be:

```text
Script: ./script.sh
First function argument: Rohit
```

---

# 11. `shift`

The `shift` command moves positional parameters.

Example:

```bash
process_args() {
    echo "First: $1"

    shift

    echo "New first: $1"
}

process_args one two three
```

Output:

```text
First: one
New first: two
```

`shift` is useful when processing an arbitrary number of function arguments.

---

# 12. Local Variables

Use `local` inside functions.

Example:

```bash
#!/bin/bash

show_info() {
    local NAME="Rohit"

    echo "$NAME"
}

show_info
```

The variable is local to the function.

---

# 13. Why Use `local`?

Without `local`:

```bash
NAME="Rohit"
```

the variable may affect the surrounding shell.

With:

```bash
local NAME="Rohit"
```

the variable is limited to the function's scope.

Prefer local variables inside functions when the value is only needed by that function.

---

# 14. Local Variable Example

```bash
#!/bin/bash

NAME="Global"

show_name() {
    local NAME="Local"

    echo "Inside function: $NAME"
}

show_name

echo "Outside function: $NAME"
```

Output:

```text
Inside function: Local
Outside function: Global
```

---

# 15. Global Variables

A variable defined outside a function is normally available to the function.

Example:

```bash
#!/bin/bash

BACKUP_DIR="/backup"

create_backup() {
    echo "Backup directory: $BACKUP_DIR"
}

create_backup
```

Output:

```text
Backup directory: /backup
```

Use global variables carefully.

Too many global variables can make large scripts difficult to understand.

---

# 16. Function Return Status

Bash functions return an **exit status**.

By default, the function returns the exit status of the last command executed.

Example:

```bash
hello() {
    echo "Hello"
}

hello

echo "$?"
```

Output:

```text
Hello
0
```

---

# 17. Using `return`

You can explicitly return a status:

```bash
check_file() {
    if [[ -f "$1" ]]; then
        return 0
    else
        return 1
    fi
}
```

Use it:

```bash
if check_file "/etc/passwd"; then
    echo "File exists"
else
    echo "File does not exist"
fi
```

This is an excellent pattern for reusable validation functions.

---

# 18. Important: `return` Is Not Normal Output

This is important:

```bash
return 0
```

does not return text.

It returns an **exit status**.

For example:

```text
0     → Success
1+    → Failure / condition-specific status
```

If you want a function to produce text, use:

```bash
echo
```

or:

```bash
printf
```

---

# 19. Returning Data From a Function

Example:

```bash
get_hostname() {
    hostname
}

HOST=$(get_hostname)

echo "Hostname: $HOST"
```

The command substitution captures the function's standard output.

---

# 20. Function With `echo`

```bash
get_ip() {
    hostname -I | awk '{print $1}'
}

IP=$(get_ip)

echo "IP Address: $IP"
```

This is useful when a function calculates or retrieves a value.

---

# 21. Function With Success/Failure

Example:

```bash
check_service() {
    local SERVICE="$1"

    if systemctl is-active --quiet "$SERVICE"; then
        return 0
    else
        return 1
    fi
}
```

Use:

```bash
if check_service nginx; then
    echo "Nginx is running"
else
    echo "Nginx is not running"
fi
```

---

# 22. Function With Input Validation

A good function should validate its arguments.

Example:

```bash
check_file() {
    local FILE="${1:-}"

    if [[ -z "$FILE" ]]; then
        echo "ERROR: File path is required" >&2
        return 1
    fi

    if [[ -f "$FILE" ]]; then
        echo "File exists: $FILE"
        return 0
    fi

    echo "File does not exist: $FILE" >&2
    return 1
}
```

Use:

```bash
check_file "/etc/passwd"
```

---

# 23. Why Use `>&2`?

This:

```bash
echo "ERROR: Something failed" >&2
```

sends the message to **standard error** instead of standard output.

This is useful because:

```text
stdout → Normal output
stderr → Error messages
```

This becomes important when functions are used with command substitution.

---

# 24. Function With Conditions

```bash
check_disk() {
    local USAGE

    USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

    if [[ "$USAGE" -ge 80 ]]; then
        echo "WARNING: Disk usage is ${USAGE}%"
        return 1
    fi

    echo "Disk usage is ${USAGE}%"
    return 0
}
```

Call:

```bash
check_disk
```

---

# 25. Function With Loops

```bash
check_services() {
    local SERVICES=("ssh" "nginx")

    for SERVICE in "${SERVICES[@]}"
    do
        if systemctl is-active --quiet "$SERVICE"; then
            echo "$SERVICE: Running"
        else
            echo "$SERVICE: Not running"
        fi
    done
}

check_services
```

Functions become especially powerful when combined with loops.

---

# 26. Multiple Functions in One Script

A professional script often contains several functions.

Example:

```bash
#!/bin/bash

check_disk() {
    df -h /
}

check_memory() {
    free -h
}

check_uptime() {
    uptime
}

echo "Disk:"
check_disk

echo
echo "Memory:"
check_memory

echo
echo "Uptime:"
check_uptime
```

This keeps the script organized.

---

# 27. Recommended Function Structure

A useful structure is:

```bash
function_name() {
    local VARIABLE="value"

    # Validate input

    # Perform operation

    # Return status
}
```

Example:

```bash
backup_directory() {
    local SOURCE="$1"
    local DESTINATION="$2"

    if [[ -z "$SOURCE" || -z "$DESTINATION" ]]; then
        echo "Usage: backup_directory <source> <destination>" >&2
        return 1
    fi

    # Backup logic here

    return 0
}
```

---

# 28. Function Libraries

You can store reusable functions in another file.

Example:

```text
project/
├── main.sh
└── functions.sh
```

`functions.sh`:

```bash
log_message() {
    echo "$(date '+%F %T') - $1"
}
```

`main.sh`:

```bash
#!/bin/bash

source ./functions.sh

log_message "Script started"
```

Run:

```bash
chmod +x main.sh
./main.sh
```

---

# 29. `source` Command

These are equivalent:

```bash
source ./functions.sh
```

and:

```bash
. ./functions.sh
```

The `source` command loads the contents of another Bash file into the current shell.

---

# 30. Check Whether Library Exists

A safer pattern:

```bash
if [[ -f "./functions.sh" ]]; then
    source "./functions.sh"
else
    echo "ERROR: functions.sh not found" >&2
    exit 1
fi
```

---

# 31. Logging Function

A reusable logging function:

```bash
log() {
    echo "$(date '+%F %T') - $*"
}
```

Use:

```bash
log "Backup started"
log "Backup completed"
```

Output:

```text
2026-10-05 23:00:00 - Backup started
2026-10-05 23:01:00 - Backup completed
```

---

# 32. Better Logging Functions

You can create different log levels:

```bash
log_info() {
    echo "$(date '+%F %T') [INFO] $*"
}

log_warning() {
    echo "$(date '+%F %T') [WARNING] $*" >&2
}

log_error() {
    echo "$(date '+%F %T') [ERROR] $*" >&2
}
```

Use:

```bash
log_info "Starting backup"
log_warning "Disk usage is high"
log_error "Backup failed"
```

---

# 33. Error Handling Function

Example:

```bash
die() {
    echo "ERROR: $*" >&2
    exit 1
}
```

Use:

```bash
[[ -d "/backup" ]] || die "Backup directory does not exist"
```

This makes error handling shorter and clearer.

---

# 34. Validation Function

```bash
require_command() {
    local COMMAND="$1"

    if ! command -v "$COMMAND" &>/dev/null; then
        echo "ERROR: Required command not found: $COMMAND" >&2
        return 1
    fi
}
```

Use:

```bash
require_command curl
require_command tar
require_command aws
```

---

# 35. Check Multiple Commands

```bash
require_commands() {
    local COMMAND

    for COMMAND in "$@"
    do
        if ! command -v "$COMMAND" &>/dev/null; then
            echo "ERROR: Missing command: $COMMAND" >&2
            return 1
        fi
    done
}
```

Use:

```bash
require_commands curl tar gzip
```

---

# 36. Cleanup Function

Functions are useful for cleanup.

```bash
cleanup() {
    echo "Cleaning temporary files..."
    rm -f "$TEMP_FILE"
}
```

Use a trap:

```bash
trap cleanup EXIT
```

This causes `cleanup` to run when the script exits.

---

# 37. Signal Handling

Example:

```bash
cleanup() {
    echo
    echo "Cleaning up..."
}

trap cleanup EXIT
trap 'echo "Interrupted"; exit 130' INT
```

This is useful for long-running scripts.

---

# 38. Function and `set -e`

If your script uses:

```bash
set -e
```

be careful when calling functions whose non-zero status is expected.

Example:

```bash
if check_file "$FILE"; then
    echo "File exists"
else
    echo "File missing"
fi
```

Using a function as the condition of an `if` statement is a normal way to handle expected success/failure without accidentally treating the expected failure as an unexpected script error.

---

# 39. Function With `set -euo pipefail`

A common script structure:

```bash
#!/bin/bash

set -euo pipefail

log_info() {
    echo "$(date '+%F %T') [INFO] $*"
}

require_command() {
    local COMMAND="$1"

    if ! command -v "$COMMAND" &>/dev/null; then
        echo "ERROR: Missing command: $COMMAND" >&2
        return 1
    fi
}

log_info "Starting script"

require_command tar
require_command gzip

log_info "Dependencies verified"
```

---

# 40. AWS Function — Check AWS CLI

```bash
check_aws_cli() {
    if command -v aws &>/dev/null; then
        echo "AWS CLI is installed"
        return 0
    fi

    echo "AWS CLI is not installed" >&2
    return 1
}
```

Use:

```bash
if ! check_aws_cli; then
    exit 1
fi
```

---

# 41. AWS Function — Check S3 Access

```bash
check_s3_bucket() {
    local BUCKET="$1"

    if [[ -z "$BUCKET" ]]; then
        echo "Bucket name is required" >&2
        return 1
    fi

    if aws s3 ls "s3://$BUCKET" &>/dev/null; then
        echo "S3 bucket is accessible: $BUCKET"
        return 0
    fi

    echo "Cannot access S3 bucket: $BUCKET" >&2
    return 1
}
```

Use:

```bash
check_s3_bucket "my-linux-backup"
```

For EC2, prefer an IAM role with appropriate permissions instead of embedding access keys.

---

# 42. AWS Function — Upload File

```bash
upload_to_s3() {
    local FILE="$1"
    local BUCKET="$2"

    if [[ ! -f "$FILE" ]]; then
        echo "File does not exist: $FILE" >&2
        return 1
    fi

    if aws s3 cp "$FILE" "s3://$BUCKET/"; then
        echo "Upload successful: $FILE"
        return 0
    fi

    echo "Upload failed: $FILE" >&2
    return 1
}
```

Use:

```bash
upload_to_s3 "backup.tar.gz" "my-linux-backup"
```

---

# 43. Function Return Codes

A good automation function should clearly indicate success or failure.

Example:

```bash
check_service() {
    local SERVICE="$1"

    systemctl is-active --quiet "$SERVICE"
}
```

Use:

```bash
if check_service nginx; then
    echo "Nginx is running"
else
    echo "Nginx is not running"
fi
```

The function itself returns the exit status of:

```bash
systemctl is-active --quiet "$SERVICE"
```

---

# 44. Function Output vs Return Code

This distinction is very important.

### Return status

Used for:

```text
Success / failure
```

Example:

```bash
return 0
return 1
```

### Standard output

Used for:

```text
Data / information
```

Example:

```bash
echo "$HOSTNAME"
```

Example:

```bash
HOSTNAME=$(get_hostname)
```

---

# 45. Function With Both Output and Status

Example:

```bash
get_ip() {
    local IP

    IP=$(hostname -I | awk '{print $1}')

    if [[ -z "$IP" ]]; then
        echo "Unable to determine IP address" >&2
        return 1
    fi

    printf '%s\n' "$IP"
}
```

Use:

```bash
if IP=$(get_ip); then
    echo "Server IP: $IP"
else
    echo "Failed to get IP"
fi
```

---

# 46. Function Naming Best Practices

Use descriptive names:

```bash
check_disk
check_service
create_backup
upload_to_s3
log_info
validate_input
require_command
```

Avoid:

```bash
a
test1
function1
doit
```

Good function names make scripts easier to understand.

---

# 47. Function Organization

A larger script can be organized like:

```text
Script
│
├── Configuration
│
├── Logging Functions
│
├── Validation Functions
│
├── Main Functions
│
├── Cleanup Functions
│
└── Main Program
```

Example:

```bash
#!/bin/bash

set -euo pipefail

# Configuration
BACKUP_DIR="/backup"

# Functions
log_info() {
    echo "$(date '+%F %T') [INFO] $*"
}

check_backup_dir() {
    [[ -d "$BACKUP_DIR" ]]
}

create_backup() {
    # Backup logic
    :
}

cleanup() {
    # Cleanup logic
    :
}

# Main
trap cleanup EXIT

log_info "Starting backup"

check_backup_dir
create_backup

log_info "Backup completed"
```

---

# 48. The `main` Function

For larger scripts, you can put the main program inside a function.

Example:

```bash
#!/bin/bash

set -euo pipefail

log_info() {
    echo "$(date '+%F %T') [INFO] $*"
}

check_dependencies() {
    command -v tar >/dev/null
}

main() {
    log_info "Starting script"

    check_dependencies

    log_info "Script completed"
}

main "$@"
```

This gives the script a clear entry point.

---

# 49. Why Use `main`?

Benefits:

```text
Better organization
Cleaner global scope
Easier testing
Easier reading
Reusable functions
Clear program flow
```

This style becomes useful as scripts grow beyond a few dozen lines.

---

# 50. Practical Project — Server Health Functions

Create:

```bash
vim server-health.sh
```

Example:

```bash
#!/bin/bash

set -u

log_info() {
    echo "$(date '+%F %T') [INFO] $*"
}

check_disk() {
    local USAGE

    USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

    if [[ "$USAGE" -ge 80 ]]; then
        echo "WARNING: Disk usage is ${USAGE}%"
        return 1
    fi

    echo "Disk usage: ${USAGE}%"
    return 0
}

check_memory() {
    local USAGE

    USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

    if [[ "$USAGE" -ge 80 ]]; then
        echo "WARNING: Memory usage is ${USAGE}%"
        return 1
    fi

    echo "Memory usage: ${USAGE}%"
    return 0
}

check_ssh() {
    if systemctl is-active --quiet ssh 2>/dev/null || \
       systemctl is-active --quiet sshd 2>/dev/null; then
        echo "SSH: Running"
        return 0
    fi

    echo "SSH: Not running"
    return 1
}

main() {
    log_info "Starting server health check"

    check_disk || true
    check_memory || true
    check_ssh || true

    log_info "Health check completed"
}

main "$@"
```

Run:

```bash
chmod +x server-health.sh
./server-health.sh
```

---

# 51. Practical Project — Backup Functions

```bash
#!/bin/bash

set -euo pipefail

BACKUP_DIR="/backup"
DATE=$(date +%F-%H%M%S)

log_info() {
    echo "$(date '+%F %T') [INFO] $*"
}

die() {
    echo "$(date '+%F %T') [ERROR] $*" >&2
    exit 1
}

create_backup() {
    local SOURCE="$1"
    local NAME
    local DESTINATION

    [[ -d "$SOURCE" ]] || {
        echo "Source does not exist: $SOURCE" >&2
        return 1
    }

    NAME=$(basename "$SOURCE")
    DESTINATION="$BACKUP_DIR/${NAME}-${DATE}.tar.gz"

    tar -czf "$DESTINATION" "$SOURCE"

    log_info "Created backup: $DESTINATION"
}

main() {
    mkdir -p "$BACKUP_DIR"

    create_backup "/etc"
    create_backup "/var/www/html"
}

main "$@"
```

---

# 52. Practical Project — AWS Backup Functions

```bash
#!/bin/bash

set -euo pipefail

BACKUP_DIR="/backup"
S3_BUCKET="my-linux-backup"

log_info() {
    echo "$(date '+%F %T') [INFO] $*"
}

require_aws() {
    command -v aws >/dev/null 2>&1 || {
        echo "ERROR: AWS CLI is not installed" >&2
        return 1
    }
}

upload_backup() {
    local FILE="$1"

    [[ -f "$FILE" ]] || {
        echo "Backup file does not exist: $FILE" >&2
        return 1
    }

    aws s3 cp "$FILE" "s3://$S3_BUCKET/"
    log_info "Uploaded: $FILE"
}

main() {
    require_aws

    for FILE in "$BACKUP_DIR"/*.tar.gz
    do
        [[ -f "$FILE" ]] || continue
        upload_backup "$FILE"
    done
}

main "$@"
```

For production, validate the bucket, handle AWS CLI failures, and use an IAM role with least-privilege permissions.

---

# 🧪 Hands-On Lab 1 — Hello Function

Create:

```bash
vim function-lab.sh
```

Add:

```bash
#!/bin/bash

hello() {
    echo "Hello Linux"
}

hello
```

Run:

```bash
chmod +x function-lab.sh
./function-lab.sh
```

---

# 🧪 Hands-On Lab 2 — Function Arguments

```bash
#!/bin/bash

show_user() {
    echo "Username: $1"
    echo "Role: $2"
}

show_user "Rohit" "Cloud Engineer"
```

---

# 🧪 Hands-On Lab 3 — File Validation Function

```bash
#!/bin/bash

check_file() {
    local FILE="$1"

    if [[ -f "$FILE" ]]; then
        echo "File exists: $FILE"
        return 0
    fi

    echo "File not found: $FILE"
    return 1
}

check_file "/etc/passwd"
```

---

# 🧪 Hands-On Lab 4 — Service Function

```bash
#!/bin/bash

check_service() {
    local SERVICE="$1"

    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE is running"
        return 0
    fi

    echo "$SERVICE is not running"
    return 1
}

check_service "nginx"
```

---

# 🧪 Hands-On Lab 5 — Multiple Functions

Create:

```bash
#!/bin/bash

show_hostname() {
    hostname
}

show_kernel() {
    uname -r
}

show_uptime() {
    uptime
}

echo "Hostname:"
show_hostname

echo
echo "Kernel:"
show_kernel

echo
echo "Uptime:"
show_uptime
```

---

# 🧪 Hands-On Lab 6 — Function Library

Create:

```text
function-lab/
├── main.sh
└── functions.sh
```

### `functions.sh`

```bash
log_info() {
    echo "$(date '+%F %T') [INFO] $*"
}

check_file() {
    [[ -f "$1" ]]
}
```

### `main.sh`

```bash
#!/bin/bash

source ./functions.sh

log_info "Script started"

if check_file "/etc/passwd"; then
    log_info "passwd file exists"
else
    log_info "passwd file does not exist"
fi
```

Run:

```bash
chmod +x main.sh
./main.sh
```

---

# 🐞 Common Function Problems

## Problem 1 — Calling Before Definition

Prefer defining functions before calling them:

```bash
hello() {
    echo "Hello"
}

hello
```

---

## Problem 2 — Forgetting Arguments

If a function expects:

```bash
check_file "$1"
```

but no argument is supplied, the function may behave unexpectedly.

Validate:

```bash
if [[ $# -lt 1 ]]; then
    echo "Usage: check_file <file>" >&2
    return 1
fi
```

---

## Problem 3 — Global Variables

Avoid unnecessary global variables.

Prefer:

```bash
local FILE="$1"
```

inside functions.

---

## Problem 4 — Confusing `echo` With `return`

Wrong idea:

```bash
return "Backup completed"
```

Correct:

```bash
echo "Backup completed"
return 0
```

---

## Problem 5 — Ignoring Function Failure

Avoid:

```bash
create_backup
echo "Backup completed"
```

if the function can fail.

Prefer:

```bash
if create_backup; then
    echo "Backup completed"
else
    echo "Backup failed"
fi
```

---

# 🐞 Debugging Functions

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

# 📊 Function Cheat Sheet

| Syntax | Purpose |
|---|---|
| `name() { }` | Define function |
| `name` | Call function |
| `$1` | First function argument |
| `$2` | Second function argument |
| `$#` | Number of arguments |
| `"$@"` | All arguments |
| `local` | Function-local variable |
| `return 0` | Success |
| `return 1` | Failure |
| `$?` | Previous command/function