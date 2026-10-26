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

# 6. Home Directory

Check:

```bash
echo $HOME
```

Example:

```text
/home/ubuntu
```

---

# 7. System Users

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