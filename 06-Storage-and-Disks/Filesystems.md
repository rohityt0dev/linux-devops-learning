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
| tmpfs | Memory-backed temporary filesystem |

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
