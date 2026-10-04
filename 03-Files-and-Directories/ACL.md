# 🔐 Linux Access Control Lists (ACL)

## 📌 Overview

ACL stands for:

**Access Control List**

Traditional Linux permissions provide access control using:

```text
Owner
Group
Others
```

ACLs provide additional, more granular access rules for specific users and groups.

---

# 🎯 Learning Objectives

After completing this topic, I should understand:

- What ACL is
- Why ACL is useful
- Access ACL
- Default ACL
- `getfacl`
- `setfacl`
- ACL masks
- User ACL entries
- Group ACL entries
- ACL troubleshooting

---

# 1. Traditional Permissions

Example:

```text
-rw-r-----
```

This provides permissions for:

```text
Owner
Group
Others
```

But what if you need:

```text
Owner      → read/write
Group      → read
Alice      → read/write
Bob        → read
Others     → no access
```

ACLs can provide this type of additional access control.

---

# 2. Check ACL

Use:

```bash
getfacl file.txt
```

Example output can include:

```text
# file: file.txt
# owner: user
# group: developers
user::rw-
user:alice:rw-
group::r--
mask::rw-
other::---
```

---

# 3. Set User ACL

Give Alice read access:

```bash
setfacl -m u:alice:r file.txt
```

Give Alice read/write:

```bash
setfacl -m u:alice:rw file.txt
```

Check:

```bash
getfacl file.txt
```

---

# 4. Set Group ACL

Give a group read access:

```bash
setfacl -m g:developers:r file.txt
```

Read/write:

```bash
setfacl -m g:developers:rw file.txt
```

---

# 5. Remove ACL Entry

Remove Alice's ACL:

```bash
setfacl -x u:alice file.txt
```

Check:

```bash
getfacl file.txt
```

---

# 6. Remove All Extended ACL Entries

Use carefully:

```bash
setfacl -b file.txt
```

This removes extended ACL entries.

---

# 7. ACL Mask

The ACL mask limits the effective permissions for:

```text
Named users
Named groups
Owning group
```

Example:

```text
user:alice:rwx
mask::r--
```

Alice's effective permissions are limited by the mask.

Check:

```bash
getfacl file.txt
```

Look for:

```text
effective:
```

---

# 8. Default ACL

A default ACL can be applied to a directory so that new files and directories inherit ACL entries.

Example:

```bash
setfacl -d -m u:alice:rw directory/
```

Check:

```bash
getfacl directory/
```

---

# 9. Access ACL vs Default ACL

### Access ACL

Controls access to the existing file/directory.

```bash
setfacl -m u:alice:r file.txt
```

### Default ACL

Defines inherited ACL settings for new objects created inside a directory.

```bash
setfacl -d -m u:alice:r directory/
```

---

# 10. ACL and `ls -l`

When a file has an extended ACL, `ls -l` may show a:

```text
+
```

Example:

```text
-rw-rw-r--+
```

This indicates additional ACL information.

Use:

```bash
getfacl file.txt
```

to inspect it.

---

# 🧪 Hands-On Lab

## Step 1 — Create Lab

```bash
mkdir acl-lab
cd acl-lab
```

Create:

```bash
touch project.txt
```

Check:

```bash
ls -l project.txt
```

---

# Step 2 — Check ACL

```bash
getfacl project.txt
```

---

# Step 3 — Create Test User

Only perform this on your own lab machine/VM:

```bash
sudo useradd alice
```

Set a password if required by your lab:

```bash
sudo passwd alice
```

---

# Step 4 — Give Alice Access

```bash
setfacl -m u:alice:r project.txt
```

Check:

```bash
getfacl project.txt
```

---

# Step 5 — Give Read/Write

```bash
setfacl -m u:alice:rw project.txt
```

Check:

```bash
getfacl project.txt
```

---

# Step 6 — Remove Alice

```bash
setfacl -x u:alice project.txt
```

Check:

```bash
getfacl project.txt
```

---

# 🧪 Default ACL Lab

Create:

```bash
mkdir shared
```

Set default ACL:

```bash
setfacl -d -m u:alice:rw shared/
```

Check:

```bash
getfacl shared/
```

Create a new file:

```bash
touch shared/test.txt
```

Check:

```bash
getfacl shared/test.txt
```

Observe the inherited ACL.

---

# 🎯 ACL Challenge

Create:

```text
acl-project/
├── reports/
├── application/
└── shared/
```

Requirements:

```text
Owner:
Full access

Developers:
Read/write

Alice:
Read/write

Others:
No access
```

Configure the access using traditional permissions plus ACLs.

Verify everything with:

```bash
getfacl -R acl-project/
```

---

# 🚨 ACL Troubleshooting

If a user cannot access a file:

Check:

```bash
ls -l file.txt
```

Then:

```bash
getfacl file.txt
```

Check the user's identity:

```bash
id alice
```

Check the parent directories as well.

A user needs appropriate directory traversal permissions on every relevant directory in the path.

---

# ☁️ AWS / Cloud Connection

ACLs can be useful on Linux servers when multiple applications or users need different access levels.

Example:

```text
EC2 Server
│
├── application/
│
├── reports/
│
└── shared/
       │
       ├── Dev Team
       ├── Operations
       └── Specific Users
```

ACLs can provide more granular filesystem access without changing the basic owner/group model.

---

# ⚠️ Security Best Practice

Avoid using:

```bash
chmod 777
```

as a default solution.

Instead:

1. Identify the user.
2. Identify the group.
3. Check ownership.
4. Check permissions.
5. Check ACLs.
6. Grant the minimum required access.

This follows the principle of least privilege.

---

# 🧠 Interview Questions

1. What is ACL?
2. Why do we need ACL?
3. What is the difference between traditional permissions and ACL?
4. What does `getfacl` do?
5. What does `setfacl` do?
6. How do you give a user read access using ACL?
7. How do you remove an ACL entry?
8. What is a default ACL?
9. What is an ACL mask?
10. What does the `+` in `ls -l` mean?
11. How do you troubleshoot ACL access problems?
12. What is the principle of least privilege?

---

# 🎯 Real-World Scenario

### Scenario

A web application runs as:

```text
www-data
```

The development team needs:

```text
Read/write
```

Operations needs:

```text
Read
```

Other users should have:

```text
No access
```

Design an ACL-based solution.

Think about:

```text
Owner
Group
ACL
Permissions
Directory traversal
```

---

# ✅ Checklist

- [ ] Understand ACL
- [ ] Understand access ACL
- [ ] Understand default ACL
- [ ] Understand ACL mask
- [ ] Practice `getfacl`
- [ ] Practice `setfacl`
- [ ] Add user ACL
- [ ] Add group ACL
- [ ] Remove ACL
- [ ] Configure default ACL
- [ ] Complete ACL lab
- [ ] Complete ACL challenge
- [ ] Complete troubleshooting scenario
- [ ] Understand least privilege

---

## 🚀 Next Repository Section

After completing:

```text
03-Files-and-Directories/
```

Continue with:

```text
04-Users-and-Groups/
```

Next topics:

```text
Users
Groups
User Management
Sudo
Password Management
```