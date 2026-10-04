# ⚙️ Linux Processes and Services

Processes and services are fundamental concepts for Linux administration, Cloud Engineering, DevOps, and AWS.

Whenever you run a command, start a web server, connect through SSH, or run an application on an AWS EC2 instance, Linux creates and manages processes.

This section explains how Linux processes work, how to manage them, how `systemd` controls services, and how to automate tasks using cron jobs.

---

## 🎯 Learning Objectives

By completing this section, you will understand:

- What a Linux process is
- PID and PPID
- Parent and child processes
- Foreground and background processes
- Process states
- How to view running processes
- How to monitor CPU and memory usage
- How to start, stop, and terminate processes
- Linux signals
- Process priorities
- `nice` and `renice`
- Zombie and orphan processes
- What `systemd` is
- How `systemctl` works
- Linux services
- Service startup and troubleshooting
- `journalctl`
- Cron jobs
- Automated task scheduling
- Process and service troubleshooting on AWS EC2

---

# 📚 Topics

| File | Topic |
|---|---|
| [Processes.md](./Processes.md) | Linux process fundamentals |
| [Process-Management.md](./Process-Management.md) | Managing and troubleshooting processes |
| [Systemd.md](./Systemd.md) | systemd and service management |
| [Services.md](./Services.md) | Linux services |
| [Cron-Jobs.md](./Cron-Jobs.md) | Scheduled and automated tasks |

---

# 🧠 What Is a Process?

A **process** is a running instance of a program.

For example:

```bash
ls
```

When Linux executes `ls`, it creates a process.

Other examples:

```text
SSH Server
Web Server
Database
Docker
Python Application
Nginx
Apache
Cron
```

Every running process normally has a unique **PID (Process ID)**.

---

# 🔢 PID

PID means:

> Process ID

You can see your current shell's PID using:

```bash
echo $$
```

Example:

```text
2451
```

---

# 👨‍👦 Parent and Child Processes

Processes can create other processes.

Example:

```text
systemd
   │
   ├── sshd
   │
   ├── cron
   │
   └── nginx
        │
        └── worker process
```

The process that creates another process is called the **parent process**.

The newly created process is called the **child process**.

---

# 🔧 systemd

On modern Linux systems, `systemd` is commonly the first userspace process.

Check:

```bash
ps -p 1 -f
```

Example:

```text
UID   PID  PPID  CMD
root    1     0  /sbin/init
```

On systems using systemd, PID 1 is normally:

```text
systemd
```

---

# 🔄 Process Lifecycle

A simplified process lifecycle:

```text
Program
   ↓
Process Created
   ↓
Ready
   ↓
Running
   ↓
Waiting / Sleeping
   ↓
Running
   ↓
Terminated
```

---

# 📊 Monitoring Processes

Common commands:

```bash
ps
ps aux
ps -ef
top
htop
pstree
```

Example:

```bash
ps aux
```

Check a specific process:

```bash
ps -p PID -f
```

Example:

```bash
ps -p 1234 -f
```

---

# 🛑 Process Management

Important commands:

```bash
kill
killall
pkill
nice
renice
jobs
bg
fg
```

Example:

```bash
kill 1234
```

---

# ⚡ Process Signals

Common signals:

| Signal | Number | Purpose |
|---|---:|---|
| SIGHUP | 1 | Hangup |
| SIGINT | 2 | Interrupt |
| SIGTERM | 15 | Graceful termination |
| SIGKILL | 9 | Force termination |
| SIGSTOP | 19 | Stop process |
| SIGCONT | 18 | Continue process |

Prefer:

```bash
kill -15 PID
```

before:

```bash
kill -9 PID
```

`SIGTERM` allows a process to shut down gracefully.

---

# ⚙️ systemctl

`systemctl` is used to manage systemd units and services.

Common commands:

```bash
systemctl status ssh
systemctl start ssh
systemctl stop ssh
systemctl restart ssh
systemctl enable ssh
systemctl disable ssh
```

The service name can differ between distributions.

For example:

```bash
ssh
```

or:

