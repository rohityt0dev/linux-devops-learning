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
- ACLs
- `getfacl`
- `setfacl`

---

# 📚 Topics

| # | Topic | File |
|---|---|---|
| 01 | File Types | [File-Types.md](./File-Types.md) |
| 02 | Permissions | [Permissions.md](./Permissions.md) |
| 03 | Ownership | [Ownership.md](./Ownership.md) |
| 04 | Links | [Links.md](./Links.md) |
| 05 | ACL | [ACL.md](./ACL.md) |

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
    │
    ▼
ACL
    │
    ▼
Hands-On Administration
```

---

# 1. File Types

Linux supports several types of filesystem objects.

Common types:

```text
-  Regular file
d  Directory
l  Symbolic link
c  Character device
b  Block device
p  Named pipe
s  Socket
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

# 7. ACL

ACL stands for:

**Access Control List**

ACLs provide more granular permissions than the traditional owner/group/other model.

View ACL:

```bash
getfacl file.txt
```

Set ACL:

```bash
setfacl -m u:alice:r file.txt
```

---

# 🧪 Full-Day Practical Lab

## Exercise 1 — Create Lab

```bash
mkdir -p ~/file-lab/{files,links,permissions,ownership,acl}
cd ~/file-lab
```

---

## Exercise 2 — Create Files

```bash
touch files/file1.txt
touch files/file2.txt
mkdir files/directory1
```

Check:

```bash
ls -la files/
```

---

## Exercise 3 — Identify Types

```bash
file files/file1.txt
file files/directory1
```

---

## Exercise 4 — Permissions

```bash
ls -l files/
```

Change permissions:

```bash
chmod 640 files/file1.txt
```

Verify:

```bash
ls -l files/file1.txt
```

---

## Exercise 5 — Ownership

Check:

```bash
ls -l files/file1.txt
```

Detailed:

```bash
stat files/file1.txt
```

---

## Exercise 6 — Links

Create hard link:

```bash
ln files/file1.txt links/hardlink.txt
```

Create symbolic link:

```bash
ln -s ../files/file1.txt links/symlink.txt
```

Check:

```bash
ls -li files/file1.txt links/
```

---

## Exercise 7 — ACL

Check:

```bash
getfacl files/file1.txt
```

If ACL tools are installed, practice:

```bash
setfacl -m u:$USER:r files/file1.txt
```

Check:

```bash
getfacl files/file1.txt
```

---

# 🎯 Mini Project

## Linux File Access Lab

Build:

```text
file-access-lab/
├── public/
├── private/
├── shared/
├── links/
└── reports/
```

Requirements:

- Create files in every directory.
- Configure different permissions.
- Create a hard link.
- Create a symbolic link.
- Check ownership.
- Configure an ACL.
- Create a permissions report.

Example:

```bash
ls -lR file-access-lab/
```

ACL report:

```bash
getfacl -R file-access-lab/
```

---

# ☁️ AWS Connection

These concepts are frequently required when administering EC2 Linux servers.

Example:

```text
EC2
 │
 ├── /var/www/html
 │      └── website files
 │
 ├── /var/log
 │      └── application logs
 │
 ├── /etc
 │      └── configuration
 │
 └── /home
        └── user files
```

Incorrect permissions can cause:

```text
Application failure
SSH issues
Web server errors
Deployment failures
Log access problems
```

---

# 🧠 Interview Questions

1. What are Linux file types?
2. What are Linux permissions?
3. What are read, write, and execute permissions?
4. What is the difference between user, group, and others?
5. What does `chmod 755` mean?
6. What does `chmod 644` mean?
7. What is file ownership?
8. What is a hard link?
9. What is a symbolic link?
10. What is an inode?
11. What is an ACL?
12. What is the difference between permissions and ACLs?
13. How do you change file ownership?
14. How do you change file permissions?
15. How do you check ACLs?

---

# ✅ Checklist

- [ ] Understand Linux file types
- [ ] Understand permissions
- [ ] Understand numeric permissions
- [ ] Understand ownership
- [ ] Practice `chmod`
- [ ] Practice `chown`
- [ ] Practice `chgrp`
- [ ] Understand hard links
- [ ] Understand symbolic links
- [ ] Practice `ln`
- [ ] Practice `ln -s`
- [ ] Understand ACL
- [ ] Practice `getfacl`
- [ ] Practice `setfacl`
- [ ] Complete File Access Lab
- [ ] Complete interview questions

---

## 🚀 Next

➡️ [File Types](./File-Types.md)