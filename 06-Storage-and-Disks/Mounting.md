# 📌 Linux Mounting

Mounting is the process of attaching a filesystem to a directory in the Linux filesystem tree.

Once mounted, users and applications can access the filesystem through that directory.

---

# 🎯 Learning Objectives

You will learn:

- What mounting means
- Mount points
- `mount`
- `umount`
- `findmnt`
- Temporary mounts
- Persistent mounts
- UUID-based mounts
- Mount options
- Read-only mounts
- Mount troubleshooting
- AWS EBS mounting

---

# 🧠 What Is Mounting?

Linux uses a single directory tree.

A filesystem can be attached to this tree at a directory called a **mount point**.

Example:

```text
/
├── home
├── var
├── etc
└── data
      ↑
   mounted filesystem
```

Example:

```text
/dev/sdb1
    ↓
   /data
```

---

# 📁 Create Mount Point

Create:

```bash
sudo mkdir /data
```

---

# 🔗 Mount a Filesystem

Example:

```bash
sudo mount /dev/sdb1 /data
```

Verify:

```bash
findmnt /data
```

Check:

```bash
df -h /data
```

---

# 🔍 View All Mounts

```bash
mount
```

Better:

```bash
findmnt
```

Filesystem tree:

```bash
findmnt -t ext4
```

---

# 📊 Verify Mount

Use:

```bash
lsblk -f
```

and:

```bash
df -h
```

Example:

```text
/dev/sdb1   20G   100M   19G   1%   /data
```

---

# 🧪 Lab 1 — Temporary Mount

Use a test disk.

Check:

```bash
lsblk
```

Create mount point:

```bash
sudo mkdir /data
```

Mount:

```bash
sudo mount /dev/sdb1 /data
```

Verify:

```bash
findmnt /data
```

Write a test file:

```bash
echo "Linux Storage Lab" | sudo tee /data/test.txt
```

Read:

```bash
cat /data/test.txt
```

---

# ⏏️ Unmount

Before unmounting, make sure no process is using the filesystem.

Check:

```bash
sudo lsof +f -- /data
```

or:

```bash
sudo fuser -vm /data
```

Unmount:

```bash
sudo umount /data
```

Verify:

```bash
findmnt /data
```

---

# ⚠️ Common Unmount Error

You may see:

```text
target is busy
```

This means a process is using the mount.

Find processes:

```bash
sudo lsof +f -- /data
```

or:

```bash
sudo fuser -vm /data
```

Common reason:

Your current shell is inside the mount:

```bash
cd /data
```

Move away:

```bash
cd ~
```

Then:

```bash
sudo umount /data
```

---

# 🔢 Mount Using UUID

Get UUID:

```bash
sudo blkid /dev/sdb1
```

Example:

```text
UUID="1234-abcd"
```

Mount manually:

```bash
sudo mount UUID="1234-abcd" /data
```

This is useful because device names can vary.

---

# 🏷️ Mount Using Label

If a filesystem has a label:

```bash
sudo mount LABEL=DATA /data
```

---

# 🔒 Read-Only Mount

Mount read-only:

```bash
sudo mount -o ro /dev/sdb1 /data
```

Check:

```bash
findmnt /data
```

---

# 🔄 Remount

Example:

```bash
sudo mount -o remount,rw /data
```

Use remount operations carefully and understand the existing mount options first.

---

# 📌 Mount Options

Common options:

| Option | Purpose |
|---|---|
| `ro` | Read-only |
| `rw` | Read-write |
| `noexec` | Prevent executable files |
| `nosuid` | Ignore set-user-ID/set-group-ID bits |
| `nodev` | Do not interpret device files |

Example:

```bash
sudo mount -o ro /dev/sdb1 /data
```

Security-sensitive mount options should be selected according to application requirements.

---

# 🧪 Lab 2 — Mount by UUID

Get UUID:

```bash
sudo blkid /dev/sdb1
```

Create mount point:

```bash
sudo mkdir -p /data
```

Mount:

```bash
sudo mount UUID="YOUR-UUID" /data
```

Verify:

```bash
findmnt /data
```

---

# 🔁 Temporary vs Persistent Mount

### Temporary

```bash
sudo mount /dev/sdb1 /data
```

This mount may disappear after reboot.

### Persistent

Configure:

```text
/etc/fstab
```

Then the system can mount it during boot.

---

# ☁️ AWS EBS Mounting

Typical workflow:

```text
AWS EBS
   ↓
Attach to EC2
   ↓
lsblk
   ↓
Filesystem
   ↓
mkdir /data
   ↓
mount
   ↓
fstab
```

Example:

```bash
lsblk
```

Identify:

```text
/dev/nvme1n1
```

Create filesystem if needed:

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

Verify:

```bash
df -h /data
```

---

# 🧪 AWS EBS Mounting Lab

## Step 1

Attach a test EBS volume.

## Step 2

Check:

```bash
lsblk
```

## Step 3

Confirm filesystem:

```bash
lsblk -f
```

## Step 4

Create filesystem if required:

```bash
sudo mkfs.ext4 /dev/nvme1n1
```

## Step 5

Create mount point:

```bash
sudo mkdir /data
```

## Step 6

Mount:

```bash
sudo mount /dev/nvme1n1 /data
```

## Step 7

Verify:

```bash
df -h /data
```

## Step 8

Write test data:

```bash
echo "EBS Test" | sudo tee /data/test.txt
```

## Step 9

Read:

```bash
cat /data/test.txt
```

---

# 🛠️ Mount Troubleshooting

### Check device

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

### Check mounts

```bash
findmnt
```

### Check kernel messages

```bash
dmesg | tail -50
```

### Check logs

```bash
journalctl -k
```

### Check whether mount is busy

```bash
sudo lsof +f -- /data
```

---

# 🎯 Interview Questions

### 1. What is mounting?

Mounting attaches a filesystem to a directory in the Linux directory tree.

### 2. What is a mount point?

A directory where a filesystem is attached.

### 3. How do you mount a filesystem?

```bash
sudo mount /dev/device /mountpoint
```

### 4. How do you unmount?

```bash
sudo umount /mountpoint
```

### 5. How do you find mounted filesystems?

```bash
findmnt
```

### 6. Why use UUID?

It provides a stable filesystem identifier for mounting.

### 7. Why does `umount` say "target is busy"?

A process is currently using the mount point.

### 8. How do you find the process?

```bash
sudo lsof +f -- /data
```

or:

```bash
sudo fuser -vm /data
```

---

# ✅ Checklist

- [ ] Understand mounting
- [ ] Create mount points
- [ ] Mount filesystem
- [ ] Unmount filesystem
- [ ] Use `findmnt`
- [ ] Use `mount`
- [ ] Use `umount`
- [ ] Mount by UUID
- [ ] Mount by label
- [ ] Understand mount options
- [ ] Troubleshoot busy mounts
- [ ] Mount an EBS volume
- [ ] Prepare a persistent mount

---

# 🔜 Next

Continue with:

```text
LVM.md
```

Next you will learn how to build flexible storage using:

```text
PV → VG → LV → Filesystem → Mount
```
