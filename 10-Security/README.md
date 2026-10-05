# `10-Security/README.md`

# 🔐 Linux Security

This section covers the basic security concepts required for Linux system administration.

## 📚 Topics

- [SSH Security](./SSH-Security.md)
- [File Permissions](./File-Permissions.md)
- [Firewall](./Firewall.md)
- [SELinux](./SELinux.md)
- [Security Best Practices](./Security-Best-Practices.md)

## 🎯 Learning Objectives

By completing this section, you should understand:

- SSH security
- Linux file permissions
- Users and ownership
- Firewall configuration
- SELinux basics
- Linux security best practices
- Basic security troubleshooting

## 🔐 Security Layers

```text
User Authentication
        ↓
SSH Security
        ↓
File Permissions
        ↓
Firewall
        ↓
SELinux
        ↓
System Hardening
```

## 🧪 Practice

Practice these tasks:

```bash
chmod
chown
ssh
ss
firewall-cmd
ufw
getenforce
sestatus
```

## ✅ Checklist

- [ ] Understand SSH security
- [ ] Understand permissions
- [ ] Understand ownership
- [ ] Configure a firewall
- [ ] Understand SELinux modes
- [ ] Apply basic security practices

---

# `10-Security/SSH-Security.md`

# 🔑 SSH Security

## 📌 Overview

SSH provides secure remote access to Linux systems.

Default SSH port:

```text
22
```

Check SSH service:

```bash
systemctl status ssh
```

On some distributions:

```bash
systemctl status sshd
```

## 🔍 Check SSH Configuration

Main configuration file:

```bash
/etc/ssh/sshd_config
```

View configuration:

```bash
sudo cat /etc/ssh/sshd_config
```

Edit:

```bash
sudo vim /etc/ssh/sshd_config
```

After changes, validate:

```bash
sudo sshd -t
```

Restart SSH:

```bash
sudo systemctl restart ssh
```

## 🔐 SSH Key Authentication

Generate a key:

```bash
ssh-keygen
```

Common files:

```text
~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub
```

Copy public key:

```bash
ssh-copy-id user@server
```

Connect:

```bash
ssh user@server
```

## 🔒 Basic SSH Hardening

Important settings:

```text
PermitRootLogin no
PasswordAuthentication no
```

Only disable password authentication after confirming key-based login works.

After modifying SSH configuration:

```bash
sudo sshd -t
```

Then:

```bash
sudo systemctl restart ssh
```

## 🔍 Check SSH Connections

```bash
ss -tnp | grep :22
```

View login history:

```bash
last
```

View failed login attempts:

```bash
sudo journalctl -u ssh
```

## 🧪 Lab

1. Create an SSH key.
2. Configure key-based authentication.
3. Test login.
4. Check SSH logs.
5. Test configuration using `sshd -t`.

## 🎤 Interview Questions

1. What is SSH?
2. What port does SSH use?
3. What is SSH key authentication?
4. Where is SSH server configuration stored?
5. Difference between private and public keys?
6. Why should root SSH login generally be disabled?
7. How do you validate SSH configuration?
8. How do you troubleshoot SSH login problems?

## ✅ Checklist

- [ ] Understand SSH
- [ ] Generate SSH keys
- [ ] Use key authentication
- [ ] Understand `sshd_config`
- [ ] Validate SSH configuration
- [ ] Check SSH logs
- [ ] Understand SSH hardening

---

# `10-Security/File-Permissions.md`

# 📁 Linux File Permissions

## 📌 Overview

Linux permissions control who can:

- Read
- Write
- Execute

a file or directory.

## 🔍 View Permissions

```bash
ls -l
```

Example:

```text
-rwxr-xr--  user  group  script.sh
```

Permission groups:

```text
Owner | Group | Others
```

Example:

```text
rwx | r-x | r--
```

## 🔤 Permission Values

| Permission | Symbol | Value |
|---|---|---:|
| Read | `r` | 4 |
| Write | `w` | 2 |
| Execute | `x` | 1 |

Example:

```text
rwx = 4 + 2 + 1 = 7
r-x = 4 + 0 + 1 = 5
r-- = 4 + 0 + 0 = 4
```

Therefore:

```text
754
```

means:

