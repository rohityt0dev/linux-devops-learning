# 🐧 Linux Fundamentals

Welcome to the **Linux Fundamentals** section of this repository.

This section introduces the core concepts of Linux that are important for **Cloud Engineers, DevOps Engineers, System Administrators, and Developers**.

The goal is to build a strong foundation before moving into Linux commands, users, permissions, networking, processes, services, package management, shell scripting, and system administration.

---

## 📚 Topics Covered

This section contains the following topics:

| #  | Topic               | File                                               |
| -- | ------------------- | -------------------------------------------------- |
| 01 | Linux Introduction  | [Linux-Introduction.md](./Linux-Introduction.md)   |
| 02 | Linux Distributions | [Linux-Distributions.md](./Linux-Distributions.md) |
| 03 | Linux File System   | [Linux-File-System.md](./Linux-File-System.md)     |
| 04 | Linux Boot Process  | [Linux-Boot-Process.md](./Linux-Boot-Process.md)   |

---

# 🎯 Learning Objectives

After completing this section, I should understand:

* What Linux is
* What the Linux kernel is
* Linux architecture
* Shell and terminal
* CLI vs GUI
* Linux vs Unix
* Linux vs Windows
* Open-source software
* Linux distributions
* Debian and Red Hat families
* DEB and RPM packages
* APT, DNF, YUM, and RPM
* Linux filesystem hierarchy
* Important Linux directories
* Absolute and relative paths
* Hidden files
* Mount points
* Linux boot process
* BIOS and UEFI
* POST
* Bootloader and GRUB
* Linux kernel during boot
* initramfs
* PID 1
* systemd
* systemd targets
* Linux services
* Boot logs and troubleshooting

---

# 🗂️ Section Structure

```text
01-Linux-Fundamentals/
│
├── README.md
│
├── Linux-Introduction.md
├── Linux-Distributions.md
├── Linux-File-System.md
└── Linux-Boot-Process.md
```

---

# 1. 🐧 Linux Introduction

**File:** `Linux-Introduction.md`

This topic introduces Linux and explains the basic components that make up a Linux system.

### Topics

* What is Linux?
* Linux Kernel
* Linux Architecture
* Shell
* Terminal
* CLI
* GUI
* Linux vs Unix
* Linux vs Windows
* Open Source
* Linux Characteristics
* Linux in Cloud Computing

### Important Concept

```text
Applications
      │
      ▼
   Libraries
      │
      ▼
     Shell
      │
      ▼
 Linux Kernel
      │
      ▼
   Hardware
```

### Cloud Engineer Relevance

Linux is heavily used in cloud environments.

For example:

```text
AWS
 │
 └── EC2
      │
      └── Linux Server
           │
           ├── Nginx
           ├── Application
           ├── Docker
           └── Monitoring
```

Understanding Linux is therefore an important foundation for working with AWS EC2 and other cloud services.

➡️ **Read:** [Linux-Introduction.md](./Linux-Introduction.md)

---

# 2. 📦 Linux Distributions

**File:** `Linux-Distributions.md`

A Linux distribution combines the Linux kernel with system utilities, libraries, package managers, configuration tools, and applications.

### Topics

* What is a Linux distribution?
* Debian
* Ubuntu
* Red Hat Enterprise Linux
* Fedora
* Rocky Linux
* AlmaLinux
* Amazon Linux
* Arch Linux
* openSUSE
* Distribution families
* DEB packages
* RPM packages
* APT
* DNF
* YUM
* RPM
* Checking distribution information
* Checking kernel version

### Distribution Families

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

### Important Commands

```bash
cat /etc/os-release
```

```bash
uname -r
```

```bash
uname -a
```

➡️ **Read:** [Linux-Distributions.md](./Linux-Distributions.md)

---

# 3. 📁 Linux File System

**File:** `Linux-File-System.md`

Linux uses a hierarchical filesystem that begins at the root directory:

```text
/
```

### Important Directories

| Directory | Purpose                        |
| --------- | ------------------------------ |
| `/`       | Root of the filesystem         |
| `/home`   | Normal users' home directories |
| `/root`   | Root user's home directory     |
| `/etc`    | System configuration           |
| `/var`    | Variable data and logs         |
| `/tmp`    | Temporary files                |
| `/boot`   | Boot-related files             |
| `/dev`    | Device files                   |
| `/proc`   | Process and kernel information |
| `/sys`    | Kernel/device information      |
| `/usr`    | User-space programs and data   |
| `/opt`    | Optional/additional software   |
| `/mnt`    | Temporary mount point          |
| `/media`  | Removable media                |
| `/srv`    | Data for services              |

### Important Path Concepts

Absolute path:

```text
/var/log
```

Relative path:

```text
log
```

Special paths:

```text
.       Current directory
..      Parent directory
~       Home directory
/       Filesystem root
```

