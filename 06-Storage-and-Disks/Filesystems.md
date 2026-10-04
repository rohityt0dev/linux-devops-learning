# 🗂️ Linux Filesystems

A filesystem defines how files and directories are organized and stored on a storage device.

After creating a partition, you normally create a filesystem on it before mounting it for normal file storage.

---

# 🎯 Learning Objectives

You will learn:

- What a filesystem is
- Filesystem structure
- ext4
- XFS
- Filesystem types
- `mkfs`
- `lsblk -f`
- `blkid`
- `fsck`
- Filesystem labels
- Filesystem UUID
- Filesystem troubleshooting
- AWS filesystem usage

---

# 🧠 What Is a Filesystem?

A filesystem manages how data is stored on a disk.

Example:

```text
Disk
 ↓
Partition
 ↓
Filesystem
 ↓
Mount Point
 ↓
Files
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

---

# 📚 Common Linux Filesystems

| Filesystem | Common Usage |
|---|---|
| ext4 | General Linux filesystem |
| XFS | Enterprise/server workloads |
| Btrfs | Advanced Linux filesystem |
| tmpfs | Memory-backed temporary filesystem |
| FAT32 | Removable/compatibility storage |
| exFAT | Removable storage |

For cloud Linux servers, **ext4 and XFS** are especially common.

---

# 🟢 ext4

`ext4` is a widely used Linux filesystem.

Advantages include:

- Mature
- Stable
- Good general-purpose performance
- Supports large files
- Common on Linux systems

Create:

```bash
sudo mkfs.ext4 /dev/sdb1
```

⚠️ Formatting destroys existing filesystem data on the target device.

---

# 🔵 XFS

XFS is a high-performance filesystem commonly used in enterprise Linux environments.

Create:

```bash
sudo mkfs.xfs /dev/sdb1
```

Check:

```bash
lsblk -f
```

---

# 🔍 Check Filesystem Type

Use:

```bash
lsblk -f
```

Example:

```text
NAME   FSTYPE FSVER LABEL UUID                                 MOUNTPOINTS
sdb1   ext4   1.0         1234-5678                            /data
```

Or:

```bash
sudo blkid /dev/sdb1
```

---

# 🏷️ Filesystem Labels

A filesystem can have a label.

For ext4:

```bash
sudo e2label /dev/sdb1 DATA
```

For XFS:

```bash
sudo xfs_admin -L DATA /dev/sdb1
```

Check:

```bash
lsblk -f
```

---

# 🔢 UUID

A filesystem normally has a UUID.

Check:

```bash
sudo blkid
```

Example:

```text
/dev/sdb1: UUID="8a5e..." TYPE="ext4"
```

UUIDs are useful because device names can change in some environments.

---

# 🧪 Lab — Create ext4 Filesystem

Use a test partition.

Identify:

```bash
lsblk
```

Suppose:

```text
/dev/sdb1
```

Create filesystem:

```bash
sudo mkfs.ext4 /dev/sdb1
```

Check:

```bash
lsblk -f
```

Get UUID:

```bash
sudo blkid /dev/sdb1
```

---

# 🧪 Lab — Create XFS Filesystem

Use a different test partition.

Example:

```bash
sudo mkfs.xfs /dev/sdc1
```

Check:

```bash
lsblk -f
```

---

# ⚠️ Formatting Warning

Commands such as:

```bash
mkfs.ext4
mkfs.xfs
```

create a new filesystem.

They can destroy existing filesystem data on the target device.

Always verify:

```bash
lsblk
lsblk -f
```

before formatting.

---

# 🔧 Filesystem Check

For ext-family filesystems, `fsck` tools are used to check filesystem consistency.

For example:

```bash
sudo fsck /dev/sdb1
```

Do not run filesystem repair tools on a mounted filesystem unless the specific tool/filesystem documentation explicitly supports that operation.

For a typical offline check:

```text
Unmount filesystem
        ↓
Run filesystem check
        ↓
Repair if necessary
        ↓
