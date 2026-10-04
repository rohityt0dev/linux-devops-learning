# 👤 Linux Users

## 📌 Overview

A Linux user account represents an identity that can access the system.

Each user normally has:

```text
Username
UID
Primary GID
Home Directory
Login Shell
Password information
```

---

# 1. Check Current User

```bash
whoami
```

Example:

```text
ubuntu
```

---

# 2. Check User Identity

```bash
id
```

Example:

```text
uid=1000(user) gid=1000(user) groups=1000(user),27(sudo)
```

---

# 3. Check Another User

```bash
id username
```

Example:

```bash
id root
```

---

# 4. List Users

Linux user information can be queried from the system account database.

```bash
getent passwd
```

You can also inspect:

```bash
cat /etc/passwd
```

---

# 5. `/etc/passwd`

A typical entry looks like:

```text
username:x:1001:1001:User Name:/home/username:/bin/bash
```

Fields:

```text
1. Username
2. Password placeholder
3. UID
4. Primary GID
5. GECOS/comment
6. Home directory
7. Login shell
```

Passwords are normally not stored directly in `/etc/passwd` on modern Linux systems.

---

# 6. `/etc/shadow`

Password hashes and password-aging information are normally stored in:

```text
/etc/shadow
```

View only with appropriate privileges:

```bash
sudo cat /etc/shadow
```

⚠️ Do not share `/etc/shadow` contents.

---

# 7. Root User

The root account has UID:

```text
0
```

Check:

```bash
id root
```

Root has extensive administrative privileges, so it should be used carefully.

---

# 8. Home Directory

Check:

```bash
echo $HOME
```

Example:

```text
/home/ubuntu
```

For another user:

```bash
getent passwd username
```

---

# 9. Login Shell

Check:

```bash
getent passwd username
```

The last field normally contains the user's login shell.

Examples:

```text
/bin/bash
/bin/sh
/bin/zsh
```

---

# 10. System Users

Linux also has service/system accounts.

Examples may include accounts associated with:

```text
Web servers
Databases
System services
Logging
Applications
```

These accounts are generally used by services rather than human interactive users.

---

# 🧪 User Lab

Create a test user:

```bash
sudo useradd -m labuser
```

Set password:

```bash
sudo passwd labuser
```

Check:

```bash
id labuser
```

Check account information:

```bash
getent passwd labuser
```

Check home directory:

```bash
ls -ld /home/labuser
```

---

# 🧪 User Investigation

Investigate your own account:

```bash
whoami
id
echo $HOME
echo $SHELL
getent passwd "$USER"
```

Record:

```text
Username:
UID:
Primary GID:
Groups:
Home:
Shell:
```

---

# 🎯 Challenge

Without looking at your notes:

1. Find your username.
2. Find your UID.
3. Find your primary GID.
4. Find all groups.
5. Find your home directory.
6. Find your shell.
7. Find the root UID.
8. Find the user database file.
9. Find the password database file.

---

# ☁️ AWS Connection

On EC2, knowing the login user is important when connecting through SSH.

Examples can include:

```text
ubuntu
ec2-user
```

The correct username depends on the AMI.

---

# 🧠 Interview Questions

1. What is a Linux user?
2. What is UID?
3. What is GID?
4. What is UID 0?
5. What is `/etc/passwd`?
6. What is `/etc/shadow`?
7. Where is a user's home directory defined?
8. How do you find a user's shell?
9. What is a system user?
10. What is the difference between root and a normal user?

---

# ✅ Checklist

- [ ] Understand users
- [ ] Understand UID
- [ ] Understand GID
- [ ] Understand root
- [ ] Understand `/etc/passwd`
- [ ] Understand `/etc/shadow`
- [ ] Understand home directories
- [ ] Understand login shells
- [ ] Understand system accounts
- [ ] Complete user lab
- [ ] Complete user challenge

---