### Important Commands

```bash
pwd
```

```bash
ls -la /
```

```bash
cd /var/log
```

```bash
echo $HOME
```

```bash
cat /etc/os-release
```

➡️ **Read:** [Linux-File-System.md](./Linux-File-System.md)

---

# 4. 🚀 Linux Boot Process

**File:** `Linux-Boot-Process.md`

The Linux boot process explains what happens from the moment a machine is powered on until the system becomes available.

### Basic Boot Flow

```text
Power ON
   │
   ▼
BIOS / UEFI
   │
   ▼
POST
   │
   ▼
Bootloader
   │
   ▼
GRUB
   │
   ▼
Linux Kernel
   │
   ▼
initramfs
   │
   ▼
PID 1
   │
   ▼
systemd
   │
   ▼
System Services
   │
   ▼
Login
```

### Topics

* Power On
* BIOS
* UEFI
* POST
* Bootloader
* GRUB
* Linux Kernel
* initramfs
* PID 1
* systemd
* systemd targets
* Services
* Login
* Boot time
* Boot logs
* Basic boot troubleshooting

### Important Commands

Check kernel:

```bash
uname -r
```

Check PID 1:

```bash
ps -p 1 -f
```

Check systemd:

```bash
systemctl --version
```

Check default target:

```bash
systemctl get-default
```

Analyze boot time:

```bash
systemd-analyze
```

Find slow services:

```bash
systemd-analyze blame
```

View current boot logs:

```bash
journalctl -b
```

View previous boot:

```bash
journalctl -b -1
```

➡️ **Read:** [Linux-Boot-Process.md](./Linux-Boot-Process.md)

---

# 🧪 Hands-On Practice

The best way to learn Linux is to practice these concepts on a real Linux system.

You can use:

* Ubuntu
* Amazon Linux
* Debian
* Rocky Linux
* Fedora
* AWS EC2
* VirtualBox
* VMware
* WSL

### Basic Practice

Check the operating system:

```bash
cat /etc/os-release
```

Check the kernel:

```bash
uname -r
```

Check your current directory:

```bash
pwd
```

List files:

```bash
ls -la
```

Check your home directory:

```bash
echo $HOME
```

Check your shell:

```bash
echo $SHELL
```

Check PID 1:

```bash
ps -p 1 -f
```

Check boot time:

```bash
systemd-analyze
```

---

# ☁️ Cloud Engineer Connection

These fundamentals are especially useful when working with cloud infrastructure.

For example, an AWS EC2 Linux server may look like:

```text
                  Internet
                     │
                     ▼
              AWS Load Balancer
                     │
                     ▼
                EC2 Instance
                     │
                     ▼
                Linux OS
                     │
        ┌────────────┼────────────┐
        ▼            ▼            ▼
      Nginx      Application     Docker
        │
        ▼
      Logs
```

A Cloud Engineer should be comfortable with:

* Linux filesystem
* Linux commands
* Users and groups
* Permissions
* Processes
* Services
* Networking
* Package management
* Logs
* SSH
* Shell scripting
* Troubleshooting

These topics will be covered in later sections of this repository.

---

# 📝 Key Takeaways

After completing this section, I should be able to explain:

### Linux

> Linux is an open-source, Unix-like kernel used as the foundation of many operating systems and cloud workloads.

### Distribution

> A Linux distribution combines the Linux kernel with system utilities, libraries, package management, configuration tools, and applications.

### Filesystem

> Linux uses a hierarchical filesystem beginning at `/`.

### Shell

> A shell is a command interpreter used to interact with the operating system.

### Boot Process

> The Linux boot process generally moves from firmware to bootloader, kernel/initramfs, PID 1/systemd, services, and finally login.

---

```

The next section will focus on practical Linux commands such as:

* Basic commands
* File and directory commands
* Text processing
* Search commands
* Archive and compression
* Command reference

---

# 🎯 Recommended Learning Order

Follow the topics in this order:

```text
Linux Introduction
        │
        ▼
Linux Distributions
        │
        ▼
Linux File System
        │
        ▼
Linux Boot Process

```

This provides a foundation for the more advanced Linux and Cloud/DevOps topics later in the repository.

---

## 📌 Progress Checklist

* [ ] Linux Introduction
* [ ] Linux Distributions
* [ ] Linux File System
* [ ] Linux Boot Process
* [ ] Practice basic Linux commands
* [ ] Understand Linux filesystem hierarchy
* [ ] Understand Linux boot sequence
* [ ] Identify Linux distributions
* [ ] Identify Linux kernel version
* [ ] Practice systemd commands
* [ ] Practice Linux on a real environment

---

## 🚀 Goal

The goal of this section is not only to memorize Linux concepts, but to build enough practical understanding to confidently work with **Linux servers in AWS, Cloud, DevOps, and real-world infrastructure environments**.
