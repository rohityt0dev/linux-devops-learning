# 🛠️ Linux Process Management

Process management means controlling, monitoring, prioritizing, and troubleshooting processes running on a Linux system.

For a Cloud Engineer, process management is important when troubleshooting:

```text
High CPU
High memory
Application hangs
Runaway processes
Failed applications
Zombie processes
Background jobs
Server performance
```

---

# 🎯 Learning Objectives

You will learn:

- Linux signals
- `kill`
- `killall`
- `pkill`
- Process termination
- Graceful vs forceful termination
- `nice`
- `renice`
- Process priority
- Zombie processes
- Orphan processes
- Process troubleshooting
- CPU troubleshooting
- Memory troubleshooting

---

# 📡 Linux Signals

Signals are messages sent to processes.

List signals:

```bash
kill -l
```

Important signals:

| Signal | Number | Description |
|---|---:|---|
| SIGHUP | 1 | Hangup |
| SIGINT | 2 | Interrupt |
| SIGQUIT | 3 | Quit |
| SIGTERM | 15 | Graceful termination |
| SIGSTOP | 19 | Stop |
| SIGCONT | 18 | Continue |
| SIGKILL | 9 | Force kill |

---

# 🟢 SIGTERM

`SIGTERM` asks a process to terminate gracefully.

```bash
kill -15 PID
```

or simply:

```bash
kill PID
```

By default:

```bash
kill PID
```

sends SIGTERM.

This should normally be your first choice when stopping a process.

---

# 🔴 SIGKILL

`SIGKILL` forcefully terminates a process.

```bash
kill -9 PID
```

Use it only when necessary.

Example:

```text
Application not responding
        ↓
kill PID
        ↓
Still running
        ↓
kill -9 PID
```

Do not routinely use:

```bash
kill -9
```

because the process cannot clean up normally.

---

# 🎯 `pkill`

Kill processes by name or matching criteria.

Example:

```bash
pkill process-name
```

More safely, test what matches first where supported:

```bash
pgrep -a process-name
```

Then terminate the intended process.

---

# 🎯 `killall`

Terminate processes by exact process name.

Example:

```bash
killall process-name
```

Be careful with broad names because multiple processes can match.

---

# ⏸️ Stop a Process

Send SIGSTOP:

```bash
kill -STOP PID
```

Resume:

```bash
kill -CONT PID
```

Example:

```bash
sleep 500 &
```

Find PID:

```bash
pgrep sleep
```

Stop:

```bash
kill -STOP PID
```

Continue:

```bash
kill -CONT PID
```

---

# ⚡ Process Priority

Linux processes have a scheduling priority.

The user-facing concept commonly used is the **nice value**.

Nice values normally range from:

```text
-20  → highest scheduling priority
  0  → default
+19  → lowest scheduling priority
```

A higher nice value generally means the process is more willing to give CPU time to other processes.

---

# 🔢 Check Nice Value

Use:

```bash
ps -eo pid,ni,comm
```

Example:

```text
PID   NI  COMMAND
100    0  bash
200    0  nginx
300   10  backup
```

---

# 🐌 Start a Process with `nice`

Example:

```bash
nice -n 10 ./backup.sh
```

This starts the process with a nice value of `10`.

Useful for resource-intensive background jobs.

---

# 🔧 Change Priority with `renice`

Find PID:

```bash
pgrep backup.sh
```

Then:

```bash
renice 10 -p PID
```

Check:

```bash
ps -p PID -o pid,ni,cmd
```

Changing a process to a more favorable priority may require elevated privileges depending on the direction of the change.

---

# 🧟 Zombie Process

A zombie process is a process that has finished execution but still has an entry in the process table because its parent has not collected its exit status.

Example:

```text
Parent
  │
  └── Zombie
```

Find zombie processes:

```bash
ps aux | awk '$8 ~ /Z/ {print}'
```

Another method:

```bash
ps -eo pid,ppid,stat,cmd | grep ' Z'
```

---

# 👻 Orphan Process

An orphan process is a child process whose original parent has terminated.

The child is then adopted by another process, commonly PID 1/systemd on modern Linux systems.

Example:

```text
Parent
  │
  └── Child
       ↓
Parent exits
       ↓
Child becomes orphan
       ↓
Adopted by PID 1
```

---

# 🧠 Zombie vs Orphan

| Zombie | Orphan |
|---|---|
| Process has already finished | Process is still running |
| Parent has not collected exit status | Original parent has exited |
| Remains as process-table entry | Gets adopted |
| Usually shows `Z` state | May continue normally |

