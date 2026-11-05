# 📁 Files and Directories

## 📌 Overview

Linux treats almost everything as a file or provides a file-like interface to system resources.

This section focuses on understanding:

```text
Files
Directories
File Types
Permissions
Ownership
Links
ACLs
```

These concepts are fundamental for Linux administration, AWS EC2, Cloud Engineering, DevOps, and system security.

---

# 🎯 Learning Objectives

By completing this section, I should understand:

- Linux file types
- Regular files
- Directories
- Symbolic links
- Hard links
- Device files
- Named pipes
- Sockets
- Linux permissions
- Read, write, execute permissions
- User, group, and others
- Numeric permissions
- File ownership
- `chown`
- `chgrp`
- `chmod`
- Hard links
- Symbolic links

---

# 📚 Topics

| # | Topic | File |
|---|---|---|
| 01 | File Types | [File-Types.md](./File-Types.md) |
| 02 | Permissions | [Permissions.md](./Permissions.md) |
| 03 | Ownership | [Ownership.md](./Ownership.md) |
| 04 | Links | [Links.md](./Links.md) |


---

# 🧭 Learning Path

```text
File Types
    │
    ▼
Permissions
    │
    ▼
Ownership
    │
    ▼
Hard & Symbolic Links

```

---

# 1. File Types

Linux supports several types of filesystem objects.

Common types:

```text
-  Regular file
d  Directory
l  Symbolic link

```

Check a file type:

```bash
file filename
```

List file types:

```bash
ls -l
```

---

# 2. Linux Permissions

Linux permissions control who can:

```text
Read
Write
Execute
```

Permissions are assigned to:

```text
User
Group
Others
```

Example:

```text
-rwxr-xr--
```

Breakdown:

```text
-    rwx    r-x    r--
│     │      │      │
│     │      │      └── Others
│     │      └───────── Group
│     └──────────────── Owner
└────────────────────── File type
```

---

# 3. Numeric Permissions

Permissions can also be represented numerically.

```text
r = 4
w = 2
x = 1
```

Examples:

```text
7 = rwx
6 = rw-
5 = r-x
4 = r--
0 = ---
```

Therefore:

```text
755 = rwxr-xr-x
644 = rw-r--r--
700 = rwx------
600 = rw-------
```

---

# 4. Ownership

Every file normally has:

```text
Owner
Group
```

Check ownership:

```bash
ls -l
```

Example:

```text
-rw-r--r--  user  developers  app.conf
```

Change owner:

```bash
sudo chown user app.conf
```

Change group:

```bash
sudo chgrp developers app.conf
```

Change both:

```bash
sudo chown user:developers app.conf
```

---

# 5. Hard Links

A hard link is another directory entry referring to the same underlying inode.

Example:

```bash
ln file.txt hardlink.txt
```

---

# 6. Symbolic Links

A symbolic link points to another pathname.

Create:

```bash
ln -s file.txt symlink.txt
```

Check:

```bash
ls -l
```

---
