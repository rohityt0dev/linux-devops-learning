# ⚙️ Linux systemd

`systemd` is a system and service manager used by many modern Linux distributions.

It is responsible for starting and managing important system components and services.

---

# 🎯 Learning Objectives

You will learn:

- What systemd is
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
systemctl --version
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

# 📄 View Unit Configuration

```bash
systemctl cat nginx
```

Show detailed properties:

```bash
systemctl show nginx
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
