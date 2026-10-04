# 🧩 Linux LVM

LVM stands for:

> **Logical Volume Manager**

LVM provides a flexible way to manage storage.

Instead of working only with fixed disk partitions, LVM allows administrators to combine storage and create logical volumes that can be resized more flexibly.

---

# 🎯 Learning Objectives

You will learn:

- What LVM is
- Physical Volumes
- Volume Groups
- Logical Volumes
- `pvcreate`
- `pvs`
- `pvdisplay`
- `vgcreate`
- `vgs`
- `vgextend`
- `lvcreate`
- `lvs`
- `lvextend`
- `lvreduce`
- LVM resizing
- LVM troubleshooting
- AWS EBS + LVM

---

# 🧠 LVM Architecture

The basic LVM architecture is:

```text
Physical Disk
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

Example:

```text
/dev/sdb
   ↓
PV
   ↓
VG: vg_data
   ↓
LV: lv_app
   ↓
ext4
   ↓
/app
```

---

# 📦 Physical Volume — PV

A Physical Volume is storage prepared for LVM.

Example:

```bash
sudo pvcreate /dev/sdb
```

Check:

```bash
sudo pvs
```

Detailed:

```bash
sudo pvdisplay
```

---

# 🗃️ Volume Group — VG

A Volume Group combines one or more Physical Volumes.

Create:

```bash
sudo vgcreate vg_data /dev/sdb
```

Check:

```bash
sudo vgs
```

Detailed:

```bash
sudo vgdisplay
```

---

# 📐 Logical Volume — LV

A Logical Volume is created inside a Volume Group.

Example:

```bash
sudo lvcreate -L 10G -n lv_data vg_data
```

Check:

```bash
sudo lvs
```

Detailed:

```bash
sudo lvdisplay
```

---

# 🗂️ Create Filesystem

After creating the LV:

```bash
sudo mkfs.ext4 /dev/vg_data/lv_data
```

Equivalent device path:

```text
/dev/mapper/vg_data-lv_data
```

---

# 📌 Mount Logical Volume

Create mount point:

```bash
sudo mkdir /data
```

Mount:

```bash
sudo mount /dev/vg_data/lv_data /data
```

Check:

```bash
df -h /data
```

---

# 🧪 Complete LVM Lab

Use a test disk.

Assume:

```text
/dev/sdb
```

⚠️ The following commands can destroy existing data on `/dev/sdb`. Confirm the device first:

```bash
lsblk
```

---

## Step 1 — Create PV

```bash
sudo pvcreate /dev/sdb
```

Check:

```bash
sudo pvs
```

---

## Step 2 — Create VG

```bash
sudo vgcreate vg_data /dev/sdb
```

Check:

```bash
sudo vgs
```

---

## Step 3 — Create LV

Create a 5 GB volume:

```bash
sudo lvcreate -L 5G -n lv_data vg_data
```

Check:

```bash
sudo lvs
```

---

## Step 4 — Create Filesystem

```bash
sudo mkfs.ext4 /dev/vg_data/lv_data
```

---

## Step 5 — Create Mount Point

```bash
sudo mkdir /data
```

---

## Step 6 — Mount

```bash
sudo mount /dev/vg_data/lv_data /data
```

---

## Step 7 — Verify

```bash
df -h /data
```

Check:

```bash
lsblk
```

Check:

```bash
sudo lvs
```

---

# 📈 Extend a Volume Group

Suppose you attach another disk:

```text
/dev/sdc
```

Create PV:

```bash
sudo pvcreate /dev/sdc
```

Extend VG:

```bash
sudo vgextend vg_data /dev/sdc
```

Check:

```bash
sudo vgs
```

Now the Volume Group has more available space.

---

# 📈 Extend a Logical Volume

Check:

```bash
sudo lvs
```

Extend by 2 GB:

```bash
sudo lvextend -L +2G /dev/vg_data/lv_data
```

Or use:

```bash
sudo lvextend -r -L +2G /dev/vg_data/lv_data
```

The `-r` option attempts to resize the filesystem along with the logical volume.

Verify:

```bash
df -h /data
```

---

# 📊 Use All Remaining VG Space

You can extend an LV using all remaining free space:

```bash
sudo lvextend -l +100%FREE /dev/vg_data/lv_data
```

With filesystem resize:

```bash
sudo lvextend -r -l +100%FREE /dev/vg_data/lv_data
```

Always confirm the intended LV and available space before performing storage changes.

---

# 🔽 Reducing an LV

Reducing storage is more dangerous than extending it.

For filesystems that support shrinking, the filesystem generally needs to be reduced before the underlying LV is reduced.

For example, with ext4, the conceptual order is:

```text
Unmount
 ↓
Filesystem check
 ↓
Shrink filesystem
 ↓
Reduce LV
 ↓
Mount
```

Never simply run:

```bash
lvreduce
```

on a filesystem without first understanding and completing the filesystem-specific shrink procedure.

**XFS cannot be shrunk in place.**

---

# 🧪 Lab — Extend LVM

Starting state:

```text
/dev/sdb
 ↓
PV
 ↓
vg_data
 ↓
