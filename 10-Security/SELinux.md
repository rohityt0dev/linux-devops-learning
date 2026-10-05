🛡️ SELinux

📌 Overview

SELinux stands for:

Security-Enhanced Linux

SELinux provides an additional security layer using Mandatory Access Control (MAC).

Traditional Linux permissions use:

Owner
Group
Others

SELinux adds security policies on top of these permissions.

🔍 Check SELinux Status

getenforce

Possible results:

Enforcing
Permissive
Disabled

Detailed status:

sestatus

🔐 SELinux Modes

Enforcing

SELinux policy is enforced.

Enforcing

Permissive

Policy violations are logged but not blocked.

Permissive

Disabled

SELinux is disabled.

Disabled

🔧 Change Mode Temporarily

Set permissive:

sudo setenforce 0

Set enforcing:

sudo setenforce 1

Check:

getenforce

These changes are generally temporary and may not persist after reboot.

🔍 SELinux Context

View contexts:

ls -Z

Example:

-rw-r--r-- user user system_u:object_r:...

The SELinux context provides additional security information.

🔎 Search SELinux Denials

On systems using the SELinux audit logs:

sudo ausearch -m AVC -ts recent

You can also inspect audit logs:

sudo journalctl

🧪 Lab

Check:

getenforce
sestatus

Then:

ls -Z

If SELinux is enabled, inspect recent AVC denials:

sudo ausearch -m AVC -ts recent

⚠️ Important

Do not disable SELinux simply because an application is having problems.

First investigate:

Application
    ↓
Permissions
    ↓
SELinux context
    ↓
SELinux policy
    ↓
Audit logs

🎤 Interview Questions

What is SELinux?

What does MAC mean?

What are SELinux modes?

Difference between enforcing and permissive?

How do you check SELinux status?

What does getenforce do?

What does sestatus do?

What does ls -Z show?

What is an AVC denial?

Why should SELinux not be disabled immediately?

✅ Checklist

Understand SELinux

Understand MAC

Know three SELinux modes

Use getenforce

Use sestatus

Understand SELinux contexts

Check AVC denials