# 👤 Linux File Ownership

## 📌 Overview

Linux files and directories normally have an associated:

```text
Owner
Group
```

Ownership works together with permissions to control access.

---

# 🎯 Learning Objectives

After completing this topic, I should understand:

- File owner
- Group owner
- `ls -l`
- `stat`
- `chown`
- `chgrp`
- Recursive ownership
- Ownership troubleshooting

---

# 1. Check Ownership

Run:

```bash
ls -l file.txt
```

Example:

```text
-rw-r--r-- user developers file.txt
```

Here:

```text
user       = owner
developers = group
```

---

# 2. `stat`

Get detailed metadata:

```bash
stat file.txt
```

Look for:

```text
Uid
Gid
Access
Modify
Change
```

---

# 3. Change Owner

Use:

```bash
sudo chown alice file.txt
```

Verify:

```bash
ls -l file.txt
```

---

# 4. Change Group

Use:

```bash
sudo chgrp developers file.txt
```

Verify:

```bash
ls -l file.txt
```

---

# 5. Change Owner and Group

Use:

```bash
sudo chown alice:developers file.txt
```

---
