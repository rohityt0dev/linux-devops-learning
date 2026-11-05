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

# 3. File Type Indicators

When you run:

```bash
ls -l
```

the first character indicates the object type.

| Symbol | Type |
|---|---|
| `-` | Regular file |
| `d` | Directory |

---