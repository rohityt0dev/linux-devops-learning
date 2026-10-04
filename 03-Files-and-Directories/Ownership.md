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

# 6. Recursive Ownership

Change ownership of a directory and its contents:

```bash
sudo chown -R alice:developers project/
```

⚠️ Use recursive ownership changes carefully.

---

# 7. Ownership and Permissions

Consider:

```text
-rw-r----- 
alice developers file.txt
```

The permission classes are:

```text
Owner
Group
Others
```

The owner/group determine which permission set applies.

---

# 8. Numeric User and Group IDs

Linux internally identifies users and groups using:

```text
UID
GID
```

Check:

```bash
id
```

Example:

```text
uid=1000(user) gid=1000(user)
```

---

# 🧪 Hands-On Lab

Create:

```bash
mkdir ownership-lab
cd ownership-lab
touch file.txt
```

Check:

```bash
ls -l file.txt
```

Then:

```bash
stat file.txt
```

Check current identity:

```bash
id
```

---

# 🧪 Change Group

If you have a suitable group available:

```bash
sudo chgrp <group> file.txt
```

Verify:

```bash
ls -l file.txt
```

---

# 🧪 Change Owner

If you have another test user:

```bash
sudo chown <user> file.txt
```

Verify:

```bash
ls -l file.txt
```

Restore ownership as needed for your lab.

---

# 🎯 Ownership Challenge

Create:

```text
ownership-project/
├── application/
├── logs/
└── backup/
```

Determine:

1. Current owner.
2. Current group.
3. UID.
4. GID.
5. Permissions.

Use:

```bash
ls -l
stat
id
```

---

# 🚨 Troubleshooting Scenario

You try:

```bash
cat application/config.txt
```

and receive:

```text
Permission denied
```

Investigate:

```bash
ls -l application/config.txt
```

Then:

```bash
id
```

Check:

```text
Owner
Group
Permissions
```

Do not immediately use:

```bash
chmod 777
```

Instead, understand why access is denied and make the smallest appropriate change.

---

# ☁️ AWS Connection

Ownership is important on EC2 web servers.

Example:

```text
/var/www/html
```

An application may run under a service account while administrators use a different account.

Incorrect ownership can result in:

```text
Permission denied
Deployment failure
Application failure
Log access failure
```

---

# 🧠 Interview Questions

1. What is file ownership?
2. What is the difference between owner and group?
3. What does `chown` do?
4. What does `chgrp` do?
5. What does `chown user:group file` do?
6. What does `chown -R` do?
7. What is UID?
8. What is GID?
9. How do you check file ownership?
10. How would you troubleshoot an ownership-related permission problem?

---

# ✅ Checklist

- [ ] Understand owner
- [ ] Understand group
- [ ] Understand UID
- [ ] Understand GID
- [ ] Practice `ls -l`
- [ ] Practice `stat`
- [ ] Practice `id`
- [ ] Practice `chown`
- [ ] Practice `chgrp`
- [ ] Understand recursive ownership
- [ ] Complete ownership lab
- [ ] Complete troubleshooting scenario
- [ ] Practice AWS ownership scenarios

---

## Next

➡️ [Links](./Links.md)