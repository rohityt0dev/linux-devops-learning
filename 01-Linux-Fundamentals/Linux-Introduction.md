# 🐧 Linux Introduction

## 📌 Overview

Linux is an open-source, Unix-like operating system kernel. It is widely used in:

* Cloud computing
* Servers
* AWS EC2
* DevOps
* Containers
* Kubernetes
* Networking
* Cybersecurity
* Embedded systems
* Supercomputers

Linux is especially important for a Cloud Engineer because many cloud workloads run on Linux-based servers.

---

# 🎯 Learning Objectives

After completing this topic, I should understand:

* What Linux is
* What the Linux kernel is
* Linux architecture
* Linux vs Unix
* Linux vs Windows
* Open-source software
* Linux distributions
* Shell and terminal
* GUI vs CLI
* Linux use cases
* Why Linux is important for Cloud/DevOps

---

# 1. What is Linux?

Linux is an open-source operating system kernel originally created by Linus Torvalds in 1991.

Technically:

```text
Linux = Kernel
```

A complete Linux operating system normally combines the Linux kernel with system utilities, libraries, package managers, applications, and other components.

Examples:

```text
Ubuntu
Debian
Red Hat Enterprise Linux
Fedora
Rocky Linux
Amazon Linux
AlmaLinux
```

These are called **Linux distributions**.

---

# 2. What is a Kernel?

The kernel is the core component of an operating system.

It acts as an interface between applications and hardware.

```text
Applications
     │
     ▼
Libraries / System Calls
     │
     ▼
Linux Kernel
     │
     ├── CPU
     ├── Memory
     ├── Disk
     ├── Network
     └── Devices
```

The kernel manages:

* CPU
* Memory
* Processes
* Storage
* Networking
* Hardware devices
* System calls

---

# 3. Linux Architecture

A simplified Linux architecture:

```text
+---------------------------+
|       Applications        |
+---------------------------+
|     Shell / Utilities     |
+---------------------------+
|        Libraries          |
+---------------------------+
|      Linux Kernel         |
+---------------------------+
|         Hardware          |
+---------------------------+
```

### Hardware

Physical resources:

```text
CPU
RAM
Disk
Network Card
USB Devices
```

### Kernel

Controls access to hardware.

### Libraries

Provide reusable functionality to applications.

### Shell

Provides a command-line interface to interact with the system.

### Applications

Examples:

```text
Web Server
Database
Docker
Git
Python
Nginx
Apache
```

---

# 4. What is a Shell?

A shell is a command interpreter.

It allows users to communicate with the operating system using commands.

Example:

```bash
pwd
ls
cd /etc
```

Common Linux shells include:

```text
Bash
Zsh
Fish
Ksh
```

Bash is one of the most commonly encountered shells in Linux environments.

Check your shell:

```bash
echo $SHELL
```

Check the current shell process:

```bash
ps -p $$
```

---

# 5. What is a Terminal?

A terminal is an interface through which we interact with the shell.

Example:

```text
Terminal
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

The terminal itself is not the shell.

---

# 6. CLI vs GUI

## CLI

CLI means:

**Command Line Interface**

Example:

```bash
ls
cd /var/log
pwd
```

Advantages:

* Fast
* Scriptable
* Remote administration
* Low resource usage
* Excellent for automation

---

## GUI

GUI means:

**Graphical User Interface**

Examples:

* Desktop
* Windows
* Icons
* Menus
* Mouse interaction

Linux can run with or without a graphical desktop environment.

Server environments commonly use CLI-based administration.

---

# 7. Linux vs Unix

Linux and Unix are related but are not the same operating system.

| Feature  | Linux                             | Unix                                         |
| -------- | --------------------------------- | -------------------------------------------- |
| Origin   | Developed in 1991                 | Earlier Unix systems                         |
| Source   | Open-source kernel                | Traditionally proprietary or vendor-specific |
| Usage    | Servers, cloud, desktop, embedded | Enterprise/server systems                    |
| Examples | Ubuntu, Debian, Fedora            | AIX, Solaris, HP-UX                          |
| Cost     | Many free distributions           | Often commercial                             |

Linux was designed as a Unix-like operating system.

---

# 8. Linux vs Windows

| Feature            | Linux               | Windows                    |
| ------------------ | ------------------- | -------------------------- |
| Source             | Open-source         | Proprietary                |
| CLI                | Very important      | PowerShell / CMD           |
| Server usage       | Very common         | Very common                |
| File system        | `/` root hierarchy  | Drive letters such as `C:` |
| Package management | APT, DNF, YUM, etc. | Windows package tools      |
| Customization      | High                | More controlled            |
| Cloud usage        | Very common         | Very common                |

---

# 9. Open Source

Linux is open-source software.

This means its source code is available under open-source licensing.

Benefits include:

* Transparency
* Community development
* Customization
* Collaboration
* Large ecosystem

Open source does not automatically mean that every Linux distribution or every component is free of charge.

---

# 10. Important Linux Characteristics

Linux provides:

### Multiuser

Multiple users can use the same system.

### Multitasking

Multiple processes can run at the same time.

### Portable

Linux runs on many hardware architectures.

### Secure

Linux provides mechanisms such as:

* Users
* Groups
* Permissions
* Authentication
* Access controls

Detailed security topics are covered later in this repository.

### Stable

Linux is widely used for long-running server workloads.

---

# 11. Linux in Cloud Computing

Linux is extremely important in cloud environments.

Typical architecture:

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

Example:

```text
Internet
    │
    ▼
AWS Load Balancer
    │
    ▼
EC2 Linux Server
    │
    ├── Nginx
    ├── Application
    └── Logs
```

---