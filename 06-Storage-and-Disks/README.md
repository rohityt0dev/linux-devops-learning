# 💾 Linux Storage and Disks

Linux storage management is an essential skill for **Linux Administration, AWS Cloud Engineering, DevOps, and SRE**.

Applications need storage for:

- Operating system files
- Application data
- Logs
- Databases
- Backups
- Docker data
- User files

In AWS, Linux storage knowledge is especially important when working with **Amazon EBS volumes attached to EC2 instances**.

This section teaches you how to inspect disks, create partitions, create filesystems, mount storage, manage LVM, and configure persistent mounts using `/etc/fstab`.

---

# 🎯 Learning Objectives

By completing this section, you will understand:

- Linux storage architecture
- Block devices
- Disk devices
- HDD vs SSD concepts
- AWS EBS volumes
- `lsblk`
- `blkid`
- `df`
- `du`
- `fdisk`
- `parted`
- Disk partitions
- GPT and MBR
- Filesystems
- ext4
- XFS
- Filesystem creation
- Mount points
- Temporary mounts
- Persistent mounts
- UUID
- `/etc/fstab`
- LVM
- Physical Volumes
- Volume Groups
- Logical Volumes
- Extending storage
- Storage troubleshooting

---

# 📚 Topics

| File | Topic |
|---|---|
| [Disk-Management.md](./Disk-Management.md) | Disk discovery, usage and management |
| [Partitions.md](./Partitions.md) | Partitioning disks |
| [Filesystems.md](./Filesystems.md) | Linux filesystems |
| [Mounting.md](./Mounting.md) | Mounting and unmounting storage |
| [LVM.md](./LVM.md) | Logical Volume Manager |
| [fstab.md](./fstab.md) | Persistent filesystem mounts |

---

# 🏗️ Linux Storage Architecture

A simplified Linux storage structure:

```text
Physical / Virtual Disk
        │
        ↓
     Partition
        │
        ↓
   Filesystem
        │
        ↓
    Mount Point
        │
        ↓
   Files and Directories
```

For LVM:

```text
Disk
 ↓
Partition
 ↓
Physical Volume (PV)
 ↓
Volume Group (VG)
 ↓
Logical Volume (LV)
 ↓
Filesystem
 ↓
Mount Point
```

---

# 💽 Linux Block Devices

Linux represents disks as block devices.

Common examples:

```text
/dev/sda
/dev/sdb
/dev/vda
/dev/nvme0n1
```

Partitions may look like:

```text
/dev/sda1
/dev/sda2

/dev/nvme0n1p1
/dev/nvme0n1p2
```

---

# 🔍 Identify Disks

Use:

```bash
lsblk
```

More details:

```bash
lsblk -f
```

Show filesystem information:

```bash
blkid
```

---

# 📊 Check Disk Space

Filesystem usage:

```bash
df -h
```

Human-readable output:

```text
Filesystem      Size  Used Avail Use%
/dev/root        20G   8G   12G  40%
```

---

# 📁 Check Directory Usage

Use:

```bash
du -sh /var
```

Find large directories:

```bash
du -h --max-depth=1 /
```

For a specific directory:

```bash
du -h --max-depth=1 /var
```

---

# 🧱 Partitions

A physical disk can be divided into partitions.

Example:

```text
/dev/sdb
│
├── /dev/sdb1
├── /dev/sdb2
└── /dev/sdb3
```

Partitioning is covered in:

```text
Partitions.md
```

---

# 🗂️ Filesystems

A filesystem determines how Linux stores and organizes files.

Common Linux filesystems:

```text
ext4
XFS
Btrfs
```

Check filesystem:

```bash
lsblk -f
```

---

# 📌 Mount Points

A filesystem must normally be mounted before applications can access it through the directory tree.

Example:

```text
/dev/sdb1
    ↓
/data
```

Then:

```bash
ls /data
```

---

# 🔢 UUID

Every filesystem normally has a UUID.

Check:

```bash
blkid
```

Example:

```text
UUID="8f5e6d9a-..."
```

UUIDs are commonly used in `/etc/fstab`.

---

# 🧠 LVM

LVM provides flexible storage management.

Architecture:

```text
Disk
 ↓
PV
 ↓
VG
 ↓
LV
 ↓
Filesystem
 ↓
Mount Point
```

LVM is covered in:

```text
LVM.md
```

---

# ☁️ AWS Connection

This section is extremely important for AWS EC2.

Typical AWS storage architecture:

```text
AWS EC2
   │
   ├── Root EBS Volume
   │
   └── Additional EBS Volume
             ↓
          Linux Disk
             ↓
         Partition
             ↓
        Filesystem
             ↓
          /data
```

