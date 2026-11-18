# 🚪 Linux Network Ports

Network ports allow multiple network applications to communicate using the same IP address.

For example:

```text
Server
192.168.1.10
│
├── :22   SSH
├── :80   HTTP
├── :443  HTTPS
└── :3306 MySQL
```

Understanding ports is essential for Linux firewall configuration and AWS Security Groups.

---

# 🎯 Learning Objectives

You will learn:

- Network ports
- TCP
- UDP
- Common ports
- Listening ports
- Source ports
- Destination ports
- `/etc/services`
- AWS Security Group ports

---

# 🧠 What Is a Port?

An IP address identifies a host/interface.

A port identifies a network service or endpoint on that host.

Example:

```text
192.168.1.10:22
```

means:

```text
IP   = 192.168.1.10
Port = 22
```

Typically:

```text
22 = SSH
```

---

# 🔢 Port Range

TCP and UDP port numbers range from:

```text
0 - 65535
```

Broad categories:

```text
0 - 1023       Well-known/System ports
1024 - 49151   Registered ports
49152 - 65535  Dynamic/Private ports
```

---

# 🔄 TCP

TCP stands for:

> Transmission Control Protocol

TCP is connection-oriented and provides reliable, ordered delivery.

Common TCP applications:

```text
SSH
HTTP
HTTPS
MySQL
PostgreSQL
```

---

# ⚡ UDP

UDP stands for:

> User Datagram Protocol

UDP is connectionless and has lower protocol overhead, but does not provide TCP's delivery guarantees.

Common uses include:

```text
DNS
DHCP
Streaming/real-time applications
```

DNS can use both UDP and TCP depending on the operation and response.

---

# 🆚 TCP vs UDP

| TCP | UDP |
|---|---|
| Connection-oriented | Connectionless |
| Reliable delivery | No delivery guarantee |
| Ordered data | No ordering guarantee |
| More protocol overhead | Lower protocol overhead |
| SSH, HTTP/S | DNS, DHCP, real-time traffic |

---

# 📚 Important Ports

| Port | Protocol/Service |
|---:|---|
| 20/21 | FTP |
| 22 | SSH |
| 23 | Telnet |
| 25 | SMTP |
| 53 | DNS |
| 67/68 | DHCP |
| 80 | HTTP |
| 110 | POP3 |
| 123 | NTP |
| 143 | IMAP |
| 443 | HTTPS |
| 3306 | MySQL |
| 5432 | PostgreSQL |
| 6379 | Redis |
| 8080 | Common alternative HTTP/app port |

Do not assume an application must always use its conventional port; services can be configured differently.

---

# 🔍 Check Listening Ports

```bash
sudo ss -tulpn
```

TCP:

```bash
sudo ss -ltnp
```

UDP:

```bash
sudo ss -lunp
```

---

# 🔍 Check Specific Port

SSH:

```bash
sudo ss -ltnp | grep :22
```

HTTP:

```bash
sudo ss -ltnp | grep :80
```

HTTPS:

```bash
sudo ss -ltnp | grep :443
```

---

# 🔍 Check Process Using Port

```bash
sudo lsof -i :80
```

Example:

```text
nginx ... TCP *:http (LISTEN)
```

---

# 🧪 Test Remote Port

Use Netcat:

```bash
nc -zv SERVER-IP 22
```

HTTP:

```bash
nc -zv SERVER-IP 80
```

HTTPS:

```bash
nc -zv SERVER-IP 443
```

---

# 🌐 Test HTTP Port

```bash
curl http://SERVER-IP
```

Port 8080:

```bash
curl http://SERVER-IP:8080
```

---

# 📁 `/etc/services`

Linux contains mappings between conventional service names and ports.

Check:

```bash
cat /etc/services
```

Search:

```bash
grep -w ssh /etc/services
```

Example:

```text
ssh 22/tcp
```

---

# 🔥 Firewall Concept

Even if an application is listening:

```text
Application
    ↓
Port 80
```

a firewall may block access:

```text
Client
 ↓
Firewall
 ✖
 ↓
Server :80
```

Therefore:

```text
Port listening ≠ Port externally reachable
```

---

# ☁️ AWS Security Groups

Security Groups control traffic to/from AWS resources such as EC2 network interfaces.

Example web server:

```text
Inbound

22/TCP  → Your IP
80/TCP  → 0.0.0.0/0
443/TCP → 0.0.0.0/0
```

Use the smallest required access range whenever possible.

---

# 🧠 Security Group vs Linux Port

For a website to work:

```text
Client
 ↓
Security Group allows 80
 ↓
Linux firewall allows 80
 ↓
Application listens on 80
 ↓
Website works
```

If any layer fails:

```text
Website unavailable
```
---

# 📍 Bind Address

An application can listen only on localhost:

```text
127.0.0.1:8080
```

Then remote clients cannot directly reach it.

Compare:

```text
127.0.0.1:8080
```

with:

```text
0.0.0.0:8080
```

`0.0.0.0` commonly means listening on all IPv4 interfaces.

Check:

```bash
sudo ss -ltnp
```

---