---

# 🔥 Troubleshooting High CPU

Check:

```bash
top
```

Or:

```bash
ps aux --sort=-%cpu | head
```

Find the PID.

Then:

```bash
ps -p PID -f
```

Check what executable is running:

```bash
readlink -f /proc/PID/exe
```

Check open files:

```bash
sudo lsof -p PID
```

If the process belongs to a service:

```bash
systemctl status SERVICE
```

Check logs:

```bash
journalctl -u SERVICE
```

---

# 🧠 Troubleshooting High Memory

Find top memory processes:

```bash
ps aux --sort=-%mem | head
```

Check:

```bash
free -h
```

Then investigate the process:

```bash
ps -p PID -o pid,ppid,%mem,rss,vsz,cmd
```

Check system memory:

```bash
free -h
```

Check swap:

```bash
swapon --show
```

---

# 🧪 Lab 1 — Process Signals

Start:

```bash
sleep 500 &
```

Find PID:

```bash
pgrep sleep
```

Check:

```bash
ps -p PID -f
```

Stop:

```bash
kill -STOP PID
```

Check state:

```bash
ps -p PID -o pid,stat,cmd
```

Continue:

```bash
kill -CONT PID
```

Terminate:

```bash
kill PID
```

---

# 🧪 Lab 2 — Process Priority

Start:

```bash
nice -n 10 sleep 300 &
```

Find:

```bash
pgrep sleep
```

Check:

```bash
ps -p PID -o pid,ni,cmd
```

---

# 🧪 Lab 3 — Process Troubleshooting

Run:

```bash
top
```

Identify:

```text
Highest CPU process
Highest memory process
PID
User
Command
```

Then investigate:

```bash
ps -p PID -f
```

Document:

```text
Process:
PID:
User:
CPU:
Memory:
Command:
Possible reason:
Recommended action:
```

---

# 🧪 Mini Project — Linux Process Troubleshooting Report

Create a report containing:

```text
1. Top 5 CPU processes
2. Top 5 memory processes
3. Process tree
4. Running services
5. Failed services
6. System uptime
7. Memory status
8. Disk status
```

Commands:

```bash
ps aux --sort=-%cpu | head -n 6

ps aux --sort=-%mem | head -n 6

pstree -p

systemctl --failed

uptime

free -h

df -h
```

---

# ☁️ AWS Connection

Suppose an EC2 instance suddenly reports:

```text
CPUUtilization = 95%
```

Your investigation could be:

```text
CloudWatch
    ↓
High CPU Alarm
    ↓
SSH to EC2
    ↓
top
    ↓
Identify PID
    ↓
ps -p PID -f
    ↓
Check application logs
    ↓
Fix / restart application
```

If it is a service:

```bash
systemctl status nginx
```

If needed:

```bash
sudo systemctl restart nginx
```

---

# 🎯 Interview Questions

### 1. What is SIGTERM?

SIGTERM is a request for graceful process termination.

### 2. What is SIGKILL?

SIGKILL forcefully terminates a process and cannot be handled by the process.

### 3. SIGTERM vs SIGKILL?

```text
SIGTERM → graceful
SIGKILL → immediate/forceful
```

### 4. What is `pkill`?

It terminates processes based on matching criteria, commonly process name.

### 5. What is `nice`?

`nice` starts a process with a specified nice value.

### 6. What is `renice`?

`renice` changes the nice value of an existing process.

### 7. What is a zombie process?

A terminated process whose parent has not yet collected its exit status.

### 8. What is an orphan process?

A running child process whose original parent has terminated.

### 9. How do you find high CPU processes?

```bash
ps aux --sort=-%cpu | head
```

### 10. How do you find high memory processes?

```bash
ps aux --sort=-%mem | head
```

---

# ✅ Checklist

- [ ] Understand signals
- [ ] Use `kill`
- [ ] Understand SIGTERM
- [ ] Understand SIGKILL
- [ ] Use `pkill`
- [ ] Use `killall`
- [ ] Understand `nice`
- [ ] Understand `renice`
- [ ] Understand process priority
- [ ] Understand zombie processes
- [ ] Understand orphan processes
- [ ] Troubleshoot high CPU
- [ ] Troubleshoot high memory
- [ ] Complete the process troubleshooting lab

---

# 🔜 Next

Continue with:

```text
Systemd.md
```