```text
Owner  → rwx
Group  → r-x
Others → r--
```

## 🔧 chmod

Symbolic:

```bash
chmod u+x script.sh
chmod g+w file.txt
chmod o-r file.txt
```

Numeric:

```bash
chmod 755 script.sh
chmod 644 file.txt
chmod 600 private.txt
```

## 👤 chown

Change owner:

```bash
sudo chown user file.txt
```

Change owner and group:

```bash
sudo chown user:group file.txt
```

Recursive:

```bash
sudo chown -R user:group directory/
```

Use recursive ownership changes carefully.

## 👥 chgrp

```bash
sudo chgrp developers file.txt
```

## 📂 Directory Permissions

For directories:

```text
r → list directory contents
w → create/delete entries
x → access/traverse directory
```

## 🔐 Common Permissions

```text
600 → private file
644 → normal file
700 → private directory
755 → executable/shared directory
```

Avoid giving unnecessary permissions such as:

```bash
chmod 777 file
```

## 🧪 Lab

Create:

```bash
touch test.txt
chmod 600 test.txt
ls -l test.txt
```

Then:

```bash
chmod 644 test.txt
ls -l test.txt
```

## 🎤 Interview Questions

1. What are Linux permissions?
2. What does `755` mean?
3. What does `644` mean?
4. Difference between `chmod` and `chown`?
5. What does execute permission mean on a directory?
6. Why should `777` generally be avoided?
7. What are owner, group, and others?

## ✅ Checklist

- [ ] Understand `rwx`
- [ ] Understand numeric permissions
- [ ] Use `chmod`
- [ ] Use `chown`
- [ ] Use `chgrp`
- [ ] Understand directory permissions
- [ ] Avoid unnecessary permissions

---

# `10-Security/Firewall.md`

# 🧱 Linux Firewall

## 📌 Overview

A firewall controls network traffic entering or leaving a system.

Common Linux firewall tools:

```text
UFW
firewalld
nftables
iptables
```

The exact tool depends on the Linux distribution.

---

## 🔥 UFW

Check status:

```bash
sudo ufw status
```

Enable:

```bash
sudo ufw enable
```

Allow SSH:

```bash
sudo ufw allow 22/tcp
```

Allow HTTP:

```bash
sudo ufw allow 80/tcp
```

Allow HTTPS:

```bash
sudo ufw allow 443/tcp
```

Deny a port:

```bash
sudo ufw deny 23/tcp
```

Delete a rule:

```bash
sudo ufw delete allow 80/tcp
```

---

## 🔥 firewalld

Check status:

```bash
sudo firewall-cmd --state
```

List active rules:

```bash
sudo firewall-cmd --list-all
```

Allow SSH:

```bash
sudo firewall-cmd --permanent --add-service=ssh
```

Allow HTTP:

```bash
sudo firewall-cmd --permanent --add-service=http
```

Reload:

```bash
sudo firewall-cmd --reload
```

Remove service:

```bash
sudo firewall-cmd --permanent --remove-service=http
```

---

## 🔍 Check Listening Ports

```bash
ss -tuln
```

With process information:

```bash
sudo ss -tulpn
```

## 🔐 Firewall Principle

Allow only required traffic.

```text
Required
   ↓
Allow

Not required
   ↓
Block
```

## 🧪 Lab

1. Check firewall status.
2. Allow SSH.
3. Allow HTTP.
4. List rules.
5. Remove HTTP.
6. Verify the final configuration.

## 🎤 Interview Questions

1. What is a firewall?
2. What is UFW?
3. What is firewalld?
4. What is the difference between firewall and application?
5. How do you check listening ports?
6. How do you allow SSH?
7. Why should unnecessary ports be closed?

## ✅ Checklist

- [ ] Understand firewall purpose
- [ ] Use UFW
- [ ] Use firewalld
- [ ] Allow ports
- [ ] Remove rules
- [ ] Check listening ports
- [ ] Apply least-access principles

---

# `10-Security/SELinux.md`

# 🛡️ SELinux

## 📌 Overview

**SELinux** stands for:

> Security-Enhanced Linux

SELinux provides an additional security layer using **Mandatory Access Control (MAC)**.

Traditional Linux permissions use:

