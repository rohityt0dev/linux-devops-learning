🔑 SSH Security

📌 Overview

SSH provides secure remote access to Linux systems.

Default SSH port:

22

Check SSH service:

systemctl status ssh

On some distributions:

systemctl status sshd

🔍 Check SSH Configuration

Main configuration file:

/etc/ssh/sshd_config

View configuration:

sudo cat /etc/ssh/sshd_config

Edit:

sudo vim /etc/ssh/sshd_config

After changes, validate:

sudo sshd -t

Restart SSH:

sudo systemctl restart ssh

🔐 SSH Key Authentication

Generate a key:

ssh-keygen

Common files:

~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub

Copy public key:

ssh-copy-id user@server

Connect:

ssh user@server

🔒 Basic SSH Hardening

Important settings:

PermitRootLogin no
PasswordAuthentication no

Only disable password authentication after confirming key-based login works.

After modifying SSH configuration:

sudo sshd -t

Then:

sudo systemctl restart ssh

🔍 Check SSH Connections

ss -tnp | grep :22

View login history:

last

View failed login attempts:

sudo journalctl -u ssh

🧪 Lab

Create an SSH key.

Configure key-based authentication.

Test login.

Check SSH logs.

Test configuration using sshd -t.

🎤 Interview Questions

What is SSH?

What port does SSH use?

What is SSH key authentication?

Where is SSH server configuration stored?

Difference between private and public keys?

Why should root SSH login generally be disabled?

How do you validate SSH configuration?

How do you troubleshoot SSH login problems?

✅ Checklist

Understand SSH

Generate SSH keys

Use key authentication

Understand sshd_config

Validate SSH configuration

Check SSH logs

Understand SSH hardening