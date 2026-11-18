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


# 5. `nslookup`

```bash
nslookup example.com
```

Useful for basic DNS troubleshooting.

---

# 6. `host`

```bash
host example.com
```

---

# 7. `curl`

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

# 8. `wget`

Download:

```bash
wget https://example.com/file.zip
```

Test URL:

```bash
wget --spider https://example.com
```

---


# 9. `hostname`

Display hostname:

```bash
hostname
```

Detailed:

```bash
hostnamectl
```

---


# 10. `/etc/resolv.conf`

Check resolver:

```bash
cat /etc/resolv.conf
```

---

# 11. `/etc/hosts`

Check local hostname mappings:

```bash
cat /etc/hosts
```

---

# 13. `getent`

Check name resolution using the system's configured name-service mechanisms:

```bash
getent hosts example.com
```

This can be more representative of how applications resolve names than querying DNS directly.

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
