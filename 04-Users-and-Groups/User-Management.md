
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

Create with home directory:

```bash
sudo useradd -m labuser
```

Specify shell:

```bash
sudo useradd -m -s /bin/bash labuser
```

---

# 2. Create User with Group

```bash
sudo useradd -m -g developers labuser
```

Add supplementary group:

```bash
sudo useradd -m -G developers,operations labuser
```

---

# 3. Set Password

```bash
sudo passwd labuser
```

---

# 4. Modify User

Change shell:

```bash
sudo usermod -s /bin/bash labuser
```

Change home directory:

```bash
sudo usermod -d /home/newhome -m labuser
```

Change primary group:

```bash
sudo usermod -g developers labuser
```

Add supplementary group:

```bash
sudo usermod -aG operations labuser
```

---

# 5. Lock User

```bash
sudo usermod -L labuser
```

Check:

```bash
sudo passwd -S labuser
```

---

# 6. Unlock User

```bash
sudo usermod -U labuser
```

---

# 7. Delete User

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

# 8. Check User

```bash
id labuser
```

```bash
getent passwd labuser
```

---

# 9. Account Expiration

View:

```bash
sudo chage -l labuser
```

Set expiration date:

```bash
sudo chage -E 2027-12-31 labuser
```

---

# 10. Create an Administration Lab

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

# 🧪 User Management Scenario

### Requirement

Create:

```text
developer1
developer2
operator1
```

Groups:

```text
developers
operations
```

Requirements:

```text
developer1 → developers
developer2 → developers
operator1  → operations
```

Then:

1. Lock `developer2`.
2. Unlock `developer2`.
3. Set an account expiration date for `operator1`.
4. Check all users.
5. Generate a user report.

Commands:

```bash
getent passwd developer1
getent passwd developer2
getent passwd operator1
```

---

# 🚨 Troubleshooting

If a user cannot log in, check:

```bash
id username
```

Check account status:

```bash
sudo passwd -S username
```

Check expiration:

```bash
sudo chage -l username
```

Check shell:

```bash
getent passwd username
```

Check home directory:

```bash
ls -ld /home/username
```

Check authentication logs using your distribution's logging system.

---

# ☁️ AWS Connection

On an EC2 server, you may create separate users for:

```text
Developers
Operations
Application services
Automation
Monitoring
```

Avoid sharing one administrative account among multiple people when individual accounts can provide better accountability.

---

# 🧠 Interview Questions

1. How do you create a Linux user?
2. How do you create a user with a home directory?
3. How do you set a password?
4. How do you modify a user?
5. How do you add a user to a group?
6. Why use `usermod -aG`?
7. How do you lock a user?
8. How do you unlock a user?
9. How do you delete a user?
10. What does `userdel -r` do?
11. How do you check account expiration?
12. How would you troubleshoot login failure?

---

# ✅ Checklist

- [ ] Create users
- [ ] Create home directories
- [ ] Set passwords
- [ ] Modify users
- [ ] Add groups
- [ ] Lock users
- [ ] Unlock users
- [ ] Delete users
- [ ] Configure expiration
- [ ] Troubleshoot login
- [ ] Complete administration lab
- [ ] Complete scenario