```text
Owner
Group
Others
```

SELinux adds security policies on top of these permissions.

---

## 🔍 Check SELinux Status

```bash
getenforce
```

Possible results:

```text
Enforcing
Permissive
Disabled
```

Detailed status:

```bash
sestatus
```

---

## 🔐 SELinux Modes

### Enforcing

SELinux policy is enforced.

```text
Enforcing
```

### Permissive

Policy violations are logged but not blocked.

```text
Permissive
```

### Disabled

SELinux is disabled.

```text
Disabled
```

---

## 🔧 Change Mode Temporarily

Set permissive:

```bash
sudo setenforce 0
```

Set enforcing:

```bash
sudo setenforce 1
```

Check:

```bash
getenforce
```

These changes are generally temporary and may not persist after reboot.

---

## 🔍 SELinux Context

View contexts:

```bash
ls -Z
```

Example:

```text
-rw-r--r-- user user system_u:object_r:...
```

The SELinux context provides additional security information.

---

## 🔎 Search SELinux Denials

On systems using the SELinux audit logs:

```bash
sudo ausearch -m AVC -ts recent
```

You can also inspect audit logs:

```bash
sudo journalctl
```

---

## 🧪 Lab

Check:

```bash
getenforce
sestatus
```

Then:

```bash
ls -Z
```

If SELinux is enabled, inspect recent AVC denials:

```bash
sudo ausearch -m AVC -ts recent
```

---

## ⚠️ Important

Do not disable SELinux simply because an application is having problems.

First investigate:

```text
Application
    ↓
Permissions
    ↓
SELinux context
    ↓
SELinux policy
    ↓
Audit logs
```

---

## 🎤 Interview Questions

1. What is SELinux?
2. What does MAC mean?
3. What are SELinux modes?
4. Difference between enforcing and permissive?
5. How do you check SELinux status?
6. What does `getenforce` do?
7. What does `sestatus` do?
8. What does `ls -Z` show?
9. What is an AVC denial?
10. Why should SELinux not be disabled immediately?

## ✅ Checklist

- [ ] Understand SELinux
- [ ] Understand MAC
- [ ] Know three SELinux modes
- [ ] Use `getenforce`
- [ ] Use `sestatus`
- [ ] Understand SELinux contexts
- [ ] Check AVC denials
- [ ] Troubleshoot before disabling SELinux

---

# `10-Security/Security-Best-Practices.md`

# 🔐 Linux Security Best Practices

## 📌 Overview

Linux security is not a single configuration. It is a combination of:

```text
Authentication
     +
Permissions
     +
Firewall
     +
Updates
     +
Logging
     +
Access Control
```

---

# 1. Keep the System Updated

Debian/Ubuntu:

```bash
sudo apt update
sudo apt upgrade
```

RHEL-based systems:

```bash
sudo dnf upgrade
```

Install security updates regularly.

---

# 2. Use Strong Authentication

Use strong passwords where passwords are required.

Prefer SSH keys for administrative SSH access.

Check users:

```bash
cat /etc/passwd
```

Check login shells:

```bash
getent passwd
```

---

# 3. Protect SSH

Use:

```text
SSH keys
```

Consider disabling:

```text
Direct root login
Password authentication
```

only after verifying an alternative administrative login works.

Check SSH configuration:

```bash
sudo sshd -t
```

---

# 4. Follow Least Privilege

Users should receive only the permissions they need.

Avoid unnecessary:

```bash
sudo
```

Avoid:

```bash
chmod 777
```

Use specific permissions instead.

---

# 5. Protect Sensitive Files

Examples:

```bash
chmod 600 private-file
chmod 700 private-directory
```

Check:

```bash
ls -l
```

---

# 6. Remove Unnecessary Services

List services:

```bash
systemctl list-unit-files --type=service
```

Check running services:

```bash
systemctl --type=service --state=running
```

Stop an unnecessary service:

```bash
sudo systemctl stop SERVICE
```

Disable it when appropriate:

```bash
sudo systemctl disable SERVICE
```

---

# 7. Minimize Open Ports

Check listening ports:

```bash
sudo ss -tulpn
```

Ask:

```text
Do I need this port?
Do I need this service?
Who should access it?
```

---

# 8. Configure a Firewall

