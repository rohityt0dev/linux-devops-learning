# ⏰ Linux Cron Jobs

Cron is a Linux scheduling system used to execute commands or scripts automatically at specified times.

Cron is commonly used for:

```text
Backups
Log cleanup
Monitoring
Report generation
Database maintenance
File synchronization
Temporary file cleanup
Health checks
```

For Cloud Engineers and DevOps engineers, cron is an important Linux automation skill.

---

# 🎯 Learning Objectives

You will learn:

- What cron is
- How cron works
- `crond` / cron service
- Crontab
- Cron syntax
- `crontab -e`
- `crontab -l`
- `crontab -r`
- System-wide cron
- Cron environment
- Logging
- Cron troubleshooting
- Automated backup lab

---

# 🧠 What Is Cron?

Cron is a time-based job scheduler.

Example:

```text
Every day at 2:00 AM
        ↓
Run backup script
```

Another example:

```text
Every 5 minutes
        ↓
Run health-check script
```

---

# ⚙️ Cron Service

Depending on the Linux distribution, the service may be named:

```text
cron
```

or:

```text
crond
```

Check:

```bash
systemctl status cron
```

On systems using `crond`:

```bash
systemctl status crond
```

Find the service:

```bash
systemctl list-units --type=service | grep -E 'cron|crond'
```

---

# 📋 Crontab

A crontab contains scheduled jobs.

List your cron jobs:

```bash
crontab -l
```

Edit:

```bash
crontab -e
```

Remove your user's crontab:

```bash
crontab -r
```

⚠️ Be careful with:

```bash
crontab -r
```

It removes the current user's crontab.

---

# 🧩 Cron Syntax

A standard cron entry contains:

```text
MINUTE HOUR DAY_OF_MONTH MONTH DAY_OF_WEEK COMMAND
```

Structure:

```text
* * * * * command
│ │ │ │ │
│ │ │ │ └── Day of week
│ │ │ └──── Month
│ │ └────── Day of month
│ └──────── Hour
└────────── Minute
```

---

# 📅 Cron Fields

| Field | Allowed values |
|---|---|
| Minute | 0–59 |
| Hour | 0–23 |
| Day of month | 1–31 |
| Month | 1–12 |
| Day of week | 0–7 |

Usually:

```text
0 = Sunday
7 = Sunday
```

---

# ⭐ Common Cron Examples

## Every minute

```cron
* * * * * command
```

---

## Every 5 minutes

```cron
*/5 * * * * command
```

---

## Every hour

```cron
0 * * * * command
```

---

## Every day at midnight

```cron
0 0 * * * command
```

---

## Every day at 2 AM

```cron
0 2 * * * command
```

---

## Every Sunday at 3 AM

```cron
0 3 * * 0 command
```

---

## Every Monday at 9 AM

```cron
0 9 * * 1 command
```

---

## First day of every month

```cron
0 0 1 * * command
```

---

# 🧪 Lab 1 — Simple Cron Job

Create a script:

```bash
nano ~/cron-test.sh
```

Add:

```bash
#!/bin/bash

echo "Cron executed at $(date)" >> "$HOME/cron-test.log"
```

Make executable:

```bash
chmod +x ~/cron-test.sh
```

Test manually:

```bash
~/cron-test.sh
```

Check:

```bash
cat ~/cron-test.log
```

---

# ⏰ Add Cron Job

Edit:

```bash
crontab -e
```

Add:

```cron
*/5 * * * * /home/YOUR_USERNAME/cron-test.sh
```

Replace:

```text
YOUR_USERNAME
```

with your actual Linux username.

Wait a few minutes.

Check:

```bash
cat ~/cron-test.log
```

---

# 🔐 Use Absolute Paths

Cron has a limited environment compared with an interactive shell.

Prefer:

```cron
*/5 * * * * /home/user/scripts/backup.sh
```

instead of:

```cron
*/5 * * * * backup.sh
```

Use full paths for:

```text
Scripts
Commands
Files
Directories
```

---

# 📝 Redirect Output

You can save output:

```cron
0 2 * * * /home/user/backup.sh >> /home/user/backup.log 2>&1
```

Explanation:

```text
>> backup.log
```

appends standard output.

```text
2>&1
```

redirects standard error to the same destination.

---

# 🔕 Suppress Output

If you intentionally do not want output:

```cron
0 2 * * * /home/user/backup.sh >/dev/null 2>&1
```

---

# 👤 User Cron vs Root Cron

Regular user:

```bash
crontab -e
```

Root's crontab:

```bash
sudo crontab -e
```

They are separate.

A root cron job has elevated privileges, so use it only when required.

