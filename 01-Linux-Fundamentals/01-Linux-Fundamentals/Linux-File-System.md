# 🗂️ Linux File System

## 📌 Overview

Linux organizes files and directories in a hierarchical filesystem.

Unlike Windows, Linux does not normally start with drive letters such as:

```text
C:
D:
E:
```

Linux starts from:

```text
/
```

This is called the **root directory**.

---

# 🎯 Learning Objectives

After completing this topic, I should understand:

* Linux filesystem hierarchy
* Root directory
* `/home`
* `/root`
* `/etc`
* `/var`
* `/tmp`
* `/boot`
* `/dev`
* `/proc`
* `/sys`
* `/usr`
* `/opt`
* `/mnt`
* `/media`
* Absolute paths
* Relative paths
* Hidden files
* Mount points
* Filesystem exploration

---

# 1. Linux Filesystem Hierarchy

Basic structure:

```text
/
├── bin
├── boot
├── dev
├── etc
├── home
├── lib
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin
├── srv
├── sys
├── tmp
├── usr
└── var
```

The exact directories and whether some are symbolic links can vary between modern Linux distributions.

---

# 2. Root `/`

The `/` directory is the top of the Linux filesystem hierarchy.

Example:

```bash
cd /
pwd
```

Output:

```text
/
```

List:

```bash
ls -la /
```

---

# 3. `/home`

Contains home directories for normal users.

Example:

```text
/home
├── user1
├── user2
└── user3
```

Check:

```bash
ls /home
```

Your home directory can be found with:

```bash
echo $HOME
```

Go home:

```bash
cd ~
```

---

# 4. `/root`

This is the home directory of the root user.

It is different from:

```text
/
```

Remember:

```text
/       = filesystem root
/root   = root user's home directory
```

---

# 5. `/etc`

Contains system-wide configuration files.

Examples:

```text
/etc/hostname
/etc/hosts
/etc/fstab
/etc/passwd
/etc/group
```

Explore:

```bash
ls /etc
```

Read OS information:

```bash
cat /etc/os-release
```

---

# 6. `/var`

Contains variable data.

Common examples:

```text
/var/log
/var/cache
/var/lib
```

Explore logs:

```bash
ls /var/log
```

Check size:

```bash
du -sh /var
```

---

# 7. `/tmp`

Used for temporary files.

```bash
ls -la /tmp
```

Create a test file:

```bash
touch /tmp/linux-test.txt
```

Check:

```bash
ls -l /tmp/linux-test.txt
```

Remove:

```bash
rm /tmp/linux-test.txt
```

---

# 8. `/boot`

Contains files needed during the boot process.

Explore:

```bash
ls -lah /boot
```

You may see:

```text
vmlinuz
initramfs
grub
```

The exact filenames vary by distribution.

---

# 9. `/dev`

Contains device files.

Examples can include:

```text
/dev/null
/dev/zero
/dev/random
```

Explore:

```bash
ls -l /dev | head
```

Test `/dev/null`:

```bash
echo "hello" > /dev/null
```

The output is discarded.

---

# 10. `/proc`

`/proc` is a virtual filesystem that exposes information about processes and the kernel.

Check:

```bash
ls /proc
```

CPU information:

```bash
cat /proc/cpuinfo
```

Memory information:

```bash
cat /proc/meminfo
```

Kernel information:

```bash
cat /proc/version
```

---

# 11. `/sys`

`/sys` is a virtual filesystem exposing information about devices, drivers, and the kernel.

Explore:

```bash
ls /sys
```

---

# 12. `/usr`

Contains many user-space programs, libraries, documentation, and shared data.

Common directories include:

```text
/usr/bin
/usr/sbin
/usr/lib
/usr/share
```

Explore:

```bash
ls /usr
```

Check commands:

```bash
ls /usr/bin | head
```

---

# 13. `/opt`

Used for optional or additional software.

Example:

```text
/opt/application
```

Explore:

```bash
ls /opt
```

---

# 14. `/mnt`

Commonly used as a temporary mount point.

Example:

```text
/mnt/data
```

Explore:

```bash
ls /mnt
```

---

# 15. `/media`

Commonly used for automatically mounted removable media.

Explore:

```bash
ls /media
```

---

# 16. `/srv`

Can contain data used by services.

Example:

```text
/srv/www
```

Explore:

```bash
ls /srv
```

---

# 17. Absolute Path

An absolute path starts from `/`.

Example:

```bash
cd /var/log
```

Another example:

```bash
cat /etc/hostname
```

---

# 18. Relative Path

A relative path starts from the current directory.

Example:

```bash
cd /var
cd log
```

This reaches:

```text
/var/log
```

---

# 19. Special Path Symbols

### Current directory

```text
.
```

Example:

```bash
ls .
```

### Parent directory

```text
..
```

Example:

```bash
cd ..
```

### Home directory

```text
~
```

Example:

```bash
cd ~
```

---

# 20. Hidden Files

Linux hidden files normally start with:

```text
.
```

Example:

```text
.bashrc
.profile
```

List hidden files:

```bash
ls -la
```

---