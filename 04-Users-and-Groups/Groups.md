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

# 6. Remove User from Group

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