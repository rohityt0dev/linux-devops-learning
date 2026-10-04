# 🌐 Linux IP Addressing

An **IP address** identifies a device on an IP network.

Understanding IP addressing is essential for Linux administration and AWS networking.

---

# 🎯 Learning Objectives

You will learn:

- IPv4
- IPv6
- Public IP
- Private IP
- Loopback address
- CIDR
- Subnet mask
- Network address
- Broadcast address
- Default gateway
- Linux IP commands
- AWS IP addressing

---

# 🧠 IPv4

IPv4 addresses contain 32 bits.

Example:

```text
192.168.1.10
```

IPv4 consists of four octets:

```text
192 . 168 . 1 . 10
```

Each octet ranges from:

```text
0 - 255
```

---

# 🏠 Private IPv4 Ranges

Private IPv4 address ranges are:

```text
10.0.0.0/8

172.16.0.0/12

192.168.0.0/16
```

These addresses are commonly used inside private networks.

AWS VPCs commonly use ranges such as:

```text
10.0.0.0/16
```

---

# 🌎 Public IP Address

A public IP address can be used for communication over the public internet, subject to routing and security controls.

AWS EC2 can have:

```text
Private IP
Public IPv4
Elastic IP
```

---

# 🔄 Loopback Address

The common IPv4 loopback address is:

```text
127.0.0.1
```

Hostname:

```text
localhost
```

Test:

```bash
ping -c 4 127.0.0.1
```

or:

```bash
ping -c 4 localhost
```

This tests the local TCP/IP stack rather than external network connectivity.

---

# 🆕 IPv6

IPv6 uses 128-bit addresses.

Example:

```text
2001:db8::1
```

Loopback:

```text
::1
```

Check IPv6 addresses:

```bash
ip -6 addr
```

---

# 🔢 CIDR

CIDR stands for:

**Classless Inter-Domain Routing**

Example:

```text
192.168.1.0/24
```

`/24` means the first 24 bits identify the network portion.

---

# 📊 Common CIDR Sizes

| CIDR | Total IPv4 Addresses |
|---|---:|
| /16 | 65,536 |
| /20 | 4,096 |
| /24 | 256 |
| /25 | 128 |
| /26 | 64 |
| /27 | 32 |
| /28 | 16 |
| /29 | 8 |
| /30 | 4 |
| /32 | 1 |

Remember that the number of **usable host addresses** depends on the environment.

AWS reserves some addresses in every subnet, so AWS usable-address counts differ from traditional subnet calculations.

---

# 🧮 `/24` Example

Network:

```text
192.168.1.0/24
```

Traditional IPv4 subnet:

```text
Network Address:
192.168.1.0

Host Range:
192.168.1.1 - 192.168.1.254

Broadcast:
192.168.1.255
```

---

# ☁️ Important AWS Difference

Suppose an AWS subnet is:

```text
10.0.1.0/24
```

There are:

```text
256 total IPv4 addresses
```

AWS reserves five addresses in each subnet.

Therefore:

```text
251 addresses are available for resources
```

This is an important AWS interview point.

---

# 🎭 Subnet Mask

CIDR:

```text
/24
```

corresponds to:

```text
255.255.255.0
```

Other examples:

```text
/16 → 255.255.0.0

/24 → 255.255.255.0

/32 → 255.255.255.255
```

---

# 🚪 Default Gateway

A default gateway is the next hop used when there is no more specific route to a destination.

Example:

```text
Linux Server
192.168.1.10
      │
      ▼
Gateway
192.168.1.1
      │
      ▼
Other Networks
```

Check:

```bash
ip route
```

Example:

```text
default via 192.168.1.1 dev eth0
```

---

# 🔍 Check Linux IP Address

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

IPv6:

```bash
ip -6 addr
```

---

# 🔌 Check Interfaces

```bash
ip link
```

Example:

```text
lo
eth0
```

or cloud systems may use names such as:

```text
ens5
ens160
enp0s3
```

---

# 🛣️ Routing

Check:

```bash
ip route
```

Example:

```text
default via 10.0.1.1 dev eth0
10.0.1.0/24 dev eth0
```

---

# 🧪 Hands-On Lab

Run:

```bash
ip addr
```

Record:

```text
Interface:
IPv4:
CIDR:
IPv6:
```

Then:

```bash
ip route
```

Record:

```text
Default gateway:
Local network:
Interface:
```

Test loopback:

```bash
ping -c 4 127.0.0.1
```

Test gateway:

```bash
ping -c 4 <gateway>
```

Test internet IP:

```bash
ping -c 4 8.8.8.8
```

---

# ☁️ AWS VPC Example

VPC:

```text
10.0.0.0/16
```

Public subnet:

```text
10.0.1.0/24
```

Private subnet:

```text
10.0.2.0/24
```

Architecture:

```text
VPC
10.0.0.0/16
│
├── Public Subnet
│   10.0.1.0/24
│
└── Private Subnet
    10.0.2.0/24
```

---

# ☁️ EC2 IP Addressing

An EC2 instance might have:

```text
Private IP:
10.0.1.20

Public IP:
203.x.x.x
```

Inside Linux:

```bash
ip addr
```

will typically show the private IP assigned to the network interface.

The public IPv4 mapping is handled by AWS infrastructure rather than being directly configured as the interface's local address.

---

# 🧪 AWS Lab

Launch EC2.

Run:

```bash
ip addr
```

Then:

```bash
ip route
```

Compare the result with:

```text
AWS Console
→ EC2
→ Networking
```

Identify:

```text
Private IPv4
Public IPv4
Subnet
VPC
Security Group
Network Interface
```

---

# 🎯 Interview Questions

### What is an IP address?

An IP address identifies an interface/device on an IP network.

### What is IPv4?

IPv4 is a 32-bit addressing protocol.

### What is IPv6?

IPv6 is a 128-bit addressing protocol.

### What is a private IP?

An address used within private networks and not globally routed on the public internet.

### What is a public IP?

An IP address that can be globally routed over the public internet.

### What is CIDR?

Classless Inter-Domain Routing represents network prefixes using notation such as:

```text
10.0.0.0/16
```

### What does `/24` mean?

The first 24 bits represent the network prefix.

### What is a default gateway?

The next-hop router used when no more specific route exists.

### How do you check a Linux IP?

```bash
ip addr
```

### How do you check the default gateway?

```bash
ip route
```

---

# 🧠 AWS Interview Scenario

**Question:**

An EC2 instance has a private IP but cannot be accessed directly from the internet. Why?

Possible reasons include:

```text
No public IPv4/EIP
No Internet Gateway
Incorrect route table
Security Group blocking traffic
NACL blocking traffic
Instance is in a private subnet
Service is not listening
Linux firewall blocking traffic
```

A private IP by itself is not directly reachable from the public internet.

---

# ✅ Checklist

- [ ] Understand IPv4
- [ ] Understand IPv6
- [ ] Know private IPv4 ranges
- [ ] Understand public IP
- [ ] Understand loopback
- [ ] Understand CIDR
- [ ] Understand `/24`
- [ ] Understand subnet mask
- [ ] Understand gateway
- [ ] Use `ip addr`
- [ ] Use `ip link`
- [ ] Use `ip route`
- [ ] Understand AWS VPC CIDRs
- [ ] Understand public/private EC2 IPs
- [ ] Complete IP lab