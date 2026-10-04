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

# 🔢 Field 5 — Dump

The fifth field controls the legacy `dump` backup utility behavior.

Common modern configuration:

```text
0
```

Example:

```text
UUID=1234 /data ext4 defaults 0 2
```

---

# 🔎 Field 6 — fsck Order

The sixth field determines filesystem-check ordering for filesystems that use `fsck`.

Common values:

```text
0
1
2
```

Typical root filesystem:

```text
1
```

Other Linux filesystems:

```text
2
```

XFS entries commonly use:

```text
0
```

because XFS does not use the traditional boot-time `fsck` mechanism in the same way as ext filesystems.

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

# 🔍 Find UUID

Use:

```bash
sudo blkid
```

Or:

```bash
lsblk -f
```

Example:

```text
/dev/sdb1
UUID="8f5e6d9a-1234-5678"
TYPE="ext4"
```

---

# 🧪 Lab — Persistent Mount

Assume:

```text
/dev/sdb1
```

has an ext4 filesystem.

---

## Step 1 — Find UUID

```bash
sudo blkid /dev/sdb1
```

---

## Step 2 — Create Mount Point

```bash
sudo mkdir -p /data
```

---

## Step 3 — Backup fstab

Before editing:

```bash
sudo cp /etc/fstab /etc/fstab.backup
```

---

## Step 4 — Edit fstab

```bash
sudo nano /etc/fstab
```

Add:

```text
UUID=YOUR-UUID  /data  ext4  defaults  0  2
```

Replace:

```text
YOUR-UUID
```

with the real UUID.

---

# 🧪 Test Before Reboot

This is extremely important.

Run:

```bash
sudo mount -a
```

If there is no error, check:

```bash
findmnt /data
```

Then:

```bash
df -h /data
```

Do **not** blindly reboot before testing a new `/etc/fstab` entry.

---

# 🔍 Verify

```bash
lsblk -f
```

```bash
findmnt /data
```

```bash
df -h /data
```

---

# 🔄 Reboot Test

After successfully testing:

```bash
sudo reboot
```

After reconnecting:

```bash
findmnt /data
```

and:

```bash
df -h /data
```

If the filesystem is mounted automatically, the persistent configuration is working.

---

# 🧪 Lab — XFS Persistent Mount

Get UUID:

```bash
sudo blkid /dev/sdb1
```

Create mount point:

```bash
sudo mkdir -p /data
```

Add:

```text
UUID=YOUR-UUID  /data  xfs  defaults  0  0
```

Test:

```bash
sudo mount -a
```

Verify:

```bash
findmnt /data
```

---

# 🧩 LVM + fstab

If you use LVM:

```text
EBS
 ↓
PV
 ↓
VG
 ↓
LV
 ↓
Filesystem
 ↓
/data
```

Example device:

```text
/dev/vg_data/lv_data
```

Find filesystem UUID:

```bash
sudo blkid /dev/vg_data/lv_data
```

Then add:

```text
UUID=YOUR-UUID  /data  ext4  defaults  0  2
```

---

# ☁️ AWS EBS Persistent Mount

A typical AWS workflow:

```text
EBS Volume
    ↓
Attach to EC2
    ↓
Linux Block Device
    ↓
Filesystem
    ↓
UUID
    ↓
/etc/fstab
    ↓
mount -a
    ↓
Reboot
    ↓
Verify /data
```

Example:

```bash
lsblk
```

Find:

```text
/dev/nvme1n1
```

Check:

```bash
lsblk -f
```

Get UUID:

```bash
sudo blkid /dev/nvme1n1
```

Create mount:

```bash
sudo mkdir -p /data
```

Add UUID entry to `/etc/fstab`.

Test:

```bash
sudo mount -a
```

Verify:

```bash
df -h /data
```

---

# ⚠️ Why UUID Is Preferred

Device names can vary between environments.

For example:

```text
/dev/sdb
/dev/sdc
```

may not always be the names you expect after hardware or cloud configuration changes.

Using:

```text
UUID=...
```

provides a stable filesystem identifier.

For AWS, always verify the actual device and filesystem before changing `/etc/fstab`.

---

# 🚨 Common fstab Mistakes

## Mistake 1 — Wrong UUID

Check:

```bash
sudo blkid
```

---

## Mistake 2 — Mount directory does not exist

Create:

```bash
sudo mkdir -p /data
```

---

## Mistake 3 — Wrong filesystem type

Check:

```bash
lsblk -f
```

---

## Mistake 4 — Typo in `/etc/fstab`

Test:

```bash
sudo mount -a
```

before rebooting.

---

## Mistake 5 — Device is unavailable

Check:

```bash
lsblk
```

---

# 🛠️ Troubleshooting fstab

If:

```bash
sudo mount -a
```

returns an error, do not reboot yet.

Check:

```bash
cat /etc/fstab
```

Then:

```bash
lsblk -f
```

Then:

```bash
blkid
```

Then:

```bash
findmnt
```

For system logs:

```bash
journalctl -b
```

For mount-related messages:

```bash
journalctl -b | grep -i mount
```

---

# 🧪 Mini Project — Persistent EBS Storage

Build the following:

```text
AWS EC2
   │
   └── EBS 20 GB
          │
          ↓
       ext4
          │
          ↓
        UUID
          │
          ↓
       /data
          │
          ↓
      /etc/fstab
          │
          ↓
      mount -a
          │
          ↓
        reboot
          │
          ↓
      /data available
```

Document:

```text
EBS Volume:
Device:
Filesystem:
UUID:
Mount Point:
/etc/fstab entry:
Verification:
Troubleshooting:
```

