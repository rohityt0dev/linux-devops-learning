# 🔐 Linux File Permissions

## 📌 Overview

Linux permissions control access to files and directories.

The traditional permission model uses three classes:

```text
User
Group
Others
```

And three basic permissions:

```text
Read
Write
Execute
```

---

# 🎯 Learning Objectives

- Understand `r`, `w`, `x`
- Understand user/group/others
- Read `ls -l` output
- Use symbolic permissions
- Use numeric permissions
- Use `chmod`
- Understand directory permissions
- Understand special permission bits
- Practice permission troubleshooting

---

# 1. Read `ls -l`

Run:

```bash
ls -l file.txt
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
│     └──────────────── User
└────────────────────── File type
```

---

# 2. Read Permission

```text
r = 4
```

For a regular file, read allows the contents to be read.

---

# 3. Write Permission

```text
w = 2
```

For a regular file, write allows modification.

---

# 4. Execute Permission

```text
x = 1
```

For a regular file, execute allows it to be run as a program when other requirements are satisfied.

For a directory, execute has a different meaning: it allows traversal/search of the directory.

---

# 5. Permission Values

| Permission | Value |
|---|---:|
| `---` | 0 |
| `--x` | 1 |
| `-w-` | 2 |
| `-wx` | 3 |
| `r--` | 4 |
| `r-x` | 5 |
| `rw-` | 6 |
| `rwx` | 7 |

---

# 6. Common Permissions

## 755

```text
rwxr-xr-x
```

Numeric:

```text
7 5 5
```

---

## 644

```text
rw-r--r--
```

Numeric:

```text
6 4 4
```

---

## 700

```text
rwx------
```

---

## 600

```text
rw-------
```

---

# 7. `chmod`

Change permissions.

Symbolic:

```bash
chmod u+x script.sh
```

Remove:

```bash
chmod u-x script.sh
```

Add group write:

```bash
chmod g+w file.txt
```

Remove others write:

```bash
chmod o-w file.txt
```

---

# 8. Numeric `chmod`

```bash
chmod 755 script.sh
```

```bash
chmod 644 file.txt
```

```bash
chmod 600 private.txt
```

---

# 9. Directory Permissions

For directories:

```text
r = list directory entries
w = create/delete/rename entries, subject to other restrictions
x = traverse/search directory
```

Example:

```bash
mkdir test
chmod 700 test
```

---

# 10. Recursive Permissions

```bash
chmod -R 755 directory/
```

⚠️ Recursive permission changes should be used carefully.

Applying one permission mode blindly to every file and directory can create security or functionality problems.

---

# 11. Special Permission Bits

Linux also supports:

```text
SUID
SGID
Sticky Bit
```

Check:

```bash
ls -ld /tmp
```

A typical `/tmp` directory often shows a sticky-bit permission such as:

```text
drwxrwxrwt
```

---

# 12. SUID

SUID causes an executable file to run with the effective user ID of the file owner, subject to system rules.

Display:

```text
s
```

Example permission concept:

```text
-rwsr-xr-x
```

---

# 13. SGID

SGID on an executable affects the effective group identity when executed.

SGID on a directory causes newly created files/subdirectories to inherit the directory's group on systems supporting the normal semantics.

Example:

```text
drwxrwsr-x
```

---

# 14. Sticky Bit

The sticky bit on a directory restricts deletion/renaming of entries to the file owner, directory owner, or privileged user.

Common example:

```text
/tmp
```

Example:

```text
drwxrwxrwt
```

---

# 🧪 Hands-On Lab

Create:

```bash
mkdir permission-lab
cd permission-lab

touch file.txt
touch script.sh
mkdir private
```

Check:

```bash
ls -la
```

Set:

```bash
chmod 644 file.txt
chmod 755 script.sh
chmod 700 private
```

Check:

```bash
ls -la
```

---

# 🧪 Symbolic Permission Lab

```bash
chmod u+x script.sh
chmod g+r file.txt
chmod o-r file.txt
```

Verify:

```bash
ls -l
```

---

# 🧪 Numeric Permission Lab

Practice:

```bash
chmod 600 file.txt
chmod 640 file.txt
chmod 644 file.txt
chmod 755 script.sh
chmod 700 private
```

Observe the differences.

---

# 🎯 Permission Challenge

For each requirement, choose the permission:

### Requirement 1

Owner can read/write.

Group can read.

Others have no access.

```text
?
```

### Requirement 2

Owner can read/write/execute.

Group can read/execute.

Others can read/execute.

```text
?
```

### Requirement 3

Only owner has full access.

```text
?
```

Expected answers:

```text
640
755
700
```

---

# ☁️ AWS Connection

Permissions are critical on EC2.

Example:

```text
/var/www/html
/etc/nginx
/home/ec2-user
/var/log
```

Incorrect permissions can cause:

```text
Permission denied
Web server errors
Application startup failures
Deployment failures
SSH key problems
```

A common example is an SSH private key that is too permissive.

---

# 🧠 Interview Questions

1. What are Linux file permissions?
2. What does `r` mean?
3. What does `w` mean?
4. What does `x` mean?
5. What is `chmod`?
6. What does `chmod 755` mean?
7. What does `chmod 644` mean?
8. What does `chmod 600` mean?
9. What is the difference between file and directory execute permission?
10. What is SUID?
11. What is SGID?
12. What is the sticky bit?
13. Why is `/tmp` commonly associated with the sticky bit?
14. What does `chmod -R` do?
15. How would you troubleshoot `Permission denied`?

---

# ✅ Checklist

- [ ] Understand read
- [ ] Understand write
- [ ] Understand execute
- [ ] Understand user/group/others
- [ ] Read `ls -l`
- [ ] Understand numeric permissions
- [ ] Practice `chmod`
- [ ] Understand directory permissions
- [ ] Understand SUID
- [ ] Understand SGID
- [ ] Understand sticky bit
- [ ] Complete permission lab
- [ ] Complete permission challenge
- [ ] Practice AWS permission scenarios

---

## Next

➡️ [Ownership](./Ownership.md)