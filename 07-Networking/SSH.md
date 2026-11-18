# 🔐 Linux SSH

SSH stands for:

> **Secure Shell**

SSH provides encrypted remote access to Linux systems.

It is one of the most important technologies for Linux administrators and AWS Cloud Engineers.

---

# 🎯 Learning Objectives

You will learn:

- SSH basics
- SSH client
- SSH server
- Port 22
- Username/password authentication
- SSH keys
- Public/private keys
- `ssh-keygen`
- `authorized_keys`
- SSH configuration
- File permissions
- `scp`
- SSH troubleshooting
- AWS EC2 SSH

---

# 🧠 SSH Architecture

```text
SSH Client
    │
Encrypted Connection
    │
    ▼
TCP Port 22
    │
    ▼
SSH Server
    │
    ▼
Linux Server
```

---

# 🔌 SSH Port

Default SSH port:

```text
22/TCP
```

Check:

```bash
sudo ss -tlnp | grep :22
```

---

# 🔍 SSH Service

Ubuntu/Debian commonly:

```bash
sudo systemctl status ssh
```

RHEL-family systems commonly:

```bash
sudo systemctl status sshd
```

Start where appropriate:

```bash
sudo systemctl start sshd
```

Enable:

```bash
sudo systemctl enable sshd
```

---

# 🖥️ Connect to Server

Syntax:

```bash
ssh username@server-ip
```

Example:

```bash
ssh user@192.168.1.20
```

---

# 🔑 SSH Keys

SSH commonly uses asymmetric cryptography.

There are two key components:

```text
Private Key
Public Key
```

Concept:

```text
Client
Private Key
    │
    ▼
Authentication
    │
    ▼
Server
Authorized Public Key
```

Never share your private key.

---

# 🔨 Generate SSH Key

Modern example:

```bash
ssh-keygen -t ed25519
```

RSA example:

```bash
ssh-keygen -t rsa -b 4096
```

Common files:

```text
~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub
```

Private:

```text
id_ed25519
```

Public:

```text
id_ed25519.pub
```

---

# 📤 Copy Public Key

Where supported:

```bash
ssh-copy-id user@server-ip
```

The public key is normally added to:

```text
~/.ssh/authorized_keys
```

---

# 📂 SSH Permissions

Typical permissions:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

For a downloaded private key:

```bash
chmod 400 key.pem
```

SSH may reject private keys that are accessible to other users.

---

# ⚙️ SSH Server Configuration

Main server configuration:

```text
/etc/ssh/sshd_config
```

View:

```bash
sudo less /etc/ssh/sshd_config
```

Important settings can include:

```text
Port
PermitRootLogin
PasswordAuthentication
PubkeyAuthentication
```

After changing configuration, validate it where supported:

```bash
sudo sshd -t
```

Then restart/reload carefully.

For example:

```bash
sudo systemctl reload sshd
```

Keep an existing SSH session open when changing remote SSH configuration so you have a recovery path if the new configuration is incorrect.

---

# 🔐 SSH Security Practices

Recommended practices include:

- Use SSH keys
- Protect private keys
- Restrict Security Group source IPs
- Avoid exposing SSH to the entire internet when unnecessary
- Disable direct root login when appropriate
- Keep OpenSSH updated
- Use least privilege
- Monitor authentication logs
- Use bastion hosts or AWS Systems Manager where appropriate

---

# 📤 SCP

`scp` copies files over SSH.

Local → remote:

```bash
scp file.txt user@server:/tmp/
```

Remote → local:

```bash
scp user@server:/tmp/file.txt .
```

With private key:

```bash
scp -i key.pem file.txt user@server:/tmp/
```

---

# ☁️ AWS EC2 SSH

Ubuntu:

```bash
ssh -i my-key.pem ubuntu@PUBLIC-IP
```

Amazon Linux:

```bash
ssh -i my-key.pem ec2-user@PUBLIC-IP
```

The correct username depends on the AMI.

---

# 🧪 AWS SSH Lab

## Step 1

Launch an EC2 Linux instance.

## Step 2

Configure Security Group:

```text
SSH
TCP
22
Source: Your IP
```

Using your own IP is safer than allowing SSH from everywhere.

## Step 3

Set key permissions:

```bash
chmod 400 my-key.pem
```

## Step 4

Connect:

```bash
ssh -i my-key.pem ec2-user@PUBLIC-IP
```

or:

```bash
ssh -i my-key.pem ubuntu@PUBLIC-IP
```

## Step 5

Check SSH:

```bash
sudo ss -tlnp | grep :22
```

---

# 🚨 SSH Troubleshooting

If SSH fails, troubleshoot layer by layer.

---

## 1. Is EC2 running?

Check the instance state.

---

## 2. Correct IP?

Verify:

```text
Public IPv4
Elastic IP
Private IP
```

---

## 3. Security Group

Check inbound:

```text
TCP 22
Source = your IP
```

---

## 4. Route Table

For direct internet SSH access, the public subnet typically needs:

```text
0.0.0.0/0
        ↓
Internet Gateway
```

---

## 5. Public IP

The instance needs a reachable public IPv4/EIP for direct internet access.

---

## 6. Network ACL

Check inbound and outbound rules.

Remember NACLs are stateless.

---

## 7. SSH Service

From console/SSM access:

```bash
sudo systemctl status sshd
```

or:

```bash
sudo systemctl status ssh
```

---

## 8. Port Listening

```bash
sudo ss -tlnp | grep :22
```

---

## 9. Linux Firewall

Depending on the system:

```bash
sudo firewall-cmd --list-all
```

or:

```bash
sudo ufw status
```

---

## 10. Correct Username

Examples:

```text
Amazon Linux → ec2-user

Ubuntu → ubuntu
```

---

## 11. Private Key

Check:

```bash
chmod 400 key.pem
```

Make sure you are using the private key corresponding to the public key configured for the instance/user.

---

# 🧠 AWS SSH Troubleshooting Flow

```text
Can I reach EC2?
       ↓
Correct Public IP?
       ↓
Security Group :22?
       ↓
Route to IGW?
       ↓
NACL allows traffic?
       ↓
Linux firewall?
       ↓
sshd running?
       ↓
Port 22 listening?
       ↓
Correct username?
       ↓
Correct private key?
```
---

```

Note:

> A NAT Gateway is **not required for inbound SSH to a public EC2 instance**. NAT Gateway is primarily used to provide outbound internet connectivity for resources in private subnets.

---
