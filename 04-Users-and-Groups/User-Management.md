
# 👤 User-Management.md

# Linux User Management

## 📌 Overview

User management involves creating, modifying, locking, unlocking, and deleting Linux user accounts.

Main commands:

```text
useradd
usermod
userdel
passwd
id
chage
```

---

# 1. Create User

Basic:

```bash
sudo useradd labuser
```

---

# 2. Create User with Group

```bash
sudo useradd -m -g developers labuser
```

---

# 3. Set Password

```bash
sudo passwd labuser
```

---

# 4. Delete User

Delete account:

```bash
sudo userdel labuser
```

Delete account and home directory:

```bash
sudo userdel -r labuser
```

⚠️ Always verify the account before deleting it.

---

# 5. Check User

```bash
id labuser
```
---

# 6. Create an Administration Lab

Create:

```bash
sudo useradd -m -s /bin/bash developer1
sudo useradd -m -s /bin/bash developer2
sudo useradd -m -s /bin/bash operator1
```

Set passwords:

```bash
sudo passwd developer1
sudo passwd developer2
sudo passwd operator1
```

Create groups:

```bash
sudo groupadd developers
sudo groupadd operations
```

Assign:

```bash
sudo usermod -aG developers developer1
sudo usermod -aG developers developer2
sudo usermod -aG operations operator1
```

Verify:

```bash
id developer1
id developer2
id operator1
```

---