Example:

```text
EBS Volume
   ↓
/dev/nvme1n1
   ↓
/dev/nvme1n1p1
   ↓
ext4
   ↓
/data
```

The exact device name can vary depending on the EC2 instance type and operating system.

---

# 🧪 Full Storage Lab

Use a **test VM or additional AWS EBS volume**.

Do not experiment with partitioning your production/root disk.

---

## Step 1 — Identify disks

```bash
lsblk
```

---

## Step 2 — Check filesystems

```bash
lsblk -f
```

---

## Step 3 — Check disk usage

```bash
df -h
```

---

## Step 4 — Find large directories

```bash
sudo du -h --max-depth=1 /var
```

---

## Step 5 — Attach an additional disk

On AWS:

```text
EC2
 ↓
EBS
 ↓
Attach Volume
 ↓
Linux detects device
```

Then:

```bash
lsblk
```

---

## Step 6 — Partition

Use:

```bash
sudo fdisk /dev/nvme1n1
```

---

## Step 7 — Create filesystem

Example:

```bash
sudo mkfs.ext4 /dev/nvme1n1p1
```

---

## Step 8 — Create mount point

```bash
sudo mkdir /data
```

---

## Step 9 — Mount

```bash
sudo mount /dev/nvme1n1p1 /data
```

---

## Step 10 — Verify

```bash
df -h /data
```

and:

```bash
lsblk -f
```

---

## Step 11 — Get UUID

```bash
sudo blkid /dev/nvme1n1p1
```

---

## Step 12 — Configure `/etc/fstab`

Add the filesystem using its UUID.

Then test:

```bash
sudo mount -a
```

---

# 🧪 Storage Mini Project

## AWS EC2 Additional EBS Storage

Build:

```text
EC2
 │
 └── EBS Volume
       │
       ↓
    Linux Disk
       │
       ↓
    Partition
       │
       ↓
    ext4/XFS
       │
       ↓
     /data
       │
       ↓
 Application Data
```

Document:

- EBS volume size
- Device name
- Partition
- Filesystem
- UUID
- Mount point
- `/etc/fstab` configuration
- Verification commands
- Troubleshooting steps

---

# 🛠️ Storage Troubleshooting

### Check disks

```bash
lsblk
```

### Check filesystem

```bash
lsblk -f
```

### Check UUID

```bash
blkid
```

### Check mounted filesystems

```bash
findmnt
```

### Check disk space

```bash
df -h
```

### Check inode usage

```bash
df -i
```

### Check directory size

```bash
du -sh /directory
```

---

# 🎯 Interview Questions

1. What is a block device?
2. What is a partition?
3. What is a filesystem?
4. What is the difference between `/dev/sda` and `/dev/sda1`?
5. What is UUID?
6. What is `lsblk`?
7. What is `df -h`?
8. What is `du -sh`?
9. What is mounting?
10. What is `/etc/fstab`?
11. What is LVM?
12. What is a Physical Volume?
13. What is a Volume Group?
14. What is a Logical Volume?
15. How do you extend an LVM volume?
16. How do you troubleshoot a full disk?
17. How do you attach an EBS volume to Linux?
18. How do you make an EBS mount persistent after reboot?

---

# ☁️ AWS Skills You Are Building

After this section you should be comfortable with:

```text
EC2
 ↓
EBS
 ↓
Linux Device
 ↓
Partition
 ↓
Filesystem
 ↓
Mount
 ↓
Persistent Storage
```

These skills are frequently tested in AWS Cloud Engineer interviews.

---

# ✅ Section Checklist

- [ ] Understand Linux storage
- [ ] Understand block devices
- [ ] Use `lsblk`
- [ ] Use `blkid`
- [ ] Use `df`
- [ ] Use `du`
- [ ] Understand partitions
- [ ] Understand GPT
- [ ] Understand MBR
- [ ] Understand filesystems
- [ ] Create ext4 filesystem
- [ ] Create XFS filesystem
- [ ] Mount storage
- [ ] Unmount storage
- [ ] Understand UUID
- [ ] Understand `/etc/fstab`
- [ ] Understand LVM
- [ ] Create PV
- [ ] Create VG
- [ ] Create LV
- [ ] Extend storage
- [ ] Complete EBS storage lab

---

# 🔜 Next Section

Continue your Linux learning journey with:

```text
07-Networking/
```

You will learn:

```text
IP Addresses
DNS
SSH
Network Commands
Ports
Network Troubleshooting
```

These topics will connect directly with **AWS VPC, Security Groups, NAT Gateway, Internet Gateway, and EC2 networking**.