```bash
sshd
```

---

# 📝 View Logs

Linux systems using systemd commonly use `journald`.

View logs:

```bash
journalctl
```

Service logs:

```bash
journalctl -u ssh
```

Recent logs:

```bash
journalctl -u ssh --since "1 hour ago"
```

Follow logs:

```bash
journalctl -u ssh -f
```

---

# ⏰ Cron Jobs

Cron is used to schedule recurring tasks.

Examples:

```text
Every minute
Every hour
Every day
Every week
Every month
```

Edit your cron jobs:

```bash
crontab -e
```

List them:

```bash
crontab -l
```

Example:

```cron
0 2 * * * /home/user/backup.sh
```

This runs the script every day at 2:00 AM.

---

# ☁️ AWS Connection

These concepts are extremely important for AWS Cloud Engineers.

On an EC2 instance, you may need to troubleshoot:

```text
High CPU
High memory
Application crash
Web server stopped
SSH service failure
Disk monitoring
Background jobs
Scheduled backups
```

For example:

```bash
top
```

can help identify high CPU processes.

```bash
systemctl status nginx
```

can help identify whether a web server is running.

```bash
journalctl -u nginx
```

can help investigate service errors.

---

# 🧪 Full Practice Lab

Create a Linux VM or AWS EC2 instance.

Practice:

### Step 1 — Identify your user

```bash
whoami
```

### Step 2 — Check PID 1

```bash
ps -p 1 -f
```

### Step 3 — List processes

```bash
ps aux
```

### Step 4 — Monitor processes

```bash
top
```

### Step 5 — Find your shell

```bash
echo $$
```

### Step 6 — Check services

```bash
systemctl --type=service
```

### Step 7 — Check failed services

```bash
systemctl --failed
```

### Step 8 — Check boot time

```bash
systemd-analyze
```

### Step 9 — View system logs

```bash
journalctl -b
```

### Step 10 — Create a cron job

```bash
crontab -e
```

---

# 🚀 Mini Project

## Linux Server Health Monitor

Create a shell script that reports:

- Hostname
- Current date/time
- CPU usage
- Memory usage
- Disk usage
- Running processes
- Failed services
- System uptime

Example output:

```text
================================
 Linux Server Health Report
================================

Hostname:
server01

Uptime:
5 days

CPU Usage:
32%

Memory Usage:
48%

Disk Usage:
/dev/xvda1  61%

Failed Services:
0

================================
```

This project can later be connected to:

```text
AWS EC2
CloudWatch
SNS
Shell Scripting
Cron
```

---

# 🎯 Interview Questions

1. What is a process?
2. What is PID?
3. What is PPID?
4. What is PID 1?
5. What is the difference between a process and a service?
6. What is `systemd`?
7. What is `systemctl`?
8. What is the difference between `kill -15` and `kill -9`?
9. What is a zombie process?
10. What is an orphan process?
11. How do you find a process consuming high CPU?
12. How do you find a process consuming high memory?
13. How do you restart a service?
14. How do you check service logs?
15. What is cron?
16. How do you schedule a cron job?
17. How do you troubleshoot a failed Linux service?

---

# ✅ Section Checklist

- [ ] Understand Linux processes
- [ ] Understand PID and PPID
- [ ] Understand process states
- [ ] Use `ps`
- [ ] Use `top`
- [ ] Use `htop`
- [ ] Understand foreground/background processes
- [ ] Use `kill`
- [ ] Understand Linux signals
- [ ] Understand process priority
- [ ] Understand zombie/orphan processes
- [ ] Understand systemd
- [ ] Use `systemctl`
- [ ] Use `journalctl`
- [ ] Manage Linux services
- [ ] Create cron jobs
- [ ] Troubleshoot services
- [ ] Complete the Linux Server Health Monitor project

---

# 🔜 Next Section

After completing this section, continue with:

```text
06-Storage-and-Disks/
```

You will learn:

```text
Disks
Partitions
Filesystems
Mounting
LVM
/etc/fstab
```

These skills are especially important when managing **EBS volumes on AWS EC2**.