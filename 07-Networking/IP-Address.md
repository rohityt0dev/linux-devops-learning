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
