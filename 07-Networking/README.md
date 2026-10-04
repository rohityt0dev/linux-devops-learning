# 🌐 Linux Networking

Linux networking is one of the most important skills for **Linux Administrators, AWS Cloud Engineers, DevOps Engineers, and SREs**.

Almost every cloud application depends on networking.

Understanding Linux networking will help you troubleshoot problems such as:

- EC2 instance cannot access the internet
- Unable to SSH into a server
- Website is not accessible
- DNS resolution is failing
- Application port is not reachable
- Private server cannot download packages
- Network interface is down
- Wrong IP address or subnet configuration
- Firewall blocking traffic

---

# 🎯 Learning Objectives

In this section, you will learn:

- IP addresses
- IPv4 and IPv6
- Public and private IP addresses
- Subnet masks
- CIDR notation
- Default gateways
- DNS
- SSH
- Linux network interfaces
- Network commands
- TCP and UDP
- Ports
- Listening services
- Routing tables
- Connectivity testing
- Linux network troubleshooting
- AWS networking concepts

---

# 📚 Topics

| File | Topic |
|---|---|
| [IP-Address.md](./IP-Address.md) | IP addressing, CIDR, subnet and gateway |
| [DNS.md](./DNS.md) | DNS and hostname resolution |
| [SSH.md](./SSH.md) | Secure remote Linux access |
| [Network-Commands.md](./Network-Commands.md) | Essential Linux networking commands |
| [Ports.md](./Ports.md) | TCP, UDP and network ports |
| [Troubleshooting.md](./Troubleshooting.md) | Network troubleshooting methodology |

---

# 🧠 Basic Networking Architecture

A simple network looks like:

```text
Client
   │
   ▼
Network Interface
   │
   ▼
IP Address
   │
   ▼
Default Gateway
   │
   ▼
Router
   │
   ▼
Internet
   │
   ▼
Server
```

For a web server:

```text
User
 ↓
DNS
 ↓
Server IP
 ↓
TCP Port 80/443
 ↓
Web Server
 ↓
Application
```

---

# 🖥️ Linux Network Interface

Check interfaces:

```bash
ip addr
```

Short version:

```bash
ip a
```

Example:

```text
2: eth0:
    inet 192.168.1.10/24
```

This means:

```text
Interface = eth0
IP        = 192.168.1.10
CIDR      = /24
```

---

# 🌐 Check IP Address

```bash
ip addr
```

IPv4 only:

```bash
ip -4 addr
```

Specific interface:

```bash
ip addr show eth0
```

---

# 🛣️ Check Routing Table

```bash
ip route
```

Example:

```text
default via 192.168.1.1 dev eth0
192.168.1.0/24 dev eth0
```

The default route determines where traffic goes when there is no more specific route.

---

# 🚪 Default Gateway

Example:

```text
Server
192.168.1.10
      │
      ▼
Gateway
192.168.1.1
      │
      ▼
Internet
```

Check:

```bash
ip route
```

---

# 📖 DNS

DNS converts names into IP addresses.

Example:

```text
example.com
      ↓
DNS
      ↓
93.x.x.x
```

Test:

```bash
nslookup example.com
```

or:

```bash
dig example.com
```

---

# 🔐 SSH

SSH provides secure remote access to Linux servers.

Example:

```bash
ssh username@server-ip
```

AWS example:

```bash
ssh -i key.pem ec2-user@SERVER-IP
```

or on Ubuntu:

```bash
ssh -i key.pem ubuntu@SERVER-IP
```

---

# 🚪 Network Ports

Applications listen on ports.

Examples:

| Service | Port |
|---|---:|
| SSH | 22 |
| HTTP | 80 |
| HTTPS | 443 |
| DNS | 53 |
| MySQL | 3306 |
| PostgreSQL | 5432 |

Check listening ports:

```bash
ss -tulpn
```

---

# 🧪 Basic Networking Lab

Run:

```bash
ip addr
```

Then:

```bash
ip route
```

Check DNS:

```bash
cat /etc/resolv.conf
```

Test localhost:

```bash
ping -c 4 127.0.0.1
```

Test your gateway:

```bash
ping -c 4 <gateway-ip>
```

Test internet IP connectivity:

```bash
ping -c 4 8.8.8.8
```

Test DNS:

```bash
ping -c 4 google.com
```

Check ports:

```bash
ss -tulpn
```

---

# 🧠 Network Troubleshooting Flow

Use this order:

```text
Application Problem
       ↓
Is interface UP?
       ↓
Does server have IP?
       ↓
Is subnet correct?
       ↓
Is gateway configured?
       ↓
Does routing work?
       ↓
Can destination IP be reached?
       ↓
Does DNS work?
       ↓
Is port listening?
       ↓
Is firewall allowing traffic?
       ↓
Check application/service
```

---

# ☁️ AWS Networking Connection

