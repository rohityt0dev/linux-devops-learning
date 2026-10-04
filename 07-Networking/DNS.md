# 📖 Linux DNS

DNS stands for:

> **Domain Name System**

DNS converts human-readable domain names into IP addresses.

Example:

```text
example.com
     ↓
    DNS
     ↓
IP Address
```

Without DNS, users would often need to remember server IP addresses instead of domain names.

---

# 🎯 Learning Objectives

You will learn:

- DNS basics
- DNS resolution
- DNS record types
- `/etc/resolv.conf`
- `/etc/hosts`
- `dig`
- `nslookup`
- `host`
- DNS troubleshooting
- AWS Route 53
- VPC DNS

---

# 🧠 DNS Resolution

When you access:

```text
www.example.com
```

your system needs to discover an IP address.

Simplified process:

```text
Application
    ↓
Local resolver
    ↓
DNS resolver
    ↓
DNS hierarchy
    ↓
Authoritative DNS
    ↓
IP address
```

---

# 📚 Important DNS Records

| Record | Purpose |
|---|---|
| A | Hostname → IPv4 |
| AAAA | Hostname → IPv6 |
| CNAME | Alias to another hostname |
| MX | Mail server |
| NS | Name server |
| TXT | Text/verification information |
| PTR | Reverse DNS |

---

# 🔍 `/etc/resolv.conf`

Check DNS resolver configuration:

```bash
cat /etc/resolv.conf
```

Example:

```text
nameserver 10.0.0.2
```

Depending on the Linux distribution, `/etc/resolv.conf` may be automatically managed by components such as NetworkManager or `systemd-resolved`.

---

# 📁 `/etc/hosts`

Local hostname mappings can be stored in:

```text
/etc/hosts
```

View:

```bash
cat /etc/hosts
```

Example:

```text
127.0.0.1 localhost
192.168.1.20 webserver
```

Then:

```bash
ping webserver
```

may resolve to:

```text
192.168.1.20
```

depending on the system's name-service configuration.

---

# 🔎 nslookup

Query DNS:

```bash
nslookup example.com
```

---

# 🔎 dig

Detailed DNS query:

```bash
dig example.com
```

Only answer:

```bash
dig +short example.com
```

Query A:

```bash
dig A example.com
```

Query MX:

```bash
dig MX example.com
```

Query NS:

```bash
dig NS example.com
```

---

# 🔄 Reverse DNS

Query an IP:

```bash
dig -x 8.8.8.8
```

This requests a PTR record.

---

# 🔍 host

Another useful command:

```bash
host example.com
```

---

# 🧪 DNS Lab

Run:

```bash
cat /etc/resolv.conf
```

Then:

```bash
dig example.com
```

Then:

```bash
dig +short example.com
```

Then:

```bash
nslookup example.com
```

Then:

```bash
host example.com
```

Record:

```text
DNS server:
Resolved IP:
A records:
AAAA records:
Name servers:
```

---

# 🧪 `/etc/hosts` Lab

Edit:

```bash
sudo nano /etc/hosts
```

Add a test entry:

```text
192.168.1.50 testserver
```

Test:

```bash
getent hosts testserver
```

Remove the test entry when finished.

---

# 🛠️ DNS Troubleshooting

Suppose:

```bash
ping -c 4 8.8.8.8
```

works.

But:

```bash
ping -c 4 example.com
```

fails.

This strongly suggests investigating DNS resolution.

Check:

```bash
cat /etc/resolv.conf
```

Then:

```bash
dig example.com
```

Then:

```bash
nslookup example.com
```

---

# 🧠 Useful Troubleshooting Comparison

Test IP:

```bash
ping -c 4 8.8.8.8
```

Test domain:

```bash
ping -c 4 example.com
```

Possible result:

```text
IP works
Domain fails
     ↓
Investigate DNS
```

---

# ☁️ AWS Route 53

Amazon Web Services Route 53 is AWS's managed DNS service.

It can manage records such as:

```text
A
AAAA
CNAME
MX
TXT
```

Architecture:

```text
User
 ↓
DNS Query
 ↓
Route 53
 ↓
Application Endpoint
 ↓
EC2 / Load Balancer / Other AWS Resource
```

---

# ☁️ VPC DNS

AWS VPC provides DNS capabilities that EC2 instances can use.

On EC2:

```bash
cat /etc/resolv.conf
```

shows the resolver configuration supplied to the instance.

You can compare this with your:

```text
VPC
DHCP options
DNS settings
Private hosted zones
```

---

# 🧪 AWS DNS Lab

Launch an EC2 instance.

Run:

```bash
cat /etc/resolv.conf
```

Then:

```bash
dig amazon.com
```

Then:

```bash
dig +short amazon.com
```

Test:

```bash
curl -I https://amazon.com
```

Now test an invalid domain:

```bash
dig this-domain-should-not-exist-example.invalid
```

Compare the results.

---

# 🎯 Interview Questions

### What is DNS?

DNS maps domain names to IP addresses and stores other domain-related information.

### What is an A record?

Maps a hostname to an IPv4 address.

### What is an AAAA record?

Maps a hostname to an IPv6 address.

### What is CNAME?

Creates an alias pointing one hostname to another hostname.

### What is MX?

Specifies mail servers for a domain.

### What is `/etc/resolv.conf`?

It contains resolver configuration used by the Linux system, although it may be generated automatically.

### What is `/etc/hosts`?

A local static hostname-to-address mapping file.

### How do you troubleshoot DNS?

```bash
cat /etc/resolv.conf
getent hosts example.com
dig example.com
nslookup example.com
```

### What is Route 53?

AWS's managed DNS service.

---

# 🧠 Interview Scenario

**Problem:**

```text
curl https://1.1.1.1
```

or another known IP is reachable, but:

```text
curl https://example.com
```

fails because the hostname cannot be resolved.

Investigate:

```text
DNS resolver configuration
DNS server reachability
/etc/resolv.conf
Local resolver service
VPC DNS settings
Route 53 private hosted-zone configuration
Network ACL/firewall rules affecting DNS
```

---

# ✅ Checklist

- [ ] Understand DNS
- [ ] Understand DNS resolution
- [ ] Understand A
- [ ] Understand AAAA
- [ ] Understand CNAME
- [ ] Understand MX
- [ ] Understand NS
- [ ] Understand PTR
- [ ] Use `dig`
- [ ] Use `nslookup`
- [ ] Use `host`
- [ ] Understand `/etc/resolv.conf`
- [ ] Understand `/etc/hosts`
- [ ] Troubleshoot DNS
- [ ] Understand Route 53
- [ ] Complete DNS lab