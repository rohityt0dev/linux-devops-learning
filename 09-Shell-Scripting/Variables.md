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

# 8. Environment Variables

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

# 9. `$HOME`

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

# 10. `$USER`

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

# 11. `$PATH`

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

# 12. Exporting Variables

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

# 13. Parent and Child Shell

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
