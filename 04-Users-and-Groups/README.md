# 📁 04-Users-and-Groups

## 📌 Overview

Linux is a multi-user operating system.

Multiple users can access the same Linux system, and each user can have different:

- Identity
- UID
- Home directory
- Group membership
- Permissions
- Shell
- Password
- Administrative privileges

This section focuses on Linux user and group administration.

---

# 🎯 Learning Objectives

By completing this section, I should understand:

- Linux users
- User accounts
- UID
- GID
- `/etc/passwd`
- `/etc/shadow`
- `/etc/group`
- `/etc/gshadow`
- Primary groups
- Secondary groups
- Creating users
- Modifying users
- Deleting users
- Creating groups
- Managing group membership
- `sudo`
- Password management
- Account locking
- Account expiration
- Basic user troubleshooting

---

# 📚 Topics

| # | Topic | File |
|---|---|---|
| 01 | Users | [Users.md](./Users.md) |
| 02 | Groups | [Groups.md](./Groups.md) |
| 03 | User Management | [User-Management.md](./User-Management.md) |
| 04 | Sudo | [Sudo.md](./Sudo.md) |
| 05 | Password Management | [Password-Management.md](./Password-Management.md) |

---

# 🧭 Learning Path

```text
Users
  │
  ▼
Groups
  │
  ▼
User Management
  │
  ▼
Sudo
  │
  ▼
Password Management
  │
  ▼
Hands-On User Administration
```

---

# 🧪 Full-Day Lab

Create a safe lab environment using a Linux VM or test EC2 instance.

Do not experiment with user deletion, password changes, or sudo configuration on a production server.

---

## Exercise 1 — Current User

```bash
whoami
id
```

---

## Exercise 2 — User Information

```bash
getent passwd
```

---

## Exercise 3 — Current Groups

```bash
groups
```

or:

```bash
id
```

---

## Exercise 4 — Inspect User Database

```bash
cat /etc/passwd
```

---

## Exercise 5 — Inspect Groups

```bash
cat /etc/group
```

---

## Exercise 6 — Create Lab User

```bash
sudo useradd labuser
```

Set password:

```bash
sudo passwd labuser
```

Check:

```bash
id labuser
```

---

## Exercise 7 — Create Lab Group

```bash
sudo groupadd cloudteam
```

Add user:

```bash
sudo usermod -aG cloudteam labuser
```

Check:

```bash
id labuser
```

---

## Exercise 8 — Sudo

Check whether your current user can use sudo:

```bash
sudo -v
```

Check sudo permissions:

```bash
sudo -l
```

---

## Exercise 9 — Password Status

```bash
sudo passwd -S labuser
```

---

## Exercise 10 — Account Information

```bash
sudo chage -l labuser
```

---

# 🎯 Mini Project

## Linux User Administration Lab

Create:

```text
user-management-lab/
├── users/
├── groups/
├── reports/
└── notes/
```

Create:

```text
Users:
developer1
developer2
operator1

Groups:
developers
operations
```

Requirements:

```text
developer1 → developers
developer2 → developers
operator1  → operations
```

Record:

```text
Username
UID
Primary GID
Groups
Home Directory
Shell
```

Generate a report:

```bash
getent passwd > reports/users.txt
getent group > reports/groups.txt
```

---

# ☁️ AWS Connection

Linux users are important when administering EC2 instances.

For example:

```text
AWS EC2
   │
   └── Linux
       │
       ├── ec2-user
       ├── ubuntu
       ├── application user
       └── monitoring user
```

Different distributions may use different default login usernames.

---

# 🧠 Interview Questions

1. What is a Linux user?
2. What is UID?
3. What is GID?
4. What is `/etc/passwd`?
5. What is `/etc/shadow`?
6. What is `/etc/group`?
7. What is a primary group?
8. What is a secondary group?
9. How do you create a user?
10. How do you delete a user?
11. How do you check user information?
12. How do you check group membership?
13. What is sudo?
14. How do you check password status?
15. How do you troubleshoot a user access problem?

---

# ✅ Section Checklist

- [ ] Understand Linux users
- [ ] Understand UID
- [ ] Understand GID
- [ ] Understand `/etc/passwd`
- [ ] Understand `/etc/shadow`
- [ ] Understand `/etc/group`
- [ ] Understand groups
- [ ] Create users
- [ ] Create groups
- [ ] Add users to groups
- [ ] Remove users from groups
- [ ] Understand sudo
- [ ] Manage passwords
- [ ] Complete user administration lab
- [ ] Practice AWS EC2 user management
- [ ] Complete interview questions

---

## 🚀 Next

➡️ [Users](./Users.md)

---