# ⚙️ Linux systemd

`systemd` is a system and service manager used by many modern Linux distributions.

It is responsible for starting and managing important system components and services.

---

# 🎯 Learning Objectives

You will learn:

- What systemd is
- PID 1
- Units
- Services
- Targets
- Dependencies
- `systemctl`
- `journalctl`
- Service startup
- Service enablement
- Failed units
- Boot analysis
- Basic systemd troubleshooting

---

# 🧠 What Is systemd?

`systemd` is commonly the first userspace process started by the Linux kernel.

On a system using systemd:

```text
PID 1 = systemd
```

Check:

```bash
ps -p 1 -f
```

Example:

```text
UID   PID  PPID  CMD
root    1     0  /sbin/init
```

Check:

```bash
systemctl --version
```

---

# 🏗️ Linux Boot and systemd

A simplified boot process:

```text
BIOS / UEFI
     ↓
Bootloader
     ↓
Linux Kernel
     ↓
initramfs
     ↓
systemd (PID 1)
     ↓
Targets
     ↓
Services
     ↓
Login
```

---

# 📦 systemd Units

systemd manages different types of units.

Common unit types:

| Unit | Purpose |
|---|---|
| `.service` | System service |
| `.socket` | Socket |
| `.target` | Group of units |
| `.mount` | Mount point |
| `.timer` | Scheduled task |
| `.path` | Path-based activation |
| `.device` | Device |
| `.automount` | Automount |

List units:

```bash
systemctl list-units
```

---

# 🔧 Service Units

List services:

```bash
systemctl list-units --type=service
```

List all installed service unit files:

```bash
systemctl list-unit-files --type=service
```

---

# 🎯 Targets

Targets represent groups or system states.

Check default target:

```bash
systemctl get-default
```

Common target:

```text
multi-user.target
```

Graphical systems may use:

```text
graphical.target
```

List targets:

```bash
systemctl list-units --type=target
```

---

# ▶️ Start a Service

Example:

```bash
sudo systemctl start nginx
```

Check:

```bash
systemctl status nginx
```

---

# ⏹️ Stop a Service

```bash
sudo systemctl stop nginx
```

---

# 🔄 Restart a Service

```bash
sudo systemctl restart nginx
```

---

# 🔃 Reload a Service

Some applications can reload configuration without fully restarting.

```bash
sudo systemctl reload nginx
```

Not every service supports reload.

---

# 🔍 Check Service Status

```bash
systemctl status nginx
```

Typical information:

```text
Loaded
Active
Main PID
Tasks
Memory
CPU
Logs
```

---

# 🔁 Enable a Service

Enable at boot:

```bash
sudo systemctl enable nginx
```

Enable and start immediately:

```bash
sudo systemctl enable --now nginx
```

---

# 🚫 Disable a Service

Prevent automatic startup:

```bash
sudo systemctl disable nginx
```

Disable and stop:

```bash
sudo systemctl disable --now nginx
```

---

# 🚫 Mask a Service

Mask prevents a service from being started normally.

```bash
sudo systemctl mask SERVICE
```

Unmask:

```bash
sudo systemctl unmask SERVICE
```

Use carefully because masking can intentionally prevent required services from starting.

---

# 🔍 Check Failed Units

```bash
systemctl --failed
```

For failed services:

```bash
systemctl --failed --type=service
```

---

# 📜 journalctl

`journalctl` reads logs collected by systemd-journald.

View all logs:

```bash
journalctl
```

Current boot:

```bash
journalctl -b
```

Previous boot:

```bash
journalctl -b -1
```

List boots:

```bash
journalctl --list-boots
```

---

# 📌 Service Logs

Example:

```bash
journalctl -u nginx
```

Current boot:

```bash
journalctl -u nginx -b
```

Recent logs:

```bash
journalctl -u nginx --since "1 hour ago"
```

Follow logs:

```bash
journalctl -u nginx -f
```

---

# 🧩 Service Dependencies

View dependencies:

```bash
systemctl list-dependencies nginx
```

Reverse dependencies:

```bash
systemctl list-dependencies --reverse nginx
```

---

# 📄 View Unit Configuration

```bash
systemctl cat nginx
```

Show the unit file path:

```bash
systemctl show -p FragmentPath nginx
```

