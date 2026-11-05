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