---

# 📁 System Cron Locations

Common locations:

```text
/etc/crontab
/etc/cron.d/
/etc/cron.hourly/
/etc/cron.daily/
/etc/cron.weekly/
/etc/cron.monthly/
```

View:

```bash
cat /etc/crontab
```

---

# 🔍 Check Cron Logs

Logging differs by distribution.

On systems using traditional syslog, you may find cron messages in:

```bash
/var/log/cron
```

or:

```bash
/var/log/syslog
```

Search:

```bash
grep CRON /var/log/syslog
```

On systems using journald:

```bash
journalctl -u cron
```

or:

```bash
journalctl -u crond
```

---

# 🛠️ Cron Troubleshooting

If a cron job does not run, check:

### 1. Is cron running?

```bash
systemctl status cron
```

or:

```bash
systemctl status crond
```

### 2. Is the cron entry correct?

```bash
crontab -l
```

### 3. Is the script executable?

```bash
ls -l script.sh
```

### 4. Does the script work manually?

```bash
/home/user/script.sh
```

### 5. Are absolute paths used?

Check:

```cron
*/5 * * * * /home/user/script.sh
```

### 6. Check logs

```bash
journalctl -u cron
```

or:

```bash
journalctl -u crond
```

---

# 🧪 Lab 2 — Automated Backup

Create a backup directory:

```bash
mkdir -p ~/backup
```

Create test data:

```bash
mkdir -p ~/important-data
echo "Important file" > ~/important-data/file.txt
```

Create script:

```bash
nano ~/backup.sh
```

Add:

```bash
#!/bin/bash

SOURCE="$HOME/important-data"
DEST="$HOME/backup"

mkdir -p "$DEST"

tar -czf "$DEST/backup-$(date +%Y-%m-%d-%H%M%S).tar.gz" "$SOURCE"
```

Make executable:

```bash
chmod +x ~/backup.sh
```

Test:

```bash
~/backup.sh
```

Check:

```bash
ls -lh ~/backup
```

---

# ⏰ Schedule Backup

Edit:

```bash
crontab -e
```

Example:

```cron
0 2 * * * /home/YOUR_USERNAME/backup.sh
```

This schedules the backup every day at:

```text
02:00 AM
```

---

# 🧪 Lab 3 — Server Health Check

Create:

```bash
nano ~/server-health.sh
```

Add:

```bash
#!/bin/bash

LOG="$HOME/server-health.log"

echo "================================" >> "$LOG"
echo "Health Check: $(date)" >> "$LOG"
echo "Hostname: $(hostname)" >> "$LOG"
echo "Uptime: $(uptime -p)" >> "$LOG"
echo "Memory:" >> "$LOG"
free -h >> "$LOG"
echo "Disk:" >> "$LOG"
df -h / >> "$LOG"
echo "================================" >> "$LOG"
```

Make executable:

```bash
chmod +x ~/server-health.sh
```

Test:

```bash
~/server-health.sh
```

Schedule every hour:

```cron
0 * * * * /home/YOUR_USERNAME/server-health.sh
```

---

# 🧠 Cron Environment

Cron does not necessarily have the same environment as your interactive shell.

Check your shell environment:

```bash
env
```

Important differences may include:

```text
PATH
HOME
SHELL
Working directory
Environment variables
```

For reliable scripts:

- Use absolute paths
- Set required variables explicitly
- Use absolute file locations
- Redirect logs
- Test scripts manually first

---

# 🕒 `anacron`

`anacron` is useful for jobs that should run periodically but do not necessarily need an exact clock time.

It can be useful on systems that may be powered off during the scheduled time.

Conceptually:

```text
cron
→ exact time scheduling

anacron
→ periodic jobs where missed execution can be handled later
```

Check if installed:

```bash
command -v anacron
```

---

# 🆚 Cron vs systemd Timers

Modern Linux systems may also use **systemd timers**.

| Cron | systemd Timer |
|---|---|
| Traditional scheduler | systemd-based |
| Simple syntax | Unit-based |
| Very widely used | Strong systemd integration |
| Good for simple schedules | Useful for service-oriented systems |

For this section, focus on cron first.

You can learn systemd timers later as an advanced topic.

---

# 🧪 Mini Project — Automated Server Backup

Build this workflow:

```text
Linux EC2
   ↓
Important Data
   ↓
Backup Script
   ↓
Tar/Gzip Archive
   ↓
Cron
   ↓
Scheduled Backup
   ↓
Backup Log
```

Requirements:

- Create backup script
- Compress data
- Add timestamp
- Store backups
- Schedule with cron
- Log execution
- Test recovery