Mount again
```

---

# 🔵 XFS Checking

XFS uses its own tools.

Check:

```bash
sudo xfs_info /dev/sdb1
```

For XFS repair, use:

```bash
sudo xfs_repair /dev/sdb1
```

This should normally be performed on an unmounted filesystem and with appropriate care.

---

# 📊 Filesystem Usage

Check:

```bash
df -h
```

Check inodes:

```bash
df -i
```

Check filesystem:

```bash
findmnt
```

---

# 🧪 Lab — Compare Filesystems

Create two test partitions:

```text
/dev/sdb1 → ext4
/dev/sdb2 → XFS
```

Check:

```bash
lsblk -f
```

Document:

```text
Partition
Filesystem
UUID
Label
Size
Mount point
```

Create a comparison:

| Feature | ext4 | XFS |
|---|---|---|
| Linux support | Excellent | Excellent |
| General purpose | Yes | Yes |
| Enterprise use | Yes | Very common |
| Online growth | Yes | Yes |
| Shrinking | Supported offline | Not supported |

---

# 📈 Filesystem Growth

For ext4, after increasing the underlying block device or logical volume:

```bash
sudo resize2fs /dev/sdb1
```

For XFS, the filesystem is typically grown while mounted:

```bash
sudo xfs_growfs /data
```

The exact procedure depends on how the storage is layered.

Example:

```text
EBS
 ↓
Partition
 ↓
Filesystem
 ↓
Mount
```

or:

```text
EBS
 ↓
LVM
 ↓
Logical Volume
 ↓
Filesystem
 ↓
Mount
```

---

# ☁️ AWS EBS Connection

When you attach an EBS volume to EC2, the operating system sees a block device.

Typical workflow:

```text
EBS
 ↓
Linux Block Device
 ↓
Partition (optional)
 ↓
Filesystem
 ↓
Mount Point
```

Example:

```bash
lsblk
```

Then:

```bash
sudo mkfs.ext4 /dev/nvme1n1
```

For a partitioned disk:

```bash
sudo mkfs.ext4 /dev/nvme1n1p1
```

Then mount it:

```bash
sudo mount /dev/nvme1n1p1 /data
```

---

# 🧪 AWS EBS Filesystem Lab

Attach a test EBS volume.

Check:

```bash
lsblk
```

Create a filesystem on the confirmed new device:

```bash
sudo mkfs.ext4 /dev/nvme1n1
```

Create mount point:

```bash
sudo mkdir /data
```

Mount:

```bash
sudo mount /dev/nvme1n1 /data
```

Check:

```bash
df -h /data
```

Verify:

```bash
findmnt /data
```

---

# 🛠️ Troubleshooting

### Filesystem not recognized

```bash
lsblk -f
```

### Wrong filesystem

```bash
blkid
```

### Mount fails

Check:

```bash
dmesg | tail
```

and:

```bash
journalctl -k
```

### Filesystem is full

```bash
df -h
```

### Inodes are full

```bash
df -i
```

---

# 🎯 Interview Questions

### 1. What is a filesystem?

A filesystem organizes and manages data stored on a storage device.

### 2. What is ext4?

A widely used Linux general-purpose filesystem.

### 3. What is XFS?

A high-performance filesystem widely used in enterprise Linux environments.

### 4. How do you create an ext4 filesystem?

```bash
sudo mkfs.ext4 /dev/device
```

### 5. How do you check filesystem type?

```bash
lsblk -f
```

### 6. How do you find UUID?

```bash
blkid
```

### 7. What is `fsck`?

A family of tools used to check and repair filesystem consistency for filesystems that support them.

### 8. Can you shrink XFS?

No. XFS does not support shrinking a filesystem in place.

### 9. How do you grow XFS?

Typically:

```bash
sudo xfs_growfs /mountpoint
```

### 10. Why is UUID useful?

UUID provides a stable filesystem identifier that can be used for persistent mounting.

---

# ✅ Checklist

- [ ] Understand filesystems
- [ ] Understand ext4
- [ ] Understand XFS
- [ ] Use `mkfs`
- [ ] Create ext4 filesystem
- [ ] Create XFS filesystem
- [ ] Use `lsblk -f`
- [ ] Use `blkid`
- [ ] Understand UUID
- [ ] Understand filesystem labels
- [ ] Understand `fsck`
- [ ] Understand XFS tools
- [ ] Check filesystem usage
- [ ] Check inode usage
- [ ] Grow ext4
- [ ] Grow XFS
- [ ] Complete EBS filesystem lab

---

# 🔜 Next

Continue with:

```text
Mounting.md
```

Next you will learn how to attach filesystems to the Linux directory tree and make mounts persistent.