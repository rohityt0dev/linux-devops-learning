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
- `blkid`
- `fdisk -l`
- `df`
- `du`
- `findmnt`
- Disk usage
- Inodes
- Disk troubleshooting
- AWS EBS storage

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

# 🔎 `blkid`

Display block device attributes:

```bash
sudo blkid
```

Example:

```text
/dev/nvme1n1p1: UUID="abc123..." TYPE="ext4"
```

This is especially useful when configuring `/etc/fstab`.

---

# 🔍 `fdisk`

List disks and partitions:

```bash
sudo fdisk -l
```

For a specific disk:

```bash
sudo fdisk -l /dev/nvme1n1
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

# 🧮 Inodes

Linux filesystems have a limited number of inodes.

Check inode usage:

```bash
df -i
```

Example:

```text
Filesystem      Inodes  IUsed  IFree IUse%
/dev/root      1300000 50000 1250000 4%
```

A server can have free disk space but still fail to create files if it runs out of inodes.

---

# ⚠️ Disk Full vs Inode Full

### Disk full

```bash
df -h
```

### Inode full

```bash
df -i
```

Example:

```text
Disk:
95% used

Inodes:
20% used
```

or:

```text
Disk:
30% used

Inodes:
100% used
```

The second situation can still prevent new files from being created.

---

# 🧪 Lab 1 — Identify Storage

Run:

```bash
lsblk
```

Then:

```bash
lsblk -f
```

Then:

```bash
sudo blkid
```

Then:

```bash
df -h
```

Document:

```text
Root disk:
Root partition:
Filesystem:
Size:
Used:
Available:
Mount point:
UUID:
```

---

# 🧪 Lab 2 — Find Large Directories

Check:

```bash
sudo du -h --max-depth=1 /var | sort -h
```

Find large files:

```bash
sudo find /var -type f -size +100M -ls
```

Investigate:

```text
Which directory is largest?
Which files are consuming the most space?
Can any logs be safely rotated or cleaned?
```

Do not delete files blindly on a production system.

---

# 🧪 Lab 3 — Monitor Disk Usage

Create:

```bash
nano disk-report.sh
```

Add:

```bash
#!/bin/bash

echo "=============================="
echo " Linux Disk Report"
echo "=============================="

echo
echo "Filesystem Usage:"
df -h

echo
echo "Inode Usage:"
df -i

echo
echo "Block Devices:"
lsblk

echo
echo "=============================="
```

Make executable:

```bash
chmod +x disk-report.sh
```

Run:

```bash
./disk-report.sh
```

---

# ☁️ AWS EBS Connection

Amazon EBS provides persistent block storage for EC2.

Example:

```text
AWS Console
     ↓
EBS Volume
     ↓
Attach to EC2
     ↓
Linux detects device
     ↓
lsblk
     ↓
Partition / Format
     ↓
Mount
```

After attaching an EBS volume, check:

```bash
lsblk
```

You may see:

```text
nvme0n1  20G  disk
nvme1n1  100G disk
```

The exact device name depends on the EC2 environment.

---

# 🧪 AWS EBS Lab

Attach a test EBS volume to an EC2 instance.

Then:

```bash
lsblk
```

Identify the new disk.

Check:

```bash
sudo fdisk -l
```

Document:

```text
EBS size:
Linux device:
Existing partitions:
Mount point:
Filesystem:
```

Do not format a disk until you have confirmed it is the new volume. Formatting the wrong disk can destroy data.

---

# 🛠️ Disk Troubleshooting

### Disk appears full

```bash
df -h
```

### Find large directories

```bash
sudo du -h --max-depth=1 /
```

### Find large files

```bash
sudo find / -type f -size +1G -ls
```

### Inode problem

```bash
df -i
```

### Check devices

```bash
lsblk
```

### Check filesystem

```bash
lsblk -f
```

### Check mount

```bash
findmnt
```

---

# 🎯 Interview Questions

### 1. How do you list disks?

```bash
lsblk
```

### 2. How do you list partitions?

```bash
sudo fdisk -l
```

### 3. How do you check filesystem usage?

```bash
df -h
```

### 4. How do you check directory usage?

```bash
du -sh /directory
```

### 5. How do you check UUID?

```bash
blkid
```

### 6. What is a block device?

A device that provides block-oriented storage access, such as a disk or partition.

### 7. What is the difference between `df` and `du`?

```text
df → filesystem-level usage
du → file/directory-level usage
```

### 8. Disk has free space but applications cannot create files. What do you check?

Check inode usage:

```bash
df -i
```

---

# ✅ Checklist

- [ ] Understand block devices
- [ ] Understand disk naming
- [ ] Use `lsblk`
- [ ] Use `blkid`
- [ ] Use `fdisk -l`
- [ ] Use `df -h`
- [ ] Use `du`
- [ ] Use `findmnt`
- [ ] Understand inodes
- [ ] Find large files
- [ ] Find large directories
- [ ] Monitor disk usage
- [ ] Identify an EBS volume
- [ ] Complete the disk-management lab

---

# 🔜 Next

Continue with:

```text
Partitions.md
```

Next you will learn how to create and manage disk partitions.