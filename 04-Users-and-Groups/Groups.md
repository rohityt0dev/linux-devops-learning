# 👥 Groups.md

# Linux Groups

## 📌 Overview

Groups allow Linux administrators to organize users and manage access collectively.

Instead of assigning permissions individually to every user, users can be placed into groups.

```text
Users
  │
  ├── developer1
  ├── developer2
  └── developer3
          │
          ▼
     developers
          │
          ▼
     Shared Access
```

---

# 🎯 Learning Objectives

- Understand groups
- Primary groups
- Secondary groups
- `/etc/group`
- `/etc/gshadow`
- `groupadd`
- `groupmod`
- `groupdel`
- `usermod`
- `gpasswd`
- Group troubleshooting

---

# 1. View Current Groups

```bash
groups
```

Detailed:

```bash
id
```

---

# 2. `/etc/group`

View groups:

```bash
cat /etc/group
```

A typical entry:

```text
developers:x:1002:alice,bob
```

Fields:

```text
Group name
Password placeholder
GID
Group members
```

---

# 3. Create Group

```bash
sudo groupadd developers
```

Verify:

```bash
getent group developers
```

---

# 4. Add User to Group

```bash
sudo usermod -aG developers alice
```

⚠️ The `-a` option is important when adding a supplementary group. Without it, `usermod -G` can replace the user's existing supplementary groups.

---

# 5. Verify

```bash
id alice
```

or:

```bash
groups alice
```

---

# 6. Primary Group

A user has a primary group.

Check:

```bash
id alice
```

Example:

```text
uid=1001(alice) gid=1001(alice)
```

---

# 7. Change Primary Group

```bash
sudo usermod -g developers alice
```

Verify:

```bash
id alice
```

---

# 8. Add Multiple Supplementary Groups

```bash
sudo usermod -aG developers,operations alice
```

---

# 9. Remove User from Group

On systems with appropriate tooling:

```bash
sudo gpasswd -d alice developers
```

Verify:

```bash
id alice
```

---

# 10. Rename Group

```bash
sudo groupmod -n dev-team developers
```

---

# 11. Delete Group

```bash
sudo groupdel developers
```

⚠️ Make sure the group is not required as a user's primary group before deleting it.

---

# 🧪 Group Lab

Create:

```bash
sudo groupadd developers
sudo groupadd operations
sudo groupadd cloud
```

Create users:

```bash
sudo useradd -m developer1
sudo useradd -m developer2
sudo useradd -m operator1
```

Add groups:

```bash
sudo usermod -aG developers developer1
sudo usermod -aG developers developer2
sudo usermod -aG operations operator1
```

Check:

```bash
id developer1
id developer2
id operator1
```

---

# 🎯 Group Challenge

Design:

```text
developers
    ├── developer1
    └── developer2

operations
    └── operator1

cloud
    ├── developer1
    └── operator1
```

Implement the group structure.

Verify using:

```bash
id developer1
id developer2
id operator1
```

---

# ☁️ AWS Connection

Groups are useful for managing shared access on EC2 servers.

Example:

```text
developers
    │
    ├── developer1
    ├── developer2
    └── developer3
```

A shared project directory can then use group ownership:

```text
/opt/application
```

This combines with the permissions concepts learned in:

```text
03-Files-and-Directories/
```

---

# 🧠 Interview Questions

1. What is a Linux group?
2. What is a primary group?
3. What is a secondary group?
4. What is `/etc/group`?
5. What does `groupadd` do?
6. What does `groupmod` do?
7. What does `groupdel` do?
8. What does `usermod -aG` do?
9. Why is `-a` important?
10. How do you check group membership?

---

# ✅ Checklist

- [ ] Understand groups
- [ ] Understand primary group
- [ ] Understand supplementary groups
- [ ] Understand `/etc/group`
- [ ] Create groups
- [ ] Modify groups
- [ ] Delete groups
- [ ] Add users to groups
- [ ] Remove users from groups
- [ ] Change primary group
- [ ] Complete group lab
- [ ] Complete group challenge


---
