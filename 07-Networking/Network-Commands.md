# 🛠️ Linux Network Commands

Linux provides powerful networking commands for inspecting interfaces, testing connectivity, diagnosing DNS, checking ports, and troubleshooting routing problems.

These commands are essential for Linux and AWS Cloud Engineers.

---

# 1. `ip addr`

Display network interfaces and addresses:

```bash
ip addr
```

Short:

```bash
ip a
```

IPv4:

```bash
ip -4 addr
```

---

# 2. `ip link`

Display interfaces:

```bash
ip link
```

Bring an interface up:

```bash
sudo ip link set eth0 up
```

Bring down:

```bash
sudo ip link set eth0 down
```

Be very careful when changing a remote server's active network interface because you can disconnect yourself.

---

# 3. `ip route`

Display routing table:

```bash
ip route
```

Example:

```text
default via 192.168.1.1 dev eth0
```

Show route for a destination:

```bash
ip route get 8.8.8.8
```

---

# 4. `ping`

Test IP connectivity:

```bash
ping -c 4 8.8.8.8
```

Test DNS + connectivity:

```bash
ping -c 4 example.com
```

Remember that some hosts and networks block ICMP, so a failed ping does not always mean the destination service is unavailable.

---

# 5. `ss`

Display sockets.

Listening TCP ports:

```bash
ss -ltn
```

Listening TCP with processes:

```bash
sudo ss -ltnp
```

TCP and UDP:

```bash
sudo ss -tulpn
```

Specific port:

```bash
sudo ss -ltnp | grep :22
```

---

# 6. `netstat`

Older systems may use:

```bash
netstat -tulpn
```

Modern Linux generally prefers:

```bash
ss
```

`netstat` may require the `net-tools` package.

---

# 7. `dig`

DNS query:

```bash
dig example.com
```

Short output:

```bash
dig +short example.com
```

---

# 8. `nslookup`

```bash
nslookup example.com
```

Useful for basic DNS troubleshooting.

---

# 9. `host`

```bash
host example.com
```

---

# 10. `traceroute`

Shows the network path toward a destination:

```bash
traceroute example.com
```

It may need to be installed separately.

---

# 11. `tracepath`

Often available without special privileges:

```bash
tracepath example.com
```

---

# 12. `curl`

Test HTTP/HTTPS:

```bash
curl https://example.com
```

Headers only:

```bash
curl -I https://example.com
```

Verbose:

```bash
curl -v https://example.com
```

Test local web server:

```bash
curl localhost
```

Specific port:

```bash
curl http://SERVER-IP:8080
```

---

# 13. `wget`

Download:

```bash
wget https://example.com/file.zip
```

Test URL:

```bash
wget --spider https://example.com
```

---

# 14. `nc` — Netcat

Test TCP port:

```bash
nc -zv SERVER-IP 22
```

Web port:

```bash
nc -zv SERVER-IP 80
```

HTTPS:

```bash
nc -zv SERVER-IP 443
```

This is very useful when troubleshooting Security Groups and firewalls.

---

# 15. `hostname`

Display hostname:

```bash
hostname
```

Detailed:

```bash
hostnamectl
```

---

# 16. `ip neigh`

Display neighbor table:

```bash
ip neigh
```

Example:

```text
192.168.1.1 dev eth0 lladdr xx:xx:xx:xx REACHABLE
```

---

# 17. `arp`

Older tool:

```bash
arp -a
```

Modern replacement:

```bash
ip neigh
```

---

# 18. `/etc/resolv.conf`

Check resolver:

```bash
cat /etc/resolv.conf
```

---

# 19. `/etc/hosts`

Check local hostname mappings:

```bash
cat /etc/hosts
```

---

# 20. `getent`

Check name resolution using the system's configured name-service mechanisms:

```bash
getent hosts example.com
```

This can be more representative of how applications resolve names than querying DNS directly.

---

# 21. `lsof`

Check a port:

