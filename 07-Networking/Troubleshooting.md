# 🔧 Linux Network Troubleshooting

Network troubleshooting is one of the most valuable practical skills for a Linux or AWS Cloud Engineer.

Instead of randomly changing configurations, troubleshoot the network **layer by layer**.

---

# 🎯 Learning Objectives

You will learn how to troubleshoot:

- Network interfaces
- IP addresses
- Routes
- Gateways
- DNS
- Ports
- Services
- Firewalls
- SSH
- Web servers
- Internet connectivity
- AWS EC2 networking
- Private subnet connectivity

---

# 🧠 Troubleshooting Method

Use this flow:

```text
Problem
   ↓
Interface
   ↓
IP Address
   ↓
Subnet
   ↓
Gateway
   ↓
Routing
   ↓
IP Connectivity
   ↓
DNS
   ↓
Port
   ↓
Firewall
   ↓
Application
```

---

# 1️⃣ Check Interface

```bash
ip link
```

Then:

```bash
ip addr
```

Check:

```text
Interface exists?
Interface UP?
Correct IP?
Correct CIDR?
```

---

# 2️⃣ Check IP Address

```bash
ip addr
```

Example:

```text
inet 10.0.1.20/24
```

Verify that the address is appropriate for the expected subnet.

---

# 3️⃣ Check Routing

```bash
ip route
```

Look for:

```text
default via <gateway>
```

Example:

```text
default via 10.0.1.1 dev eth0
```

---

# 4️⃣ Test Loopback

```bash
ping -c 4 127.0.0.1
```

If this fails, investigate the local network stack/system configuration.

---

# 5️⃣ Test Local IP

```bash
ping -c 4 <server-private-ip>
```

This can help verify local interface behavior.

---

# 6️⃣ Test Gateway

```bash
ping -c 4 <gateway-ip>
```

Remember that ICMP may be blocked, so combine this with route and service-level testing.

---

# 7️⃣ Test Internet by IP

```bash
ping -c 4 8.8.8.8
```

Or test an HTTP endpoint:

```bash
curl -I https://example.com
```

---

# 8️⃣ Test DNS

```bash
dig example.com
```

Also:

```bash
getent hosts example.com
```

Check:

```bash
cat /etc/resolv.conf
```

---

# 9️⃣ Check Listening Ports

```bash
sudo ss -tulpn
```

Specific:

```bash
sudo ss -ltnp | grep :80
```

---

# 🔟 Test Port

```bash
nc -zv SERVER-IP 80
```

For HTTP:

```bash
curl -v http://SERVER-IP
```

---

# 1️⃣1️⃣ Check Service

Nginx:

```bash
systemctl status nginx
```

SSH:

```bash
systemctl status sshd
```

or:

```bash
systemctl status ssh
```

---

# 1️⃣2️⃣ Check Linux Firewall

Ubuntu:

```bash
sudo ufw status
```

RHEL-like systems:

```bash
sudo firewall-cmd --list-all
```

Low-level rules may also be inspected with:

```bash
sudo nft list ruleset
```

depending on the system.

---

# 1️⃣3️⃣ Check Logs

System logs:

```bash
journalctl -xe
```

Kernel:

```bash
journalctl -k
```

SSH:

```bash
journalctl -u sshd
```

or:

```bash
journalctl -u ssh
```

Nginx:

```bash
journalctl -u nginx
```

---

# 1️⃣4️⃣ Packet Capture

Use:

```bash
sudo tcpdump -i any
```

SSH:

```bash
sudo tcpdump -i any port 22
```

HTTP:

```bash
sudo tcpdump -i any port 80
```

DNS:

```bash
sudo tcpdump -i any port 53
```

This can answer an important question:

```text
Is traffic actually reaching the server?
```

---

# 🧪 Scenario 1 — No Internet

Check:

```bash
ip addr
ip route
ping -c 4 8.8.8.8
cat /etc/resolv.conf
```