---

# 🧪 Advanced Lab — LVM + fstab

Create:

```text
EBS 1
 ↓
PV
 ↓
VG
 ↓
LV
 ↓
ext4
 ↓
/data
 ↓
UUID
 ↓
/etc/fstab
```

Verify:

```bash
pvs
vgs
lvs
lsblk -f
findmnt /data
df -h /data
```

Then:

```bash
sudo mount -a
```

Finally reboot the test instance and verify:

```bash
findmnt /data
```

---

# 🎯 Interview Questions

### 1. What is `/etc/fstab`?

It is the filesystem table containing configuration for filesystems that Linux can mount automatically.

### 2. Why use UUID in fstab?

UUID provides a stable filesystem identifier.

### 3. What does `mount -a` do?

It attempts to mount filesystems configured in `/etc/fstab` according to the applicable entries.

### 4. Why should you run `mount -a` before reboot?

It allows you to detect configuration errors without risking a boot failure caused by an invalid fstab entry.

### 5. What are the six fstab fields?

```text
Filesystem
Mount point
Filesystem type
Mount options
Dump
fsck order
```

### 6. What does `defaults` mean?

It specifies a standard set of default mount options.

### 7. What happens if fstab contains an incorrect entry?

The mount can fail, and depending on the configuration, boot may be affected or enter a recovery/emergency state.

### 8. How do you troubleshoot fstab?

```bash
cat /etc/fstab
lsblk -f
blkid
sudo mount -a
findmnt
journalctl -b
```

### 9. How do you make an EBS volume persistent after reboot?

Create the filesystem, obtain its UUID, add the UUID-based mount entry to `/etc/fstab`, test with `mount -a`, and verify after reboot.

---

# 📋 fstab Quick Reference

Basic:

```text
UUID=<UUID>  /data  ext4  defaults  0  2
```

XFS:

```text
UUID=<UUID>  /data  xfs  defaults  0  0
```

Check:

```bash
cat /etc/fstab
```

UUID:

```bash
blkid
```

Test:

```bash
sudo mount -a
```

Verify:

```bash
findmnt
```

Disk usage:

```bash
df -h
```

---

# 🚨 Production Safety Checklist

Before modifying `/etc/fstab`:

```bash
sudo cp /etc/fstab /etc/fstab.backup
```

Then verify:

```bash
lsblk -f
```

Confirm:

```text
UUID
Filesystem
Mount point
```

Edit:

```bash
sudo nano /etc/fstab
```

Test:

```bash
sudo mount -a
```

Only after successful testing should you reboot.

---

# ☁️ AWS Cloud Engineer Interview Scenario

**Question:**

> You attached a new EBS volume to an EC2 instance, mounted it successfully, but after reboot the `/data` directory is empty. What happened?

### Interview-ready answer:

The mount was probably configured only temporarily with the `mount` command.

A manual mount does not automatically create persistent configuration for the next boot.

I would check:

```bash
lsblk -f
cat /etc/fstab
findmnt /data
```

If the filesystem is not configured in `/etc/fstab`, I would obtain its UUID with:

```bash
blkid
```

and add a UUID-based entry such as:

```text
UUID=<UUID> /data ext4 defaults 0 2
```

Then I would test it with:

```bash
sudo mount -a
```

before rebooting.

---

# 🎯 Final Storage Workflow

You should now understand this complete workflow:

```text
                    Linux Storage
                         │
                         ▼
                      Disk
                         │
                         ▼
                    Partition
                         │
                         ▼
                    Filesystem
                         │
                         ▼
                     Mount
                         │
                         ▼
                   /etc/fstab
                         │
                         ▼
                  Persistent Mount
```

With LVM:

```text
Disk
 ↓
Partition
 ↓
PV
 ↓
VG
 ↓
LV
 ↓
Filesystem
 ↓
Mount
 ↓
/etc/fstab
```

With AWS:

```text
EBS
 ↓
EC2
 ↓
Linux Block Device
 ↓
Partition / LVM
 ↓
Filesystem
 ↓
/data
 ↓
/etc/fstab
 ↓
Persistent Storage
```

---

# ✅ Checklist

- [ ] Understand `/etc/fstab`
- [ ] Understand all six fields
- [ ] Find filesystem UUID
- [ ] Use UUID in fstab
- [ ] Create mount points
- [ ] Configure ext4 mount
- [ ] Configure XFS mount
- [ ] Test with `mount -a`
- [ ] Verify with `findmnt`
- [ ] Verify with `df -h`
- [ ] Troubleshoot fstab errors
- [ ] Configure EBS persistent storage
- [ ] Configure LVM + fstab
- [ ] Reboot and verify persistence
- [ ] Complete the EBS persistent-storage project

---

# 🎉 Section Complete

You have completed:

```text
06-Storage-and-Disks/
│
├── README.md
├── Disk-Management.md
├── Partitions.md
├── Filesystems.md
├── Mounting.md
├── LVM.md
└── fstab.md
```

You now have the Linux storage foundation needed for:

```text
Linux Administration
AWS EC2
Amazon EBS
Cloud Engineering
DevOps
Database Servers
Application Servers
Storage Troubleshooting
```

# 🔜 Next Section

Continue with:

```text
07-Networking/
```

Topics:

```text
IP Address
DNS
SSH
Network Commands
Ports
Network Troubleshooting
```

This will connect directly with your AWS learning:

```text
Linux Networking
       ↓
EC2 Networking
       ↓
VPC
       ↓
Subnets
       ↓
Route Tables
       ↓
Internet Gateway
       ↓
NAT Gateway
       ↓
Security Groups
```