Example:

```bash
tar -tzf backup-file.tar.gz
```

Extract:

```bash
tar -xzf backup-file.tar.gz
```

---

# ☁️ AWS Connection

Cron can be used on EC2 for:

```text
Local backups
Log cleanup
Health checks
Temporary file cleanup
Application maintenance
Scheduled scripts
```

Example:

```text
EC2
 ↓
Cron
 ↓
Backup Script
 ↓
Create Archive
 ↓
Upload to S3
```

A production architecture may use managed AWS services instead of relying entirely on cron, but understanding cron remains valuable for Linux administration and troubleshooting.

---

# 🎯 Interview Questions

### 1. What is cron?

Cron is a time-based job scheduling system in Linux.

### 2. What is crontab?

A crontab contains scheduled commands for a user.

### 3. How do you edit your cron jobs?

```bash
crontab -e
```

### 4. How do you list cron jobs?

```bash
crontab -l
```

### 5. How do you remove a crontab?

```bash
crontab -r
```

### 6. Explain cron syntax.

```text
MINUTE HOUR DAY MONTH WEEKDAY COMMAND
```

### 7. How do you schedule a job every 5 minutes?

```cron
*/5 * * * * command
```

### 8. How do you run a command every day at 2 AM?

```cron
0 2 * * * command
```

### 9. Why should you use absolute paths in cron?

Cron may run with a different environment and `PATH` than your interactive shell.

### 10. How do you troubleshoot a cron job?

Check:

```text
crontab
cron service
script permissions
absolute paths
environment variables
logs
manual execution
```

---

# 🧠 Cron Quick Reference

| Requirement | Cron |
|---|---|
| Every minute | `* * * * *` |
| Every 5 minutes | `*/5 * * * *` |
| Every hour | `0 * * * *` |
| Every day midnight | `0 0 * * *` |
| Every day 2 AM | `0 2 * * *` |
| Every Sunday 3 AM | `0 3 * * 0` |
| Every Monday 9 AM | `0 9 * * 1` |
| First day of month | `0 0 1 * *` |

---

# 🚨 Common Mistakes

### Mistake 1 — Relative path

Bad:

```cron
0 2 * * * backup.sh
```

Better:

```cron
0 2 * * * /home/user/backup.sh
```

### Mistake 2 — Script not executable

Check:

```bash
ls -l backup.sh
```

Fix:

```bash
chmod +x backup.sh
```

### Mistake 3 — Script works manually but not through cron

Check:

```text
PATH
HOME
environment variables
permissions
working directory
absolute paths
```

### Mistake 4 — No logging

Add:

```cron
0 2 * * * /home/user/backup.sh >> /home/user/backup.log 2>&1
```

---

# ☁️ AWS Interview Scenario

**Question:**

> You have a Linux EC2 instance and a backup script works manually but does not run through cron. How would you troubleshoot it?

### Interview-ready answer:

I would first verify that the cron service is running and that the user's crontab contains the expected entry.

Then I would manually execute the script using the same user and check the script's permissions.

I would use absolute paths for the script and commands because cron may have a different environment and `PATH`.

Next, I would redirect standard output and errors to a log file and inspect the cron or system logs.

Finally, I would verify file permissions, environment variables, disk space, and whether the script depends on an interactive shell.

---

# ✅ Checklist

- [ ] Understand cron
- [ ] Understand crontab
- [ ] Use `crontab -e`
- [ ] Use `crontab -l`
- [ ] Understand cron syntax
- [ ] Schedule every minute
- [ ] Schedule every 5 minutes
- [ ] Schedule daily jobs
- [ ] Schedule weekly jobs
- [ ] Use absolute paths
- [ ] Redirect cron output
- [ ] Check cron logs
- [ ] Troubleshoot cron jobs
- [ ] Understand user vs root crontab
- [ ] Understand `/etc/crontab`
- [ ] Understand `/etc/cron.*`
- [ ] Complete automated backup project
- [ ] Understand cron vs systemd timers

---

# 🎉 Section Complete

You have now covered:

```text
Processes
     ↓
Process Management
     ↓
systemd
     ↓
Services
     ↓
Cron Jobs
```

These skills are important for:

```text
Linux Administration
AWS EC2
Cloud Engineering
DevOps
SRE
System Troubleshooting
Automation
```

---

# 🔜 Next Section

Continue with:

```text
06-Storage-and-Disks/
```

Topics:

```text
Disk Management
Partitions
Filesystems
Mounting
LVM
/etc/fstab
```

These concepts will connect directly to **AWS EBS volume management on EC2**.