Show detailed properties:

```bash
systemctl show nginx
```

---

# 🧠 systemd Unit File

A simplified service unit can look like:

```ini
[Unit]
Description=My Application
After=network.target

[Service]
ExecStart=/usr/local/bin/myapp
Restart=on-failure
User=myuser

[Install]
WantedBy=multi-user.target
```

Sections:

```text
[Unit]
[Service]
[Install]
```

---

# 📚 Important Unit Directories

Common locations include:

```text
/etc/systemd/system/
/usr/lib/systemd/system/
/lib/systemd/system/
```

Distribution-specific locations can differ.

Local administrator-created unit files are commonly placed under:

```text
/etc/systemd/system/
```

---

# 🔄 daemon-reload

If you create or modify a unit file:

```bash
sudo systemctl daemon-reload
```

Then start it:

```bash
sudo systemctl start myapp
```

Enable:

```bash
sudo systemctl enable myapp
```

---

# ⏱️ systemd-analyze

Check boot time:

```bash
systemd-analyze
```

Example:

```text
Startup finished in 4.2s
```

Find slow units:

```bash
systemd-analyze blame
```

View critical chain:

```bash
systemd-analyze critical-chain
```

---

# 🧪 Lab — Manage a Web Service

On a test VM, install a web server.

For Ubuntu:

```bash
sudo apt update
sudo apt install nginx
```

Check:

```bash
systemctl status nginx
```

Start:

```bash
sudo systemctl start nginx
```

Enable at boot:

```bash
sudo systemctl enable nginx
```

Check:

```bash
systemctl is-enabled nginx
```

Stop:

```bash
sudo systemctl stop nginx
```

Restart:

```bash
sudo systemctl restart nginx
```

View logs:

```bash
journalctl -u nginx
```

---

# 🧪 Lab — Investigate a Failed Service

Check:

```bash
systemctl --failed
```

Then:

```bash
systemctl status SERVICE
```

View logs:

```bash
journalctl -u SERVICE -b
```

Check configuration if applicable.

Then attempt recovery:

```bash
sudo systemctl restart SERVICE
```

Verify:

```bash
systemctl status SERVICE
```

---

# ☁️ AWS Connection

On an EC2 Linux server, services often include:

```text
SSH
Nginx
Apache
Docker
Application servers
Monitoring agents
```

For example:

```bash
systemctl status nginx
```

If the website is unavailable:

```text
Browser
   ↓
EC2
   ↓
Nginx
   ↓
systemctl status nginx
   ↓
journalctl -u nginx
```

This is a common Cloud Engineer troubleshooting workflow.

---

# 🎯 Interview Questions

### 1. What is systemd?

A system and service manager commonly used as PID 1 on modern Linux distributions.

### 2. What is PID 1?

The first userspace process started by the kernel; on systemd-based systems it is systemd.

### 3. What is systemctl?

A command-line tool for controlling systemd units.

### 4. How do you start a service?

```bash
sudo systemctl start SERVICE
```

### 5. How do you enable a service at boot?

```bash
sudo systemctl enable SERVICE
```

### 6. How do you check logs?

```bash
journalctl -u SERVICE
```

### 7. What does `daemon-reload` do?

It makes systemd reload unit-file configuration after unit files have been created or changed.

### 8. How do you find failed services?

```bash
systemctl --failed
```

### 9. How do you analyze boot performance?

```bash
systemd-analyze
systemd-analyze blame
```

### 10. What is the difference between start and enable?

```text
start  → start now
enable → configure automatic startup
```

---

# ✅ Checklist

- [ ] Understand systemd
- [ ] Understand PID 1
- [ ] Understand units
- [ ] Understand service units
- [ ] Understand targets
- [ ] Use `systemctl`
- [ ] Start services
- [ ] Stop services
- [ ] Restart services
- [ ] Enable services
- [ ] Disable services
- [ ] Mask/unmask services
- [ ] Use `journalctl`
- [ ] Check failed units
- [ ] Understand unit files
- [ ] Use `daemon-reload`
- [ ] Use `systemd-analyze`
- [ ] Complete the service troubleshooting lab

---

# 🔜 Next

Continue with:

```text
Services.md
```

Next you will focus specifically on Linux service administration and troubleshooting.