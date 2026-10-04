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
- PID
- PPID
- Parent and child processes
- Process states
- Foreground processes
- Background processes
- `/proc`
- `ps`
- `top`
- `htop`
- `pstree`
- Jobs
- `bg`
- `fg`
- `nohup`
- Process monitoring

---

# 🧠 Process vs Program

A **program** is a file containing instructions.

A **process** is that program while it is running.

Example:

```text
Program
   ↓
/usr/bin/python3
   ↓
Running Python process
```

One program can create multiple processes.

---

# 🔢 Process ID — PID

Every running process has a process ID.

Check your current shell PID:

```bash
echo $$
```

Example:

```text
2345
```

Find a process PID:

```bash
pgrep nginx
```

Or:

```bash
pidof nginx
```

---

# 👨‍👦 PPID — Parent Process ID

PPID means:

> Parent Process ID

Check:

```bash
ps -ef
```

Example:

```text
UID       PID   PPID  CMD
root        1      0  /sbin/init
user     2500   2400  bash
user     2600   2500  sleep 100
```

Here:

```text
PID 2500
PPID 2400
```

means process `2400` created process `2500`.

---

# 🌳 Parent and Child Processes

Processes form a hierarchy.

Example:

```text
systemd (PID 1)
│
├── sshd
│   └── bash
│       └── command
│
├── cron
│
└── nginx
    ├── worker
    └── worker
```

View the hierarchy:

```bash
pstree
```

More detailed:

```bash
pstree -p
```

---

# 🥇 PID 1

On systems using systemd:

```text
PID 1 = systemd
```

Check:

```bash
ps -p 1 -f
```

You may see:

```text
UID   PID  PPID  CMD
root    1     0  /sbin/init
```

Check the process:

```bash
ps -p 1 -o pid,ppid,comm,args
```

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

Another common format:

```bash
ps -ef
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

Better:

```bash
pgrep nginx
```

Show full details:

```bash
pgrep -a nginx
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

# 💤 Process States

Linux processes can have different states.

Common states include:

| State | Meaning |
|---|---|
| R | Running |
| S | Sleeping |
| D | Uninterruptible sleep |
| T | Stopped |
| Z | Zombie |

Check process states:

```bash
ps -eo pid,ppid,stat,cmd
```

Example:

```text
PID    PPID  STAT  CMD
1000   900   S     bash
1100   1000  R     top
```

---

# ▶️ Foreground Process

When you execute:

```bash
ping 8.8.8.8
```

the command normally runs in the foreground.

Your terminal remains attached to the process.

Stop it:

```text
Ctrl + C
```

---

# 🔙 Background Process

Run a command in the background:

```bash
sleep 100 &
```

Example:

```text
[1] 3456
```

Here:

```text
3456 = PID
1 = job number
```

List jobs:

```bash
jobs
```

---

# ⏸️ Move a Process to Background

Start:

```bash
sleep 100
```

Press:

```text
Ctrl + Z
```

The process is stopped.

Resume in background:

```bash
bg
```

---

# 🔙 Bring Background Job to Foreground

```bash
fg
```

If multiple jobs exist:

```bash
jobs
```

Then:

```bash
fg %1
```

---

# 🛡️ `nohup`

Normally, a process may terminate when your SSH session closes.

`nohup` can allow a command to continue after logout.

Example:

```bash
nohup ./backup.sh &
```

Output may be written to:

```text
nohup.out
```

Example:

```bash
nohup ./script.sh > script.log 2>&1 &
```

This is useful for long-running tasks.

---

# 📁 `/proc`

Linux provides process information through the `/proc` filesystem.

For example:

```bash
ls /proc
```

You will see directories such as:

```text
1
2
3
...
```

These numbers correspond to process IDs.

For PID 1:

```bash
ls /proc/1
```

View command line:

```bash
cat /proc/1/cmdline
```

View status:

```bash
cat /proc/1/status
```

View memory information:

```bash
cat /proc/1/status | grep Vm
```

---

# 🧪 Hands-On Lab 1 — Explore Processes

## Step 1

Check your shell:

```bash
echo $$
```

## Step 2

Check the process:

```bash
ps -p $$ -f
```

## Step 3

List all processes:

```bash
ps aux
```

## Step 4

Find your shell:

```bash
ps -ef | grep bash
```

## Step 5

View process tree:

