# 🔧 Linux Services

A Linux service is a program or background process designed to provide a function continuously or on demand.

Examples include:

```text
SSH
Nginx
Apache
DNS
Database
Docker
Cron
Monitoring agents
```

Services are commonly managed through `systemd` on modern Linux systems.

---

# 🎯 Learning Objectives

You will learn:

- What a Linux service is
- Service lifecycle
- Start and stop services
- Restart services
- Enable and disable services
- Check service status
- Service logs
- Failed services
- Service troubleshooting
- Basic service administration
- AWS EC2 service troubleshooting

---

# 🧠 What Is a Service?

A service is usually a long-running background program that provides functionality to the system or other applications.

Example:

```text
Client
   ↓
Network
   ↓
Nginx Service
   ↓
Web Application
```

---

# ⚙️ Service Lifecycle

A service can generally be:

```text
Stopped
   ↓
Started
   ↓
Running
   ↓
Restarted
   ↓
Stopped
```

A service can also be configured to start automatically during boot.

---

# 🔍 Check Service Status

Use:

```bash
systemctl status SERVICE
```

Example:

```bash
systemctl status nginx
```

Important information:

```text
Loaded
Active
Main PID
Memory
CPU
Logs
```

---

# ▶️ Start a Service

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

A restart stops and starts the service again.

---

# 🔃 Reload Configuration

Some services support:

```bash
sudo systemctl reload nginx
```

Reloading can apply configuration changes without a full service restart.

---

# 🔁 Enable Service at Boot

```bash
sudo systemctl enable nginx
```

Check:

```bash
systemctl is-enabled nginx
```

---

# ▶️ Enable and Start

```bash
sudo systemctl enable --now nginx
```

This:

```text
Enables service
+
Starts service immediately
```

---

# 🚫 Disable Service

```bash
sudo systemctl disable nginx
```

Disable and stop:

```bash
sudo systemctl disable --now nginx
```
---

# ❌ Failed Services

Check:

```bash
systemctl --failed
```

Then:

```bash
systemctl status SERVICE
```

Check logs:

```bash
journalctl -u SERVICE
```

---

# 📜 Service Logs

View:

```bash
journalctl -u nginx
```

Recent:

```bash
journalctl -u nginx --since "30 minutes ago"
```

Current boot:

```bash
journalctl -u nginx -b
```

Follow:

```bash
journalctl -u nginx -f
```
---

# 🔍 Check Listening Port

Use:

```bash
sudo ss -tulpn
```

For HTTP:

```bash
sudo ss -lntp | grep :80
```

For HTTPS:

```bash
sudo ss -lntp | grep :443
```

---

# 🧪 Service Troubleshooting Workflow

Suppose a website is not working.

Follow:

```text
1. Check service
       ↓
2. Check process
       ↓
3. Check listening port
       ↓
4. Check logs
       ↓
5. Check configuration
       ↓
6. Check firewall
       ↓
7. Test locally
       ↓
8. Test remotely
```

Commands:

```bash
systemctl status nginx
```

```bash
ps aux | grep nginx
```

```bash
sudo ss -lntp
```

```bash
journalctl -u nginx -b
```

Test locally:

```bash
curl http://localhost
```