lv_data = 5G
```

Attach another test disk:

```text
/dev/sdc
```

Create PV:

```bash
sudo pvcreate /dev/sdc
```

Extend VG:

```bash
sudo vgextend vg_data /dev/sdc
```

Check:

```bash
sudo vgs
```

Extend LV:

```bash
sudo lvextend -r -L +2G /dev/vg_data/lv_data
```

Verify:

```bash
sudo lvs
df -h /data
```

---

# 🔍 LVM Commands

## Physical Volumes

```bash
pvs
pvdisplay
pvscan
```

## Volume Groups

```bash
vgs
vgdisplay
vgscan
```

## Logical Volumes

```bash
lvs
lvdisplay
lvscan
```

---

# 🗑️ Remove LVM Components

Removal should be performed carefully and normally in reverse order.

Conceptually:

```text
Unmount filesystem
       ↓
Remove LV
       ↓
Remove VG
       ↓
Remove PV
```

Example:

```bash
sudo umount /data
```

Then:

```bash
sudo lvremove /dev/vg_data/lv_data
```

Then:

```bash
sudo vgremove vg_data
```

Then:

```bash
sudo pvremove /dev/sdb
```

⚠️ These operations can destroy data. Only use them on a test environment when you intentionally want to tear down the lab.

---

# ☁️ AWS EBS + LVM

LVM can be useful when managing multiple EBS volumes.

Example:

```text
EBS Volume 1
     ↓
   /dev/sdb
     ↓
     PV
      \
       \
      Volume Group
       /
      /
     PV
     ↑
   /dev/sdc
     ↑
EBS Volume 2
```

Then:

```text
VG
 ↓
LV
 ↓
Filesystem
 ↓
/data
```

This can make storage management more flexible.

---

# 🧪 AWS LVM Lab

Attach two test EBS volumes:

```text
EBS 1 → 10 GB
EBS 2 → 10 GB
```

Identify:

```bash
lsblk
```

Suppose:

```text
/dev/nvme1n1
/dev/nvme2n1
```

Create PVs:

```bash
sudo pvcreate /dev/nvme1n1
sudo pvcreate /dev/nvme2n1
```

Create VG:

```bash
sudo vgcreate vg_data /dev/nvme1n1 /dev/nvme2n1
```

Create LV:

```bash
sudo lvcreate -L 15G -n lv_data vg_data
```

Create filesystem:

```bash
sudo mkfs.ext4 /dev/vg_data/lv_data
```

Mount:

```bash
sudo mkdir /data
sudo mount /dev/vg_data/lv_data /data
```

Verify:

```bash
df -h /data
```

---

# 🧠 LVM Troubleshooting

Check PVs:

```bash
sudo pvs
```

Check VGs:

```bash
sudo vgs
```

Check LVs:

```bash
sudo lvs
```

Check device tree:

```bash
lsblk
```

Check filesystem:

```bash
lsblk -f
```

Check mount:

```bash
findmnt
```

Check space:

```bash
df -h
```

---

# 🎯 Interview Questions

### 1. What is LVM?

LVM is a Linux storage-management system that provides flexible management of logical storage volumes.

### 2. What is a PV?

A Physical Volume is storage initialized for use by LVM.

### 3. What is a VG?

A Volume Group is a pool of storage made from one or more PVs.

### 4. What is an LV?

A Logical Volume is a logical block device allocated from a Volume Group.

### 5. Explain LVM architecture.

```text
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

### 6. How do you create a PV?

```bash
sudo pvcreate /dev/sdb
```

### 7. How do you create a VG?

```bash
sudo vgcreate vg_data /dev/sdb
```

### 8. How do you create an LV?

```bash
sudo lvcreate -L 5G -n lv_data vg_data
```

### 9. How do you extend a VG?

```bash
sudo vgextend vg_data /dev/sdc
```

### 10. How do you extend an LV?

```bash
sudo lvextend -r -L +2G /dev/vg_data/lv_data
```

### 11. Can XFS be reduced?

No. XFS does not support shrinking in place.

### 12. Why is LVM useful in cloud environments?

It provides flexible storage allocation and can simplify extending logical storage when additional block devices are available.

---

# 🧠 LVM Quick Reference

```text
Physical Disk
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

Commands:

```bash
pvcreate
pvs
pvdisplay

vgcreate
vgs
vgextend
vgdisplay

lvcreate
lvs
lvextend
lvdisplay
```

---

# ⚠️ Important Safety Rules

Before modifying LVM:

```bash
lsblk
pvs
vgs
lvs
```

Before formatting:

```bash
lsblk -f
```

Before deleting:

```bash
findmnt
```

Never run destructive storage commands against an unknown device.

---

# ✅ Checklist

- [ ] Understand LVM
- [ ] Understand PV
- [ ] Understand VG
- [ ] Understand LV
- [ ] Use `pvcreate`
- [ ] Use `pvs`
- [ ] Use `vgcreate`
- [ ] Use `vgs`
- [ ] Use `vgextend`
- [ ] Use `lvcreate`
- [ ] Use `lvs`
- [ ] Use `lvextend`
- [ ] Understand LVM resizing
- [ ] Understand filesystem resizing
- [ ] Understand LVM removal
- [ ] Complete LVM lab
- [ ] Complete AWS EBS + LVM lab

---

# 🔜 Next

Continue with:

```text
fstab.md
```

Next you will learn how to make your Linux and AWS EBS storage mounts **persistent across reboots**.