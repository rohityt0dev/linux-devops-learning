# 📋 Linux `/etc/fstab`

`/etc/fstab` stands for:

> **File System Table**

It contains information about filesystems that Linux can mount automatically.

It is commonly used to make storage persistent across system reboots.

For AWS EC2, `/etc/fstab` is especially important when you attach an EBS volume and want it mounted automatically after reboot.

---

# 🎯 Learning Objectives

You will learn:

- What `/etc/fstab` is
- `/etc/fstab` structure
- Device names
- UUID
- Filesystem type
- Mount options
- Dump field
- fsck field
- Persistent mounts
- `mount -a`
- Testing fstab safely
- Troubleshooting boot issues
- AWS EBS persistent storage

---

# 🧠 What Is `/etc/fstab`?

The file:

```text
/etc/fstab
```

contains filesystem mount configuration.

View it:

```bash
cat /etc/fstab
```

Example:

```text
UUID=xxxx-xxxx  /data  ext4  defaults  0  2
```

This tells Linux:

```text
Filesystem
    ↓
Mount at /data
    ↓
Use ext4
    ↓
Use default options
```

---

# 📐 `/etc/fstab` Structure

Each entry generally contains six fields:

```text
<filesystem> <mountpoint> <type> <options> <dump> <fsck>
```

Example:

```text
UUID=1234-abcd /data ext4 defaults 0 2
```

---

# 🔢 Field 1 — Filesystem

This identifies what should be mounted.

Possible forms include:

```text
UUID=...
LABEL=...
/dev/device
```

Recommended:

```text
UUID=...
```

---

# 📁 Field 2 — Mount Point

Example:

```text
/data
```

The directory must normally exist:

```bash
sudo mkdir -p /data
```

---

# 🗂️ Field 3 — Filesystem Type

Examples:

```text
ext4
xfs
vfat
```

Example:

```text
UUID=1234  /data  ext4  defaults  0  2
```

---

# ⚙️ Field 4 — Mount Options

Common option:

```text
defaults
```

Other examples:

```text
ro
rw
noexec
nosuid
nodev
```

For a standard data filesystem:

```text
defaults
```

is often appropriate, subject to your system and application requirements.

---


# 🧪 Example `/etc/fstab`

```text
UUID=aaaa-bbbb  /data  ext4  defaults  0  2
```

Meaning:

```text
UUID
 ↓
Mount at /data
 ↓
ext4 filesystem
 ↓
Default options
 ↓
No dump
 ↓
fsck order 2
```

---
