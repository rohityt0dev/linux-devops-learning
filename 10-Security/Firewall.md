🧱 Linux Firewall

📌 Overview

A firewall controls network traffic entering or leaving a system.

Common Linux firewall tools:

UFW
firewalld
nftables
iptables

The exact tool depends on the Linux distribution.

🔥 UFW

Check status:

sudo ufw status

Enable:

sudo ufw enable

Allow SSH:

sudo ufw allow 22/tcp

Allow HTTP:

sudo ufw allow 80/tcp

Allow HTTPS:

sudo ufw allow 443/tcp

Deny a port:

sudo ufw deny 23/tcp

Delete a rule:

sudo ufw delete allow 80/tcp

🔥 firewalld

Check status:

sudo firewall-cmd --state

List active rules:

sudo firewall-cmd --list-all

Allow SSH:

sudo firewall-cmd --permanent --add-service=ssh

Allow HTTP:

sudo firewall-cmd --permanent --add-service=http

Reload:

sudo firewall-cmd --reload

Remove service:

sudo firewall-cmd --permanent --remove-service=http

🔍 Check Listening Ports

ss -tuln

With process information:

sudo ss -tulpn

🔐 Firewall Principle

Allow only required traffic.

Required
   ↓
Allow

Not required
   ↓
Block

🧪 Lab

Check firewall status.

Allow SSH.

Allow HTTP.

List rules.

Remove HTTP.

Verify the final configuration.

🎤 Interview Questions

What is a firewall?

What is UFW?

What is firewalld?

What is the difference between firewall and application?

How do you check listening ports?

How do you allow SSH?

Why should unnecessary ports be closed?

✅ Checklist

Understand firewall purpose

Use UFW

Use firewalld

Allow ports

Remove rules

Check listening ports

Apply least-access principles