Possible causes:

```text
Interface problem
Missing IP
Missing default route
Gateway problem
Firewall
AWS route table
NACL
Missing NAT Gateway for private subnet
Missing Internet Gateway/public IP for public architecture
```

---

# 🧪 Scenario 2 — IP Works, Domain Doesn't

Example:

```bash
ping -c 4 8.8.8.8
```

works.

But:

```bash
getent hosts example.com
```

fails.

Investigate:

```text
DNS
```

Commands:

```bash
cat /etc/resolv.conf
dig example.com
nslookup example.com
```

---

# 🧪 Scenario 3 — Website Not Opening

Check service:

```bash
systemctl status nginx
```

Check port:

```bash
sudo ss -ltnp | grep :80
```

Test locally:

```bash
curl localhost
```

Test private IP:

```bash
curl http://PRIVATE-IP
```

Then investigate:

```text
Security Group
NACL
Route Table
Internet Gateway
Public IP
Linux firewall
Application bind address
```

---

# 🧪 Scenario 4 — SSH Not Working

Check AWS:

```text
Instance running
Public IP
Security Group
Route Table
Internet Gateway
NACL
```

Check Linux:

```bash
systemctl status sshd
```

or:

```bash
systemctl status ssh
```

Then:

```bash
sudo ss -ltnp | grep :22
```

Then firewall.

Check client side:

```text
Correct username
Correct key
Key permissions
Correct IP
```

---

# ☁️ AWS Public EC2 Troubleshooting

Expected architecture:

```text
Internet
   ↓
Internet Gateway
   ↓
Route Table
   ↓
Public Subnet
   ↓
Security Group
   ↓
ENI
   ↓
EC2
   ↓
Linux Firewall
   ↓
Application
```

Check every layer.

---

# ☁️ AWS Private EC2 Internet Troubleshooting

Expected architecture:

```text
Private EC2
    ↓
Private Subnet
    ↓
Private Route Table
    ↓
NAT Gateway
    ↓
Public Subnet
    ↓
Internet Gateway
    ↓
Internet
```

Check:

```text
Private EC2 route table:
0.0.0.0/0 → NAT Gateway

NAT Gateway:
Located in public subnet

Public subnet route:
0.0.0.0/0 → Internet Gateway

NAT Gateway:
Has Elastic IP

Security Groups:
Allow required outbound traffic

NACL:
Allows required inbound/outbound traffic
```

---

# 🧠 Important AWS Point

A **NAT Gateway is for outbound connectivity from private subnets**.

It does not allow unsolicited inbound connections from the internet to a private EC2 instance.

For administrative access to private instances, architectures can use:

```text
Bastion Host
AWS Systems Manager Session Manager
VPN
Direct Connect
```

depending on requirements.

---

# 🧪 Scenario 5 — Private EC2 Cannot Download Packages

Example:

```bash
sudo dnf update
```

fails.

Check:

```bash
ip route
```

Test DNS:

```bash
dig amazon.com
```

Test HTTPS:

```bash
curl -I https://amazon.com
```

AWS checks:

```text
Private subnet route:
0.0.0.0/0 → NAT Gateway

NAT Gateway is available

NAT Gateway is in public subnet

Public subnet:
0.0.0.0/0 → Internet Gateway

Security Group outbound rules

NACL
DNS settings
```

---

# 🧪 Scenario 6 — Application Runs But Remote Access Fails

Suppose:

```bash
curl localhost:8080
```

works.

But remote clients cannot connect.

Check:

```bash
sudo ss -ltnp | grep :8080
```

If:

```text
127.0.0.1:8080
```

the application only listens locally.

You may need it to bind to:

```text
0.0.0.0:8080
```

or the required interface address.

Also check:

```text
Security Group
Firewall
NACL
Route
```

---

# 🧪 Scenario 7 — Port Is Open in Security Group But Still Not Working

Security Group:

