# 🧱 Linux Disk Partitions

Partitioning divides a physical or virtual disk into one or more logical sections called partitions.

Partitions allow different areas of a disk to be used for different purposes.

---

# 🎯 Learning Objectives

You will learn:

- What a partition is
- Partition tables
- MBR
- GPT
- Primary partitions
- Extended partitions
- Logical partitions
- `fdisk`
- `parted`
- Creating partitions
- Deleting partitions
- Partition verification
- AWS EBS partitioning

---

# 🧠 What Is a Partition?

A partition is a logical division of a disk.

Example:

```text
/dev/sdb
│
├── /dev/sdb1
├── /dev/sdb2
└── /dev/sdb3
```

The disk is:

```text
/dev/sdb
```

The partitions are:

```text
/dev/sdb1
/dev/sdb2
/dev/sdb3
```

---

# 🗂️ Partition Table

A partition table stores information about the partitions on a disk.

Two common partitioning schemes are:

```text
MBR
GPT
```

---

# 🆚 MBR vs GPT

| Feature | MBR | GPT |
|---|---|---|
| Older standard | Yes | Newer |
| Maximum common disk size | ~2 TiB | Much larger |
| Number of partitions | Limited | Many |
| Modern systems | Less preferred | Preferred |
| UEFI support | Limited/legacy | Native |

For modern Linux systems, **GPT is generally preferred** for new disks.

---

# 🔍 Identify Partition Table

Run:

```bash
sudo fdisk -l
```

You may see:

```text
Disklabel type: gpt
```

or:

```text
Disklabel type: dos
```

`dos` indicates an MBR-style partition table in `fdisk` output.

---

# 🛠️ fdisk

`fdisk` is a command-line partition management tool.

List disks:

```bash
sudo fdisk -l
```

Open a disk:

```bash
sudo fdisk /dev/sdb
```

⚠️ Only use this on a test disk or a confirmed empty disk.

---

# 📋 Useful fdisk Commands

Inside `fdisk`:

| Command | Purpose |
|---|---|
| `p` | Print partition table |
| `n` | Create partition |
| `d` | Delete partition |
| `t` | Change partition type |
| `l` | List partition types |
| `w` | Write changes |
| `q` | Quit without saving |

---

# 🧪 Lab — Create a Partition

Use an additional test disk.

First identify it:

```bash
lsblk
```

Suppose the disk is:

```text
/dev/sdb
```

Open:

```bash
sudo fdisk /dev/sdb
```

Print current table:

```text
p
```

Create partition:

```text
n
```

Accept appropriate defaults for a test disk.

Print:

```text
p
```

Write:

```text
w
```

Then:

```bash
lsblk
```

You should see something similar to:

```text
sdb
└─sdb1
```

---

# 🔄 Ask Kernel to Re-read Partition Table

Usually `fdisk` handles this, but if necessary:

```bash
sudo partprobe /dev/sdb
```

Then:

```bash
lsblk
```

---

# 🧰 parted

Another partitioning tool is:

```bash
sudo parted /dev/sdb
```

View partition table:

```bash
sudo parted /dev/sdb print
```

---

# 🆕 Create GPT with parted

On a test disk:

```bash
sudo parted /dev/sdb
```

Then:

```text
mklabel gpt
```

Create partition:

```text
mkpart primary ext4 0% 100%
```

Then:

```text
print
```

Exit:

```text
quit
```

⚠️ `mklabel` can destroy existing partition-table information. Never run it on a disk containing data you need.

---

# 🧹 Delete a Partition

Using `fdisk`:

```bash
sudo fdisk /dev/sdb
```

Then:

```text
d
```

Select the partition.

Check:

```text
p
```

Write:

```text
w
```

Again, only perform this on a test disk or when you have confirmed the data can be destroyed.

---

# 🧠 Partition vs Filesystem

These are different concepts.

```text
Disk
 ↓
Partition
 ↓
Filesystem
 ↓
Mount Point
```

Example:

```text
/dev/sdb
 ↓
/dev/sdb1
 ↓
ext4
 ↓
/data
```

A partition by itself does not provide the normal filesystem structure needed to store files.

---

# 🧪 Lab — Partition Investigation

Run:

```bash
lsblk
```

Then:

```bash
sudo fdisk -l
```

Identify:

```text
Disk:
Partition:
Size:
Partition table:
Filesystem:
Mount point:
```

Create a diagram:

```text
Disk
 ↓
Partition
 ↓
Filesystem
 ↓
Mount
```

---

# ☁️ AWS EBS Connection

An EBS volume attached to EC2 may appear as a device such as:

```text
/dev/nvme1n1
```

You can inspect it:

```bash
lsblk
```

If you need a partition:

```bash
sudo fdisk /dev/nvme1n1
```

After creating the partition:

```bash
lsblk
```

Example:

```text
nvme1n1
└─nvme1n1p1
```

Then you can create a filesystem:

```bash
sudo mkfs.ext4 /dev/nvme1n1p1
```

---

# ⚠️ Important Safety Rule

Before partitioning:

```bash
lsblk
```

Before formatting:

```bash
lsblk -f
```

Before deleting a partition:

```bash
sudo fdisk -l
```

Always verify the correct device.

Never assume:

```text
/dev/sdb
```

is empty.

---

# 🎯 Interview Questions

### 1. What is a partition?

A logical division of a disk.

### 2. What is GPT?

GPT is a modern partition table standard commonly used on modern systems.

### 3. What is MBR?

MBR is an older partitioning scheme with historical limitations such as the common ~2 TiB disk-size limit.

### 4. What is `fdisk`?

A command-line tool for managing disk partitions.

### 5. What is `parted`?

A disk partitioning utility that supports modern partition tables including GPT.

### 6. Can you store files directly on a partition?

Normally, you create a filesystem on the partition before using it as a normal file-storage mount.

### 7. What is `/dev/sdb1`?

It commonly represents the first partition on the `/dev/sdb` disk.

### 8. How do you check partitions?

```bash
lsblk
```

or:

```bash
sudo fdisk -l
```

---

# ✅ Checklist

- [ ] Understand partitions
- [ ] Understand partition tables
- [ ] Understand GPT
- [ ] Understand MBR
- [ ] Use `fdisk`
- [ ] Use `parted`
- [ ] Create a test partition
- [ ] Delete a test partition
- [ ] Use `partprobe`
- [ ] Understand partition vs filesystem
- [ ] Identify EBS device
- [ ] Safely partition an EBS test volume

---

# 🔜 Next

Continue with:

```text
Filesystems.md
```

Next you will learn how Linux creates and manages filesystems such as **ext4 and XFS**.