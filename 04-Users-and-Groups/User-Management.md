
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
check
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