```bash
sudo lsof -i :80
```

SSH:

```bash
sudo lsof -i :22
```

---

# 22. `tcpdump`

Capture network packets:

```bash
sudo tcpdump -i any
```

Port 22:

```bash
sudo tcpdump -i any port 22
```

ICMP:

```bash
sudo tcpdump -i any icmp
```

Host:

```bash
sudo tcpdump -i any host 192.168.1.20
```

`tcpdump` is extremely useful for advanced troubleshooting.

---

# 🧪 Network Investigation Lab

Run:

```bash
hostname
```

```bash
ip addr
```

```bash
ip route
```

```bash
ip neigh
```

```bash
cat /etc/resolv.conf
```

```bash
ss -tulpn
```

```bash
ping -c 4 8.8.8.8
```

```bash
dig example.com
```

```bash
curl -I https://example.com
```

Record:

```text
Hostname:
Interface:
IP:
CIDR:
Gateway:
DNS:
Listening ports:
Internet connectivity:
DNS status:
HTTP status:
```

---

# 🧪 Web Server Troubleshooting Lab

Install Nginx.

Ubuntu:

```bash
sudo apt update
sudo apt install nginx -y
```

Amazon Linux/RHEL-like system:

```bash
sudo dnf install nginx -y
```

Start:

```bash
sudo systemctl enable --now nginx
```

Check:

```bash
systemctl status nginx
```

Check port:

```bash
sudo ss -ltnp | grep :80
```

Test:

```bash
curl localhost
```

Then:

```bash
curl http://SERVER-IP
```

---

# ☁️ AWS Troubleshooting Commands

For an EC2 networking issue, start with:

```bash
ip addr
ip route
cat /etc/resolv.conf
sudo ss -tulpn
curl -I https://example.com
```

Then check AWS:

```text
VPC
Subnet
Route Table
Internet Gateway
NAT Gateway
Security Group
NACL
Public IP
ENI
```

---

# 🧠 Command Cheat Sheet

| Task | Command |
|---|---|
| Show IP | `ip addr` |
| Show interface | `ip link` |
| Show routes | `ip route` |
| Test connectivity | `ping` |
| DNS lookup | `dig` |
| DNS lookup | `nslookup` |
| Listening ports | `ss -tulpn` |
| HTTP test | `curl` |
| Download | `wget` |
| Test TCP port | `nc` |
| Trace route | `traceroute` |
| Neighbor table | `ip neigh` |
| Port/process | `lsof -i` |
| Packet capture | `tcpdump` |

---

# 🎯 Interview Questions

### How do you check IP?

```bash
ip addr
```

### How do you check routes?

```bash
ip route
```

### How do you test DNS?

```bash
dig example.com
```

### How do you check listening ports?

```bash
sudo ss -tulpn
```

### How do you test an HTTP server?

```bash
curl http://SERVER-IP
```

### How do you test whether TCP port 22 is reachable?

```bash
nc -zv SERVER-IP 22
```

### How do you capture packets?

```bash
sudo tcpdump -i any
```

### What replaced `ifconfig` on modern Linux?

The `ip` command from the `iproute2` suite is the modern standard.

---

# ⭐ Cloud Engineer Command Set

Memorize:

```bash
ip addr
ip route
ping
ss -tulpn
dig
curl
nc
traceroute
tcpdump
```

These commands solve a large percentage of Linux networking investigations.

---

# ✅ Checklist

- [ ] `ip addr`
- [ ] `ip link`
- [ ] `ip route`
- [ ] `ping`
- [ ] `ss`
- [ ] `dig`
- [ ] `nslookup`
- [ ] `host`
- [ ] `traceroute`
- [ ] `curl`
- [ ] `wget`
- [ ] `nc`
- [ ] `hostname`
- [ ] `ip neigh`
- [ ] `lsof`
- [ ] `tcpdump`
- [ ] Complete network investigation lab
- [ ] Complete web-server troubleshooting lab