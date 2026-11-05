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
