# ⚙️ Linux Processes

A **process** is a running instance of a program.

Whenever Linux executes a program, the operating system creates a process to manage its execution.

For example:

```bash
ls
```

Linux creates a process to execute the `ls` command.

Applications such as:

```text
Nginx
Apache
MySQL
SSH
Docker
Python
Java
```

also run as processes.

---

# 🎯 Learning Objectives

By completing this document, you will understand:

- What a process is
- Background processes
- `ps`
- `top`
- `htop`
- Process monitoring

---

# 📊 Viewing Processes

## `ps`

Basic:

```bash
ps
```

All processes for the current terminal:

```bash
ps -f
```

All users:

```bash
ps aux
```

---

# 🔍 Understanding `ps aux`

Run:

```bash
ps aux
```

Typical columns:

```text
USER
PID
%CPU
%MEM
VSZ
RSS
TTY
STAT
START
TIME
COMMAND
```

Important fields:

| Field | Meaning |
|---|---|
| USER | Process owner |
| PID | Process ID |
| %CPU | CPU usage |
| %MEM | Memory usage |
| VSZ | Virtual memory |
| RSS | Physical memory |
| STAT | Process state |
| COMMAND | Command |

---

# 🎯 Find a Specific Process

Search for nginx:

```bash
ps aux | grep nginx
```

---

# 📈 `top`

`top` provides real-time process information.

Run:

```bash
top
```

Important information includes:

```text
CPU usage
Memory usage
Load average
Running processes
Sleeping processes
Process PID
CPU percentage
Memory percentage
```

Useful keys inside `top`:

| Key | Action |
|---|---|
| `q` | Quit |
| `P` | Sort by CPU |
| `M` | Sort by memory |
| `k` | Kill process |
| `1` | Show individual CPUs |
| `h` | Help |

---

# 📊 `htop`

If installed:

```bash
htop
```

It provides an easier interactive process viewer.

Install on Debian/Ubuntu:

```bash
sudo apt update
sudo apt install htop
```

On RHEL-compatible systems:

```bash
sudo dnf install htop
```

---