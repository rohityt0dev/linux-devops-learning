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


---