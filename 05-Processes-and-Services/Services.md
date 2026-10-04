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

# 🛑 Mask a Service

Masking prevents normal manual or dependency-based startup.

```bash
sudo systemctl mask SERVICE
```

Unmask:

```bash
sudo systemctl unmask SERVICE
```

Use this carefully.

---

# 📋 List Running Services

```bash
systemctl list-units --type=service
```

Running services:

```bash
systemctl list-units --type=service --state=running
```

Failed services:

```bash
systemctl list-units --type=service --state=failed
```

---

# 📦 List Installed Service Units

```bash
systemctl list-unit-files --type=service
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

# 🌐 Web Server Example

Install Nginx on Ubuntu:

```bash
sudo apt update
sudo apt install nginx
```

Start:

```bash
sudo systemctl start nginx
```

Enable:

```bash
sudo systemctl enable nginx
```

Check:

```bash
systemctl status nginx
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

---

# 🧪 Lab — Web Service Management

Install Nginx:

```bash
sudo apt update
sudo apt install nginx
```

Check:

```bash
systemctl status nginx
```

Stop:

```bash
sudo systemctl stop nginx
```

Confirm:

```bash
curl http://localhost
```

Start:

```bash
sudo systemctl start nginx
```

Test:

```bash
curl http://localhost
```

Enable:

```bash
sudo systemctl enable nginx
```

---

# 🧪 Lab — Service Failure Investigation

Stop Nginx:

```bash
sudo systemctl stop nginx
```

Check:

```bash
systemctl status nginx
```

Start again:

```bash
sudo systemctl start nginx
```

Check:

```bash
systemctl status nginx
```

View logs:

```bash
journalctl -u nginx --since "10 minutes ago"
```

---

# 🧪 Lab — Create a Simple systemd Service

Create an application script:

```bash
sudo nano /usr/local/bin/hello-service.sh
```

Add:

```bash
#!/bin/bash

while true
do
    echo "Hello from Linux service"
    sleep 30
done
```

Make executable:

```bash
sudo chmod +x /usr/local/bin/hello-service.sh
```

Create unit:

```bash
sudo nano /etc/systemd/system/hello-service.service
```

Add:

```ini
[Unit]
Description=Hello Linux Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/hello-service.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Reload systemd:

```bash
sudo systemctl daemon-reload
```

Start:

```bash
sudo systemctl start hello-service
```

Check:

```bash
systemctl status hello-service
```

Enable at boot:

```bash
sudo systemctl enable hello-service
```

View logs:

```bash
journalctl -u hello-service
```

Stop:

```bash
sudo systemctl stop hello-service
```

---

# ☁️ AWS EC2 Connection

On an AWS EC2 web server, you may have:

```text
Internet
   ↓
Security Group
   ↓
EC2
   ↓
Nginx
   ↓
Application
```

If the website is unavailable:

```bash
systemctl status nginx
```

Then:

```bash
journalctl -u nginx
```

Then:

```bash
sudo ss -lntp
```

Then:

```bash
curl http://localhost
```

You should also check the EC2 Security Group and network configuration.

---

# 🎯 Interview Questions

### 1. What is a Linux service?

A background application or process that provides a system or application function.

### 2. How do you start a service?

```bash
sudo systemctl start SERVICE
```

### 3. How do you stop a service?

```bash
sudo systemctl stop SERVICE
```

### 4. How do you restart a service?

```bash
sudo systemctl restart SERVICE
```

### 5. How do you enable a service at boot?

```bash
sudo systemctl enable SERVICE
```

### 6. How do you check service status?

```bash
systemctl status SERVICE
```

### 7. How do you check service logs?

```bash
journalctl -u SERVICE
```

### 8. How do you find failed services?

```bash
systemctl --failed
```

### 9. How do you check whether a service is listening on a port?

```bash
sudo ss -lntp
```

### 10. A web server is running but the website is unavailable. What do you check?

A good troubleshooting sequence is:

```text
Service status
Process
Listening port
Application logs
Local curl test
Firewall
Cloud Security Group
Network routing
DNS
```

---

# ✅ Checklist

- [ ] Understand Linux services
- [ ] Start services
- [ ] Stop services
- [ ] Restart services
- [ ] Reload services
- [ ] Enable services
- [ ] Disable services
- [ ] Mask/unmask services
- [ ] Check service status
- [ ] List running services
- [ ] Find failed services
- [ ] Read service logs
- [ ] Check listening ports
- [ ] Troubleshoot Nginx
- [ ] Create a custom systemd service
- [ ] Understand EC2 service troubleshooting

---

# 🔜 Next

Continue with:

```text
Cron-Jobs.md
```

You will learn how to automate recurring Linux tasks.