Use the firewall appropriate for your distribution.

Examples:

```bash
sudo ufw status
```

or:

```bash
sudo firewall-cmd --list-all
```

Allow only required services.

---

# 9. Use SELinux When Available

Check:

```bash
getenforce
```

Do not disable security controls without understanding why they are blocking an operation.

---

# 10. Monitor Logs

System logs:

```bash
journalctl
```

Follow logs:

```bash
journalctl -f
```

Service logs:

```bash
journalctl -u ssh
```

Authentication-related logs vary by distribution.

---

# 11. Check Failed Logins

```bash
last
```

On systems that provide it:

```bash
lastb
```

Access to failed-login information may require elevated privileges.

---

# 12. Check User Accounts

```bash
cat /etc/passwd
```

Check groups:

```bash
cat /etc/group
```

Check your identity:

```bash
id
```

---

# 13. Review Sudo Access

Check:

```bash
sudo -l
```

Sudo configuration:

```bash
sudo visudo
```

Use `visudo` when editing the main sudoers configuration.

---

# 14. Protect Secrets

Never store passwords or private keys in:

```text
Git repositories
Shell scripts
Public files
World-readable directories
```

Check file permissions:

```bash
ls -l ~/.ssh/
```

Private SSH keys should normally be readable only by their owner.

Example:

```bash
chmod 600 ~/.ssh/id_ed25519
```

---

# 15. Backup Important Data

Security also includes recovery.

Important files should be backed up.

Verify that backups can actually be restored.

A backup that cannot be restored is not a reliable backup.

---

# 16. Check for Suspicious Processes

List processes:

```bash
ps aux
```

Interactive view:

```bash
top
```

Check unusual processes and investigate their:

- User
- Command
- Parent process
- Network connections

---

# 17. Check File Ownership

Find files owned by a specific user:

```bash
find /path -user username
```

Find files with broad permissions:

```bash
find /path -type f -perm -002
```

Use carefully on large filesystems.

---

# 18. Security Checklist

Before considering a Linux system reasonably hardened:

```text
☐ System updated
☐ Unnecessary services removed
☐ Firewall configured
☐ Unnecessary ports closed
☐ SSH secured
☐ Root access restricted
☐ Strong authentication configured
☐ File permissions reviewed
☐ Sensitive files protected
☐ SELinux reviewed
☐ Logs monitored
☐ Backups tested
☐ User accounts reviewed
☐ Sudo access reviewed
```

---

# 🧪 Practical Security Audit

Run:

```bash
hostname
uname -a
```

Check users:

```bash
cat /etc/passwd
```

Check current user:

```bash
id
```

Check listening ports:

```bash
sudo ss -tulpn
```

Check services:

```bash
systemctl --type=service --state=running
```

Check firewall:

```bash
sudo ufw status
```

or:

```bash
sudo firewall-cmd --list-all
```

Check SELinux:

```bash
getenforce
```

Check SSH:

```bash
sudo sshd -t
```

Check logs:

```bash
journalctl -p warning -b
```

---

# 🎤 Interview Questions

1. What is Linux security?
2. What is least privilege?
3. Why should `chmod 777` be avoided?
4. How do you secure SSH?
5. How do you check listening ports?
6. What is a firewall?
7. What is SELinux?
8. What is the difference between DAC and MAC?
9. How do you check running services?
10. How do you check system logs?
11. How do you check user accounts?
12. How do you review sudo access?
13. Why are backups part of security?
14. How would you investigate a suspicious process?
15. How would you perform a basic Linux security audit?

---

# 📋 Final Section Checklist

- [ ] SSH Security
- [ ] File Permissions
- [ ] Firewall
- [ ] SELinux
- [ ] Security Best Practices
- [ ] User access
- [ ] Sudo access
- [ ] Services
- [ ] Open ports
- [ ] Logs
- [ ] Backups
- [ ] System updates
- [ ] Least privilege
- [ ] Basic security audit

---

# 🚀 Next Section

After completing `10-Security`, continue with:

```text
11-Advanced-Linux/
```

Possible topics:

```text
Kernel
System Performance
Logs
Monitoring
Troubleshooting
Advanced Networking
Storage Troubleshooting
System Tuning
```