# 🔑 Sudo.md

# Linux Sudo

## 📌 Overview

`sudo` allows an authorized user to execute commands with elevated privileges.

Instead of logging in directly as root for every administrative task, an administrator can use:

```bash
sudo command
```

Example:

```bash
sudo systemctl restart nginx
```

---

# 🎯 Learning Objectives

- Understand sudo
- Understand root privileges
- Use `sudo`
- Check sudo access
- Understand `/etc/sudoers`
- Use `visudo`
- Configure least privilege
- Troubleshoot sudo problems

---

# 1. Check Sudo

Run:

```bash
sudo -v
```

If successful, the user's sudo credentials are validated.

---

# 2. Run a Command as Root

```bash
sudo whoami
```

Expected:

```text
root
```

---

# 3. Check Sudo Permissions

```bash
sudo -l
```

This shows commands the current user is permitted to run through sudo.

---

# 4. Root Shell

A root shell can be started with:

```bash
sudo -i
```

Check:

```bash
whoami
```

Exit:

```bash
exit
```

Use root shells carefully.

---

# 5. `/etc/sudoers`

The main sudo policy file is:

```text
/etc/sudoers
```

Do not casually edit it with a normal text editor.

Use:

```bash
sudo visudo
```

`visudo` checks syntax before installing the modified policy.

---

# 6. Sudo Group

Depending on the Linux distribution, administrative users may belong to a group such as:

```text
sudo
```

or:

```text
wheel
```

Check:

```bash
groups
```

---

# 7. Check Group

On a Debian/Ubuntu-style system:

```bash
getent group sudo
```

On a Red Hat-family system:

```bash
getent group wheel
```

---

# 8. Add User to Administrative Group

On systems using `sudo`:

```bash
sudo usermod -aG sudo developer1
```

On systems using `wheel`:

```bash
sudo usermod -aG wheel developer1
```

The exact configuration depends on the distribution.

---

# 9. Least Privilege

Do not automatically give every user full root access.

Prefer:

```text
Required permission
        ↓
Specific command
        ↓
Specific user/group
```

Instead of:

```text
Everything
```

---

# 10. Sudoers Example

A sudoers rule can grant specific command access.

Conceptually:

```text
developer1 ALL=(root) /usr/bin/systemctl restart nginx
```

Use `visudo` and follow your distribution's sudoers configuration conventions.

---

# 🧪 Sudo Lab

Check:

```bash
sudo -l
```

Run:

```bash
sudo whoami
```

Then:

```bash
sudo id
```

Check administrative groups:

```bash
groups
```

---

# 🧪 Sudo Scenario

Create:

```text
developer1
```

Requirement:

```text
developer1
    │
    └── Can restart nginx
```

But should not automatically receive unrestricted root access.

Think about:

```text
Least privilege
Sudo policy
Specific command
```

---

# 🚨 Troubleshooting Sudo

If you see:

```text
user is not in the sudoers file
```

Check:

```bash
id username
```

Then check:

```bash
getent group sudo
```

or:

```bash
getent group wheel
```

Check sudo policy carefully:

```bash
sudo visudo
```

---

# ☁️ AWS Connection

Sudo is used frequently on EC2.

Examples:

```bash
sudo apt update
sudo systemctl restart nginx
sudo mkdir /opt/application
sudo mount /dev/xvdf /data
```

The exact device names and commands depend on the AMI and configuration.

---

# 🧠 Interview Questions

1. What is sudo?
2. Why use sudo instead of logging in as root?
3. What does `sudo -l` do?
4. What is `/etc/sudoers`?
5. Why should `visudo` be used?
6. What is least privilege?
7. What is the difference between sudo and su?
8. What is the sudo group?
9. What is the wheel group?
10. How would you troubleshoot a sudo access problem?

---

# ✅ Checklist

- [ ] Understand sudo
- [ ] Run commands with sudo
- [ ] Check sudo access
- [ ] Understand root privileges
- [ ] Understand `/etc/sudoers`
- [ ] Practice `visudo`
- [ ] Understand sudo groups
- [ ] Understand least privilege
- [ ] Complete sudo lab
- [ ] Complete troubleshooting scenario


---
