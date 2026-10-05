🔐 Linux Security Best Practices

📌 Overview

Linux security is not a single configuration. It is a combination of:

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

1. Keep the System Updated

Debian/Ubuntu:

sudo apt update
sudo apt upgrade

RHEL-based systems:

sudo dnf upgrade

Install security updates regularly.

2. Use Strong Authentication

Use strong passwords where passwords are required.

Prefer SSH keys for administrative SSH access.

Check users:

cat /etc/passwd

Check login shells:

getent passwd

3. Protect SSH

Use:

SSH keys

Consider disabling:

Direct root login
Password authentication

only after verifying an alternative administrative login works.

Check SSH configuration:

sudo sshd -t

4. Follow Least Privilege

Users should receive only the permissions they need.

Avoid unnecessary:

sudo

Avoid:

chmod 777

Use specific permissions instead.

5. Protect Sensitive Files

Examples:

chmod 600 private-file
chmod 700 private-directory

Check:

ls -l

6. Remove Unnecessary Services

List services:

systemctl list-unit-files --type=service

Check running services:

systemctl --type=service --state=running

Stop an unnecessary service:

sudo systemctl stop SERVICE

Disable it when appropriate:

sudo systemctl disable SERVICE

7. Minimize Open Ports

Check listening ports:

sudo ss -tulpn

Ask:

Do I need this port?
Do I need this service?
Who should access it?

8. Configure a Firewall

Use the firewall appropriate for your distribution.

Examples:

sudo ufw status

or:

sudo firewall-cmd --list-all

Allow only required services.

9. Use SELinux When Available

Check:

getenforce

Do not disable security controls without understanding why they are blocking an operation.

10. Monitor Logs

System logs:

journalctl

Follow logs:

journalctl -f

Service logs:

journalctl -u ssh

Authentication-related logs vary by distribution.

11. Check Failed Logins

last

On systems that provide it:

lastb

Access to failed-login information may require elevated privileges.

12. Check User Accounts

cat /etc/passwd

Check groups:

cat /etc/group

Check your identity:

id

13. Review Sudo Access

Check:

sudo -l

Sudo configuration:

sudo visudo

Use visudo when editing the main sudoers configuration.

14. Protect Secrets

Never store passwords or private keys in:

Git repositories
Shell scripts
Public files
World-readable directories

Check file permissions:

ls -l ~/.ssh/

Private SSH keys should normally be readable only by their owner.

Example:

chmod 600 ~/.ssh/id_ed25519

15. Backup Important Data

Security also includes recovery.

Important files should be backed up.

Verify that backups can actually be restored.

A backup that cannot be restored is not a reliable backup.

16. Check for Suspicious Processes

List processes:

ps aux

Interactive view:

top

Check unusual processes and investigate their:

User

Command

Parent process

Network connections

17. Check File Ownership

Find files owned by a specific user:

find /path -user username

Find files with broad permissions:

find /path -type f -perm -002

Use carefully on large filesystems.

18. Security Checklist

Before considering a Linux system reasonably hardened:

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

🧪 Practical Security Audit

Run:

hostname
uname -a

Check users:

cat /etc/passwd

Check current user:

id

Check listening ports:

sudo ss -tulpn

Check services:

systemctl --type=service --state=running

Check firewall:

sudo ufw status

or:

sudo firewall-cmd --list-all

Check SELinux:

getenforce

Check SSH:

sudo sshd -t

Check logs:

journalctl -p warning -b

🎤 Interview Questions

What is Linux security?

What is least privilege?

Why should chmod 777 be avoided?

How do you secure SSH?

How do you check listening ports?

What is a firewall?

What is SELinux?

What is the difference between DAC and MAC?

How do you check running services?

How do you check system logs?

How do you check user accounts?

How do you review sudo access?

Why are backups part of security?

How would you investigate a suspicious process?

How would you perform a basic Linux security audit?

📋 Final Section Checklist

SSH Security

File Permissions

Firewall

SELinux

Security Best Practices

User access

Sudo access

Services

Open ports

Logs

Backups

System updates

Least privilege

Basic security audit

🚀 Next Section