Linux networking concepts map directly to AWS.

```text
Linux                       AWS

IP Address            →     EC2 Private IP
Public IP             →     EC2 Public IP
Subnet                →     VPC Subnet
Gateway               →     Internet Gateway / NAT
Routing Table         →     VPC Route Table
Firewall              →     Security Group / NACL
DNS                   →     Route 53 / VPC DNS
Network Interface     →     ENI
SSH                   →     EC2 Remote Access
Ports                 →     Security Group Rules
```

---

# ☁️ AWS Public EC2 Flow

```text
Internet
   │
   ▼
Internet Gateway
   │
   ▼
VPC Route Table
   │
   ▼
Public Subnet
   │
   ▼
Security Group
   │
   ▼
EC2
   │
   ▼
Linux Network Stack
   │
   ▼
Application
```

---

# ☁️ AWS Private EC2 Internet Flow

A common architecture:

```text
Private EC2
    │
    ▼
Private Route Table
    │
    ▼
NAT Gateway
    │
    ▼
Internet Gateway
    │
    ▼
Internet
```

The NAT Gateway normally resides in a public subnet.

---

# 🧪 AWS Networking Lab

Launch an EC2 instance and investigate:

```bash
ip addr
```

Check routes:

```bash
ip route
```

Check DNS:

```bash
cat /etc/resolv.conf
```

Check hostname:

```bash
hostname
```

Check listening ports:

```bash
sudo ss -tulpn
```

Test outbound internet:

```bash
curl -I https://example.com
```

Then compare Linux configuration with:

```text
VPC
Subnet
Route Table
Internet Gateway
Security Group
Network ACL
Public IP
Private IP
```

---

# 🎯 Important Interview Scenario

## EC2 is running but SSH is not working.

Check:

```text
1. EC2 instance state
2. Correct public/private IP
3. Security Group port 22
4. Source IP allowed
5. Route table
6. Internet Gateway
7. Public IP/EIP
8. NACL
9. Linux firewall
10. SSH service
11. sshd listening on port 22
12. Correct username
13. Correct SSH key
14. File permissions on private key
```

Linux checks:

```bash
sudo systemctl status ssh
```

or:

```bash
sudo systemctl status sshd
```

Check:

```bash
sudo ss -tlnp | grep :22
```

---

# 🛠️ Essential Commands

```bash
ip addr
ip route
ip link
ping
traceroute
tracepath
ss
dig
nslookup
hostname
hostnamectl
curl
wget
nc
arp
ip neigh
```

Some tools may need to be installed depending on the Linux distribution.

---

# 🎯 Interview Questions

1. What is an IP address?
2. What is IPv4?
3. What is IPv6?
4. What is a private IP?
5. What is a public IP?
6. What is CIDR?
7. What does `/24` mean?
8. What is a subnet?
9. What is a default gateway?
10. What is DNS?
11. What is SSH?
12. What port does SSH use?
13. What is TCP?
14. What is UDP?
15. What is a network port?
16. What is `ip addr`?
17. What is `ip route`?
18. What is `ss`?
19. How do you check listening ports?
20. How do you troubleshoot an unreachable Linux server?
21. How do you troubleshoot EC2 SSH?
22. What is the difference between Security Groups and NACLs?
23. What is an Internet Gateway?
24. What is a NAT Gateway?
25. What happens when DNS fails?

---

# 🧪 Section Project

Build:

```text
Internet
   │
   ▼
AWS Internet Gateway
   │
   ▼
Public Subnet
   │
   ▼
EC2 Linux Server
   │
   ├── SSH :22
   └── HTTP :80
```

Install a web server.

Amazon Linux:

```bash
sudo dnf install nginx -y
```

Ubuntu:

```bash
sudo apt update
sudo apt install nginx -y
```

Start:

```bash
sudo systemctl enable --now nginx
```

Check:

```bash
sudo ss -tlnp
```

Test locally:

```bash
curl localhost
```

Then test from your browser using the EC2 public IP.

---

# ✅ Section Checklist

- [ ] Understand IPv4
- [ ] Understand IPv6
- [ ] Understand public/private IPs
- [ ] Understand CIDR
- [ ] Understand subnets
- [ ] Understand default gateway
- [ ] Use `ip addr`
- [ ] Use `ip route`
- [ ] Understand DNS
- [ ] Use `dig`
- [ ] Use `nslookup`
- [ ] Understand SSH
- [ ] Connect using SSH
- [ ] Understand TCP
- [ ] Understand UDP
- [ ] Understand ports
- [ ] Use `ss`
- [ ] Use `ping`
- [ ] Use `curl`
- [ ] Troubleshoot Linux networking
- [ ] Troubleshoot EC2 networking
- [ ] Complete networking lab

---

# 🔜 Next Section

```text
08-Package-Management/
```

You will learn:

```text
APT
YUM
DNF
RPM
```