```text
TCP 80 allowed
```

But site fails.

Check:

```bash
sudo ss -ltnp | grep :80
```

If nothing is listening, the problem is likely at the service/application layer rather than the Security Group.

Check:

```bash
systemctl status nginx
```

Then:

```bash
journalctl -u nginx
```

---

# 🔬 Advanced Troubleshooting with tcpdump

Suppose clients cannot reach port 80.

Run:

```bash
sudo tcpdump -i any port 80
```

Try connecting from the client.

### No packets appear

Investigate upstream networking:

```text
Security Group
NACL
Routing
Wrong IP
Internet Gateway
Client routing/firewall
```

### Packets appear

Investigate:

```text
Linux firewall
Application
Listening port
Application response
Return routing
```

---

# 🧭 Troubleshooting by Layers

A useful mental model:

```text
Layer 1/2
Interface / link

Layer 3
IP / subnet / routing

Layer 4
TCP / UDP / ports

Layer 7
DNS / HTTP / SSH / application
```

Do not start at the application when the server does not even have a working IP or route.

---

# ⭐ AWS Interview Scenario

**Question:**

> An EC2 instance is in a public subnet and has a public IP, but the website is inaccessible.

Strong troubleshooting answer:

```text
1. Verify EC2 instance is running
2. Verify correct public IP/DNS
3. Verify Security Group allows TCP 80/443
4. Verify route table contains 0.0.0.0/0 → Internet Gateway
5. Verify Internet Gateway is attached to VPC
6. Verify NACL rules
7. Check Linux IP and routes
8. Check Linux firewall
9. Check web-server service
10. Check port 80/443 is listening
11. Check application bind address
12. Test locally with curl
13. Check application logs
14. Use tcpdump if necessary
```

Commands:

```bash
ip addr
ip route
sudo ss -tulpn
systemctl status nginx
curl localhost
sudo tcpdump -i any port 80
```

---

# ⭐ AWS Interview Scenario 2

**Question:**

> EC2 is in a private subnet and cannot access the internet.

Answer:

Check:

```text
Private subnet route table
0.0.0.0/0 → NAT Gateway

NAT Gateway state
NAT Gateway public subnet
Elastic IP
Public subnet route → Internet Gateway
Security Group outbound
NACL
DNS
```

Linux:

```bash
ip addr
ip route
cat /etc/resolv.conf
curl -I https://example.com
```

---

# ⭐ AWS Interview Scenario 3

**Question:**

> Security Group allows SSH, but connection times out.

A timeout often points toward a network path/filtering problem.

Investigate:

```text
Correct IP
Public IP
Route table
Internet Gateway
Security Group source
NACL
Client firewall/network
Linux firewall
sshd listening
```

If instead you receive:

```text
Permission denied (publickey)
```

network connectivity likely reached SSH, and you should investigate:

```text
Username
Private key
authorized_keys
Permissions
SSH configuration
```

This distinction is extremely useful in interviews and real troubleshooting.

---

# 🛠️ Troubleshooting Command Checklist

```bash
hostname
ip link
ip addr
ip route
ip neigh
ping
dig
nslookup
getent hosts
ss -tulpn
curl
nc
traceroute
tracepath
lsof
tcpdump
journalctl
systemctl
```

---

# 🧪 Final Networking Troubleshooting Lab

Create an EC2 web server.

Install Nginx:

```bash
sudo dnf install nginx -y
```

or:

```bash
sudo apt install nginx -y
```

Start:

```bash
sudo systemctl enable --now nginx
```

Check:

```bash
sudo ss -ltnp | grep :80
```

Test:

```bash
curl localhost
```

Then deliberately create controlled failures in a **test environment**, one at a time:

```text
Stop Nginx
Remove Security Group port 80
Change application port
Test DNS failure
Test incorrect route configuration
```

For each failure, diagnose the issue before restoring the configuration.

Document:

