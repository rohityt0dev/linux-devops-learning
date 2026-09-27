# 🐧 Linux Distributions

## 📌 Overview

A Linux distribution is a complete operating system built around the Linux kernel.

A distribution usually contains:

```text
Linux Kernel
     +
System Libraries
     +
GNU / System Utilities
     +
Package Manager
     +
Applications
     +
Configuration Tools
```

Examples:

```text
Ubuntu
Debian
Fedora
RHEL
Rocky Linux
AlmaLinux
Amazon Linux
Arch Linux
openSUSE
```

---

# 🎯 Learning Objectives

After completing this topic, I should understand:

* What a Linux distribution is
* Distribution families
* Debian-based distributions
* Red Hat-based distributions
* RPM
* DEB
* APT
* DNF
* YUM
* Ubuntu
* Debian
* RHEL
* Fedora
* Rocky Linux
* Amazon Linux
* How to identify a distribution

---

# 1. What is a Linux Distribution?

The Linux kernel alone is not a complete user-friendly operating system.

A distribution combines the kernel with other software.

```text
Linux Distribution
│
├── Linux Kernel
├── Libraries
├── System Utilities
├── Package Manager
├── Configuration Tools
└── Applications
```

---

# 2. Major Linux Distribution Families

A simplified family tree:

```text
Linux
│
├── Debian Family
│   ├── Debian
│   ├── Ubuntu
│   └── Linux Mint
│
├── Red Hat Family
│   ├── RHEL
│   ├── Fedora
│   ├── Rocky Linux
│   └── AlmaLinux
│
├── Arch Family
│   └── Arch Linux
│
└── SUSE Family
    ├── openSUSE
    └── SUSE Linux Enterprise
```

---

# 3. Debian

Debian is a major Linux distribution and the base for several other distributions.

Examples derived from the Debian ecosystem include:

```text
Debian
   │
   └── Ubuntu
         │
         └── Linux Mint
```

Debian commonly uses:

```text
.deb
```

packages.

Package management commonly uses:

```bash
apt
```

---

# 4. Ubuntu

Ubuntu is based on Debian.

It is widely used for:

* Development
* Servers
* Cloud
* Containers
* Learning Linux
* Desktop environments

Check Ubuntu information:

```bash
cat /etc/os-release
```

Package management:

```bash
sudo apt update
sudo apt install nginx
```

---

# 5. Red Hat Enterprise Linux

RHEL is an enterprise Linux distribution from Red Hat.

It is widely used in enterprise environments.

Common package format:

```text
.rpm
```

Common package management:

```text
dnf
rpm
```

---

# 6. Fedora

Fedora is a community Linux distribution sponsored by Red Hat.

It often provides newer technologies and acts as an upstream project for technologies used in the Red Hat ecosystem.

Package format:

```text
.rpm
```

Package manager:

```bash
dnf
```

---

# 7. Rocky Linux

Rocky Linux is an enterprise-oriented Linux distribution designed to be compatible with RHEL.

It is commonly encountered in:

* Servers
* Enterprise labs
* Cloud environments

Package management:

```bash
dnf
rpm
```

---

# 8. AlmaLinux

AlmaLinux is another enterprise-oriented Linux distribution compatible with the RHEL ecosystem.

Common tools:

```bash
dnf
rpm
```

---

# 9. Amazon Linux

Amazon Linux is an AWS-oriented Linux distribution provided by AWS.

It is commonly used with:

```text
Amazon EC2
AWS workloads
Cloud applications
```

On an Amazon Linux EC2 instance, identify the OS with:

```bash
cat /etc/os-release
```

---

# 10. Package Formats

Two important package formats:

## DEB

Used by Debian-based distributions.

Examples:

```text
Debian
Ubuntu
```

Package file:

```text
package.deb
```

---

## RPM

Used by Red Hat-based distributions and related systems.

Examples:

```text
RHEL
Fedora
Rocky Linux
AlmaLinux
Amazon Linux
```

Package file:

```text
package.rpm
```

---

# 11. Package Managers

### APT

Common on Debian/Ubuntu:

```bash
sudo apt update
sudo apt install nginx
```

### DNF

Common on modern Red Hat-family distributions:

```bash
sudo dnf install nginx
```

### YUM

Older/common command in Red Hat-family systems:

```bash
sudo yum install nginx
```

### RPM

Low-level RPM package management:

```bash
rpm -qa
```

Detailed package-management topics are covered later under:

```text
08-Package-Management/
```

---

# 12. Distribution Comparison

| Distribution | Family                    | Package Format | Common Package Tool |
| ------------ | ------------------------- | -------------- | ------------------- |
| Debian       | Debian                    | DEB            | APT                 |
| Ubuntu       | Debian                    | DEB            | APT                 |
| RHEL         | Red Hat                   | RPM            | DNF                 |
| Fedora       | Red Hat                   | RPM            | DNF                 |
| Rocky Linux  | Red Hat                   | RPM            | DNF                 |
| AlmaLinux    | Red Hat                   | RPM            | DNF                 |
| Amazon Linux | Red Hat-related ecosystem | RPM            | DNF                 |

---

# 13. How to Identify Linux Distribution

Use:

```bash
cat /etc/os-release
```

Alternative:

```bash
hostnamectl
```

On systems where available:

```bash
lsb_release -a
```

---

# 14. Check Kernel Version

```bash
uname -r
```

Detailed:

```bash
uname -a
```

Remember:

```text
Distribution ≠ Kernel
```

For example:

```text
Ubuntu
  │
  └── Linux Kernel
```

Ubuntu is the distribution; Linux is the kernel.

---