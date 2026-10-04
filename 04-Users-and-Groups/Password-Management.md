
# 🔐 Password-Management.md

# Linux Password Management

## 📌 Overview

Linux provides commands for managing user passwords and password-aging policies.

Important commands:

```text
passwd
chage
usermod
```

Password information is normally protected in:

```text
/etc/shadow
```

---

# 🎯 Learning Objectives

- Set passwords
- Change passwords
- Check password status
- Lock passwords
- Unlock passwords
- Configure password expiration
- Configure minimum/maximum password age
- Understand `/etc/shadow`
- Troubleshoot password-related login problems

---

# 1. Set User Password

```bash
sudo passwd username
```

Example:

```bash
sudo passwd labuser
```

---

# 2. Change Your Own Password

```bash
passwd
```

The system normally asks for:

```text
Current password
New password
Confirm new password
```

---

# 3. Check Password Status

```bash
sudo passwd -S username
```

---

# 4. Lock Password

```bash
sudo passwd -l username
```

This locks password-based authentication for the account.

---

# 5. Unlock Password

```bash
sudo passwd -u username
```

---

# 6. Password Aging

View:

```bash
sudo chage -l username
```

This can show information such as:

```text
Last password change
Password expires
Password inactive
Account expires
Minimum days
Maximum days
Warning period
```

---

# 7. Set Password Expiration

Example:

```bash
sudo chage -M 90 username
```

This configures a maximum password age of 90 days.

---

# 8. Set Minimum Password Age

```bash
sudo chage -m 1 username
```

---

# 9. Set Warning Period

```bash
sudo chage -W 7 username
```

This configures a warning period before password expiration.

---

# 10. Set Account Expiration

```bash
sudo chage -E 2027-12-31 username
```

---

# 11. Force Password Change

Force the user to change their password at next login:

```bash
sudo passwd -e username
```

---

# 12. `/etc/shadow`

Inspect carefully:

```bash
sudo cat /etc/shadow
```

A shadow entry contains protected password-related information and aging fields.

Example structure:

```text
username:$hash:change:min:max:warn:inactive:expire:reserved
```

Do not share shadow-file contents.

---

# 13. Password Security

Good practices include:

- Use strong passwords.
- Never share passwords.
- Avoid password reuse.
- Use SSH keys where appropriate for server access.
- Limit administrative access.
- Follow organizational password policies.
- Use MFA where supported.
- Monitor authentication activity.

---

# 🧪 Password Lab

Create a test user:

```bash
sudo useradd -m passwordlab
```

Set password:

```bash
sudo passwd passwordlab
```

Check:

```bash
sudo passwd -S passwordlab
```

View aging:

```bash
sudo chage -l passwordlab
```

---

# 🧪 Password Aging Lab

Set:

```bash
sudo chage -M 90 passwordlab
sudo chage -m 1 passwordlab
sudo chage -W 7 passwordlab
```

Check:

```bash
sudo chage -l passwordlab
```

---

# 🧪 Force Password Change

```bash
sudo passwd -e passwordlab
```

Check:

```bash
sudo chage -l passwordlab
```

---

# 🧪 Lock / Unlock

Lock:

```bash
sudo passwd -l passwordlab
```

Check:

```bash
sudo passwd -S passwordlab
```

Unlock:

```bash
sudo passwd -u passwordlab
```

---

# 🚨 Password Troubleshooting

If a user cannot authenticate, investigate:

```bash
id username
sudo passwd -S username
sudo chage -l username
```

Check:

```text
Account locked?
Password expired?
Account expired?
Shell valid?
Home directory available?
Authentication logs?
```

Do not immediately reset the password without understanding the cause.

---

# ☁️ AWS Connection

On EC2, SSH key-based authentication is commonly used instead of normal Linux password authentication.

Linux password management is still important for:

```text
Local users
Service accounts
Administrative accounts
Internal applications
Bastion hosts
Linux VMs
```

---

# 🧠 Interview Questions

1. How do you set a Linux user's password?
2. How do you change your own password?
3. How do you check password status?
4. How do you lock a password?
5. How do you unlock a password?
6. What is `/etc/shadow`?
7. What does `chage` do?
8. How do you check password expiration?
9. How do you force a password change?
10. How do you troubleshoot an expired account?
11. What is the difference between password locking and account expiration?
12. Why is SSH key authentication commonly preferred for cloud servers?

---

# 🎯 Final User Administration Challenge

Build the following environment:

```text
Users
├── developer1
├── developer2
└── operator1

Groups
├── developers
├── operations
└── cloud
```

Requirements:

```text
developer1
├── developers
└── cloud

developer2
├── developers
└── cloud

operator1
├── operations
└── cloud
```

Then:

1. Set passwords.
2. Check UID/GID.
3. Check group membership.
4. Configure sudo access appropriately.
5. Check password aging.
6. Lock `developer2`.
7. Verify the lock.
8. Unlock `developer2`.
9. Verify again.
10. Generate a final user/group report.

Useful commands:

```bash
id developer1
id developer2
id operator1

getent group developers
getent group operations
getent group cloud

sudo passwd -S developer1
sudo passwd -S developer2
sudo passwd -S operator1

sudo chage -l developer1
sudo chage -l developer2
sudo chage -l operator1
```

---

# ☁️ Cloud Engineer Scenario

### Scenario

You have an EC2 Linux server.

Three people need access:

```text
Developer
Developer
Operations Engineer
```

Requirements:

```text
Developers
    ↓
Application files

Operations
    ↓
Logs + service administration
```

Design:

```text
Users
  │
  ├── Developers
  │      └── developers group
  │
  └── Operations
         └── operations group
```

Then combine:

```text
Users
   +
Groups
   +
File Ownership
   +
Permissions
   +
Sudo
```

to implement least-privilege access.

---

# 🏆 Section Completion Checklist

- [ ] Understand Linux users
- [ ] Understand UID
- [ ] Understand GID
- [ ] Understand primary groups
- [ ] Understand supplementary groups
- [ ] Understand `/etc/passwd`
- [ ] Understand `/etc/shadow`
- [ ] Understand `/etc/group`
- [ ] Create users
- [ ] Modify users
- [ ] Delete users
- [ ] Create groups
- [ ] Modify groups
- [ ] Add users to groups
- [ ] Remove users from groups
- [ ] Understand sudo
- [ ] Configure sudo safely
- [ ] Understand password management
- [ ] Configure password aging
- [ ] Lock/unlock accounts
- [ ] Complete final challenge
- [ ] Practice AWS EC2 user administration
- [ ] Practice interview questions

---

## 🚀 Next Repository Section

After completing:

```text
04-Users-and-Groups/
```

continue with:

```text
05-Processes-and-Services/
```

Topics:

```text
Processes
Process Management
systemd
Services
Cron Jobs
```