```text
Problem:
Symptoms:
Commands used:
Root cause:
Solution:
Verification:
```

This creates excellent material for your GitHub repository and interview preparation.

---

# 🎯 Interview Questions

1. How do you troubleshoot Linux networking?
2. How do you check an IP address?
3. How do you check the default gateway?
4. How do you test DNS?
5. How do you check listening ports?
6. How do you test a remote TCP port?
7. How do you troubleshoot SSH?
8. How do you troubleshoot a web server?
9. What is `tcpdump`?
10. What is the difference between timeout and connection refused?
11. Why might DNS fail while IP connectivity works?
12. Why might localhost work while remote access fails?
13. How do you troubleshoot EC2 in a public subnet?
14. How do you troubleshoot private EC2 internet access?
15. What is the purpose of NAT Gateway?
16. What is the difference between Security Groups and NACLs?

---

# 🧠 Important Error Meanings

### Connection timed out

Often investigate:

```text
Routing
Security Group
NACL
Firewall
Wrong IP
Network path
```

### Connection refused

Often means the destination was reached but nothing accepted the connection on that port, or the host actively rejected it.

Check:

```bash
sudo ss -ltnp
```

### Could not resolve host

Investigate:

```text
DNS
```

Check:

```bash
dig example.com
```

### Permission denied (publickey)

Investigate:

```text
SSH key
Username
authorized_keys
Permissions
```

---

# 📋 Final Troubleshooting Flow

Memorize:

```text
1. Interface
       ↓
2. IP
       ↓
3. Subnet
       ↓
4. Gateway
       ↓
5. Route
       ↓
6. Connectivity
       ↓
7. DNS
       ↓
8. Port
       ↓
9. Firewall / Security Group / NACL
       ↓
10. Service
       ↓
11. Application
       ↓
12. Logs
       ↓
13. Packet Capture
```

---

# ☁️ AWS Troubleshooting Flow

```text
Client
  ↓
DNS
  ↓
Public IP / Load Balancer
  ↓
Internet Gateway
  ↓
Route Table
  ↓
NACL
  ↓
Security Group
  ↓
ENI
  ↓
Linux Network
  ↓
Linux Firewall
  ↓
Listening Port
  ↓
Service
  ↓
Application
```

---

# 🏆 Section Completion

After completing `07-Networking`, you should be comfortable with:

```text
IP Addressing
CIDR
Subnets
Routing
DNS
SSH
TCP/UDP
Ports
Network Commands
Network Troubleshooting
EC2 Networking
Public Subnets
Private Subnets
Internet Gateway
NAT Gateway
Security Groups
NACLs
```

These are core skills for an **AWS Cloud Engineer**.

---

# ✅ Final Checklist

- [ ] Troubleshoot interfaces
- [ ] Troubleshoot IPs
- [ ] Troubleshoot routes
- [ ] Troubleshoot gateways
- [ ] Troubleshoot DNS
- [ ] Troubleshoot ports
- [ ] Troubleshoot SSH
- [ ] Troubleshoot HTTP
- [ ] Check Linux firewall
- [ ] Use `tcpdump`
- [ ] Troubleshoot public EC2
- [ ] Troubleshoot private EC2
- [ ] Understand NAT Gateway
- [ ] Understand Internet Gateway
- [ ] Understand Security Groups
- [ ] Understand NACLs
- [ ] Complete final networking lab

---

# 🎉 Section Complete

You have completed:

```text
07-Networking/
│
├── README.md
├── IP-Address.md
├── DNS.md
├── SSH.md
├── Network-Commands.md
├── Ports.md
└── Troubleshooting.md
```

## 🔜 Next Section

```text
08-Package-Management/
│
├── README.md
├── APT.md
├── YUM.md
├── DNF.md
└── RPM.md
```

This will teach you how Linux installs, updates, removes, and manages software packages on **Ubuntu, Debian, Amazon Linux, RHEL, Rocky Linux, and similar distributions**.