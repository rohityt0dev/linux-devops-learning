# 🚀 Linux Boot Process

## 📌 Overview

The Linux boot process is the sequence of events that occurs after a computer is powered on until the operating system becomes ready for users and applications.

A simplified flow is:

```text
Power ON
   │
   ▼
BIOS / UEFI
   │
   ▼
Bootloader
   │
   ▼
Linux Kernel
   │
   ▼
initramfs / initrd
   │
   ▼
systemd / init
   │
   ▼
System Services
   │
   ▼
Login
```

The exact boot sequence depends on the hardware, distribution, bootloader, and configuration.

---

# 🎯 Learning Objectives

After completing this topic, I should understand:

* BIOS
* UEFI
* POST
* Bootloader
* GRUB
* Linux kernel
* initramfs
* init
* systemd
* PID 1
* Targets
* Services
* Boot logs
* Basic boot troubleshooting

---

# 1. Power On

The process begins when the system is powered on.

```text
Power ON
   │
   ▼
Firmware
```

The system firmware initializes hardware and determines how to continue booting.

---

# 2. BIOS

BIOS stands for:

**Basic Input/Output System**

It is traditional system firmware used to initialize hardware and begin the boot process.

BIOS systems commonly perform:

```text
Power ON
   ↓
POST
   ↓
Find boot device
   ↓
Load bootloader
```

---

# 3. UEFI

UEFI stands for:

**Unified Extensible Firmware Interface**

It is the modern replacement for traditional BIOS firmware.

UEFI can:

* Initialize hardware
* Locate boot entries
* Access EFI system partitions
* Start bootloaders

Check whether your system uses UEFI:

```bash
test -d /sys/firmware/efi && echo "UEFI" || echo "Legacy BIOS"
```

---

# 4. POST

POST means:

**Power-On Self-Test**

The firmware performs initial hardware checks.

Examples:

```text
CPU
Memory
Keyboard
Storage
Other hardware
```

If hardware problems occur, firmware may display errors or diagnostic messages.

---

# 5. Bootloader

The bootloader is responsible for starting the operating system.

A common Linux bootloader is:

```text
GRUB
```

GRUB stands for:

**GRand Unified Bootloader**

Simplified:

```text
Firmware
   │
   ▼
GRUB
   │
   ├── Linux Kernel
   └── initramfs
```

---

# 6. Linux Kernel

The bootloader loads the Linux kernel into memory.

The kernel then begins initializing the operating system.

The kernel is responsible for:

* CPU management
* Memory management
* Device management
* Process management
* Networking
* Filesystems

Check the running kernel:

```bash
uname -r
```

---

# 7. initramfs

`initramfs` means:

**Initial RAM Filesystem**

It is a temporary filesystem loaded into RAM during early boot.

It provides tools and modules needed to continue booting.

For example, it may provide:

* Storage drivers
* Filesystem drivers
* RAID support
* LVM support
* Encryption support

The exact contents depend on the distribution and system configuration.

---

# 8. PID 1

After the kernel finishes early initialization, userspace startup begins.

The first userspace process is:

```text
PID 1
```

On many modern Linux distributions, PID 1 is:

```text
systemd
```

Check:

```bash
ps -p 1 -f
```

Another command:

```bash
systemctl status
```

---

# 9. systemd

`systemd` is a system and service manager used by many Linux distributions.

It manages:

* System startup
* Services
* Dependencies
* Mounts
* Logging integration
* Targets
* Shutdown/reboot

Check:

```bash
systemctl --version
```

---

# 10. Boot Targets

systemd uses targets to group units and represent system states.

Check the default target:

```bash
systemctl get-default
```

Example:

```text
multi-user.target
```

or:

```text
graphical.target
```

List targets:

```bash
systemctl list-units --type=target
```

---

# 11. Services Start

During boot, systemd starts required services.

Examples:

```text
SSH
Network
Web Server
Logging
Database
```

Check running services:

```bash
systemctl --type=service
```

Check a service:

```bash
systemctl status ssh
```

On some distributions the service may be named differently, such as:

```bash
systemctl status sshd
```

---

# 12. Login

After the required system components and services start, the system becomes available for login.

For a server:

```text
SSH Login
```

For a desktop:

```text
Graphical Login
```

---

# 13. Complete Boot Flow

```text
                    POWER ON
                        │
                        ▼
                BIOS / UEFI
                        │
                        ▼
                      POST
                        │
                        ▼
                   Boot Device
                        │
                        ▼
                     GRUB
                        │
                 ┌──────┴──────┐
                 ▼             ▼
              Kernel       initramfs
                 │             │
                 └──────┬──────┘
                        ▼
                      PID 1
                    systemd
                        │
                        ▼
                systemd Targets
                        │
                        ▼
                  System Services
                        │
                        ▼
                      Login
```

---

# 14. Check Boot Time

Run:

```bash
systemd-analyze
```

Example:

```text
Startup finished in ...
```

---

# 15. Find Slow Services

Run:

```bash
systemd-analyze blame
```

This shows services and units that took time during startup.

---

# 16. Check Boot Logs

View logs from the current boot:

```bash
journalctl -b
```

View recent boot messages:

```bash
journalctl -b -n 50
```

View kernel messages:

```bash
dmesg | head -50
```

---

# 17. Check Previous Boot

List available boots:

```bash
journalctl --list-boots
```

If previous boots are available:

```bash
journalctl -b -1
```

`-1` refers to the previous boot.

---