```bash
pstree -p
```

---

# 🧪 Hands-On Lab 2 — Background Processes

Start:

```bash
sleep 300 &
```

Check:

```bash
jobs
```

Find PID:

```bash
pgrep sleep
```

View it:

```bash
ps -p $(pgrep sleep) -f
```

Stop it:

```bash
kill $(pgrep sleep)
```

Confirm:

```bash
pgrep sleep
```

---

# 🧪 Hands-On Lab 3 — Foreground and Background

Run:

```bash
sleep 300
```

Press:

```text
Ctrl + Z
```

Check:

```bash
jobs
```

Continue in background:

```bash
bg
```

Check:

```bash
jobs
```

Bring it back:

```bash
fg
```

Stop:

```text
Ctrl + C
```

---

# 🧪 Hands-On Lab 4 — Monitor CPU

Run:

```bash
top
```

Press:

```text
P
```

This sorts processes by CPU usage.

Press:

```text
M
```

This sorts processes by memory usage.

Exit:

```text
q
```

---

# 🧪 Mini Project — Process Monitor

Create:

```bash
nano process-monitor.sh
```

Add:

```bash
#!/bin/bash

echo "================================"
echo " Linux Process Monitor"
echo "================================"

echo
echo "Hostname:"
hostname

echo
echo "Uptime:"
uptime

echo
echo "Top CPU Processes:"
ps aux --sort=-%cpu | head -n 6

echo
echo "Top Memory Processes:"
ps aux --sort=-%mem | head -n 6

echo
echo "Process Count:"
ps -e --no-headers | wc -l

echo
echo "================================"
```

Make executable:

```bash
chmod +x process-monitor.sh
```

Run:

```bash
./process-monitor.sh
```

---

# ☁️ AWS Connection

Process knowledge is extremely important on EC2.

Suppose your EC2 instance has high CPU.

You can investigate:

```bash
top
```

Then:

```bash
ps aux --sort=-%cpu | head
```

If memory is high:

```bash
ps aux --sort=-%mem | head
```

AWS architecture:

```text
CloudWatch
    ↓
EC2 CPU Alarm
    ↓
Linux Server
    ↓
top / ps
    ↓
Find Problem Process
    ↓
Restart / Fix Application
```

---

# 🛠️ Troubleshooting Commands

### Find high CPU processes

```bash
ps aux --sort=-%cpu | head
```

### Find high memory processes

```bash
ps aux --sort=-%mem | head
```

### Find a process

```bash
pgrep process-name
```

### Process details

```bash
ps -p PID -f
```

### Process tree

```bash
pstree -p
```

### Interactive monitoring

```bash
top
```

---

# 🎯 Interview Questions

### 1. What is a process?

A process is a running instance of a program.

### 2. What is PID?

PID is the unique Process ID assigned to a running process.

### 3. What is PPID?

PPID is the Process ID of the parent process.

### 4. What is PID 1?

On a system using systemd, PID 1 is normally the systemd initialization process.

### 5. What is the difference between a program and a process?

A program is static code stored on disk. A process is that program executing in memory.

### 6. How do you list all processes?

```bash
ps aux
```

or:

```bash
ps -ef
```

### 7. How do you monitor processes in real time?

```bash
top
```

or:

```bash
htop
```

### 8. How do you find a process?

```bash
pgrep process-name
```

### 9. What is a background process?

A process that runs without occupying the terminal's foreground.

### 10. What is `nohup`?

`nohup` allows a command to continue running even after the terminal/session is disconnected in common use cases.

---

# ✅ Checklist

- [ ] Understand process vs program
- [ ] Understand PID
- [ ] Understand PPID
- [ ] Understand parent/child processes
- [ ] Understand PID 1
- [ ] Use `ps`
- [ ] Use `top`
- [ ] Use `htop`
- [ ] Use `pstree`
- [ ] Understand process states
- [ ] Run background processes
- [ ] Use `jobs`
- [ ] Use `bg`
- [ ] Use `fg`
- [ ] Understand `nohup`
- [ ] Explore `/proc`
- [ ] Complete the Process Monitor project

---

# 🔜 Next

Continue with:

```text
Process-Management.md
```

Next you will learn how to:

```text
Stop processes
Send signals
Change process priority
Use kill/pkill/killall
Troubleshoot CPU and memory issues
Understand zombie and orphan processes
```