# 📄 Linux File Types

## 📌 Overview

Linux uses different filesystem object types.

The most common are:

```text
Regular file
Directory
Symbolic link
Character device
Block device
Named pipe
Socket
```

Understanding file types is important when administering Linux systems.

---

# 🎯 Learning Objectives

After completing this topic, I should understand:

- Regular files
- Directories
- Symbolic links
- Character devices
- Block devices
- Named pipes
- Unix sockets
- `ls -l`
- `file`
- File type indicators

---

# 1. Regular File

A regular file stores data.

Examples:

```text
.txt
.log
.conf
.sh
.jpg
.html
```

Create:

```bash
touch example.txt
```

Check:

```bash
file example.txt
```

---

# 2. Directory

A directory contains references to files and other directories.

Create:

```bash
mkdir my-directory
```

Check:

```bash
ls -ld my-directory
```

A directory is represented by:

```text
d
```

Example:

```text
drwxr-xr-x
```

---

# 3. Symbolic Link

A symbolic link points to another pathname.

Create:

```bash
ln -s example.txt example-link.txt
```

Check:

```bash
ls -l example-link.txt
```

Example:

```text
example-link.txt -> example.txt
```

Symbolic links are represented by:

```text
l
```

---

# 4. Character Device

Character devices provide character-by-character I/O.

Examples can include:

```text
/dev/tty
/dev/random
/dev/null
```

Check:

```bash
ls -l /dev/null
```

The first character is:

```text
c
```

---

# 5. Block Device

Block devices provide block-oriented access to storage devices.

Examples:

```text
/dev/sda
/dev/nvme0n1
```

Check:

```bash
ls -l /dev | head
```

The type indicator is:

```text
b
```

---

# 6. Named Pipe

A named pipe is also called a FIFO.

It allows processes to communicate through a filesystem object.

Create:

```bash
mkfifo mypipe
```

Check:

```bash
ls -l mypipe
```

The type indicator is:

```text
p
```

Remove:

```bash
rm mypipe
```

---

# 7. Unix Socket

Unix sockets allow local processes to communicate.

Examples may be found under:

```text
/run
```

Check:

```bash
find /run -type s 2>/dev/null | head
```

Socket type:

```text
s
```

---

# 8. File Type Indicators

When you run:

```bash
ls -l
```

the first character indicates the object type.

| Symbol | Type |
|---|---|
| `-` | Regular file |
| `d` | Directory |
| `l` | Symbolic link |
| `c` | Character device |
| `b` | Block device |
| `p` | Named pipe |
| `s` | Socket |

---

# 9. `file` Command

The `file` command attempts to identify a file's type/content.

```bash
file example.txt
```

Examples:

```bash
file /bin/bash
file /etc/passwd
file image.jpg
```

---

# 🧪 Hands-On Lab

Create:

```bash
mkdir file-types-lab
cd file-types-lab
```

Regular file:

```bash
touch regular.txt
```

Directory:

```bash
mkdir directory
```

Symbolic link:

```bash
ln -s regular.txt symbolic-link
```

Named pipe:

```bash
mkfifo pipe
```

Check:

```bash
ls -l
```

Expected indicators:

```text
-  regular file
d  directory
l  symbolic link
p  named pipe
```

---

# 🧪 Device Lab

Run:

```bash
ls -l /dev/null
```

Then:

```bash
ls -l /dev/zero
```

Try:

```bash
ls -l /dev | head -20
```

Identify which entries are:

```text
Character devices
Block devices
```

---

# 🎯 Challenge

Find examples of:

1. Regular file
2. Directory
3. Symbolic link
4. Character device
5. Block device
6. Named pipe
7. Unix socket

Record:

```text
Object:
Path:
Type:
How I identified it:
```

---

# 🧠 Interview Questions

1. What are Linux file types?
2. What does `-` mean in `ls -l`?
3. What does `d` mean?
4. What does `l` mean?
5. What is a character device?
6. What is a block device?
7. What is a named pipe?
8. What is a Unix socket?
9. How do you identify a file type?
10. What is the difference between a symbolic link and a regular file?

---

# ✅ Checklist

- [ ] Regular files
- [ ] Directories
- [ ] Symbolic links
- [ ] Character devices
- [ ] Block devices
- [ ] Named pipes
- [ ] Unix sockets
- [ ] Practice `file`
- [ ] Practice `ls -l`
- [ ] Complete file type lab
- [ ] Complete challenge

---

## Next

➡️ [Permissions](./Permissions.md)