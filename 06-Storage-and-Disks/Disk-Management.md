# 💽 Linux Disk Management

Disk management is the process of identifying, monitoring, partitioning, formatting, mounting, and maintaining storage devices.

Linux storage management is especially important for:

- Linux servers
- Databases
- Web servers
- Application servers
- Log storage
- Backups
- AWS EC2
- Amazon EBS

---

# 🎯 Learning Objectives

You will learn:

- Linux storage devices
- Block devices
- Disk naming
- `lsblk`
- `df`
- `findmnt`
- Disk usage

---

# 🧠 What Is a Disk?

A disk is storage used to store data.

In a Linux system, disks may be:

```text
Physical HDD
Physical SSD
Virtual Disk
Cloud Volume
Network Storage
```

In AWS, an EBS volume appears to the Linux operating system as a block device.

---

# 🧱 Block Devices

Linux uses block devices for storage.

Examples:

```text
/dev/sda
/dev/sdb
/dev/vda
/dev/xvda
/dev/nvme0n1
```

Partitions:

```text
/dev/sda1
/dev/sda2

/dev/nvme0n1p1
/dev/nvme0n1p2
```

---

# 🔍 `lsblk`

The most useful command for identifying disks is:

```bash
lsblk
```

Example:

```text
NAME        SIZE TYPE MOUNTPOINTS
nvme0n1      20G disk
├─nvme0n1p1  19G part /
└─nvme0n1p2   1G part [SWAP]
nvme1n1      50G disk
```

Here:

```text
nvme0n1 = disk
nvme0n1p1 = partition
nvme1n1 = additional disk
```

---

# 📊 Detailed `lsblk`

Show filesystem information:

```bash
lsblk -f
```

Show all available columns:

```bash
lsblk -o NAME,SIZE,TYPE,FSTYPE,UUID,MOUNTPOINTS
```

---


# 📊 `df`

`df` shows filesystem disk usage.

Basic:

```bash
df
```

Human readable:

```bash
df -h
```

Example:

```text
Filesystem      Size  Used Avail Use%
/dev/root        20G    8G   12G  40%
```

---

# 📁 `du`

`du` shows directory/file space usage.

Example:

```bash
du -sh /var
```

Find largest directories:

```bash
sudo du -h --max-depth=1 /var
```

---

# 🔎 Find Large Files

Example:

```bash
sudo find /var -type f -size +500M -ls
```

This searches for files larger than 500 MB.

---

# 📌 Mounted Filesystems

Use:

```bash
findmnt
```

Or:

```bash
mount
```

A more readable option:

```bash
findmnt -t ext4
```

---
