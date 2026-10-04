# 🔗 Linux Links

## 📌 Overview

Linux supports different types of links.

The two important types are:

```text
Hard Link
Symbolic Link
```

Understanding links is useful for:

- File management
- Configuration
- Applications
- System administration
- Backups
- Log management

---

# 🎯 Learning Objectives

After completing this topic, I should understand:

- Inodes
- Hard links
- Symbolic links
- `ln`
- `ln -s`
- Link counts
- Relative symbolic links
- Absolute symbolic links
- Broken symbolic links

---

# 1. What is an Inode?

An inode stores filesystem metadata about a file.

It can include information such as:

```text
File type
Permissions
Owner
Group
Size
Timestamps
Link count
Pointers to file data
```

Check inode:

```bash
ls -li file.txt
```

---

# 2. Hard Link

A hard link is another directory entry pointing to the same underlying inode.

Create:

```bash
touch original.txt
ln original.txt hardlink.txt
```

Check:

```bash
ls -li original.txt hardlink.txt
```

The inode numbers should match on a filesystem that supports normal hard links.

---

# 3. Hard Link Behavior

Write data:

```bash
echo "Hello Linux" > original.txt
```

Read through hard link:

```bash
cat hardlink.txt
```

You should see:

```text
Hello Linux
```

Remove original:

```bash
rm original.txt
```

The hard link still refers to the same underlying file data.

```bash
cat hardlink.txt
```

---

# 4. Symbolic Link

A symbolic link stores a pathname referring to another file or directory.

Create:

```bash
touch original.txt
ln -s original.txt symlink.txt
```

Check:

```bash
ls -l symlink.txt
```

Example:

```text
symlink.txt -> original.txt
```

---

# 5. Symbolic Link Inode

Check:

```bash
ls -li original.txt symlink.txt
```

Unlike a hard link, the symbolic link normally has its own inode.

---

# 6. Hard Link vs Symbolic Link

| Feature | Hard Link | Symbolic Link |
|---|---|---|
| Points to | Inode | Pathname |
| Separate inode | No | Yes |
| Can cross filesystems | No | Yes |
| Can link directories normally | Generally no | Yes |
| Can become broken | No, as long as a link remains | Yes |
| Common command | `ln` | `ln -s` |

---

# 7. Symbolic Link to Directory

Create:

```bash
mkdir application
ln -s application current
```

Check:

```bash
ls -l
```

---

# 8. Broken Symbolic Link

Create:

```bash
touch test.txt
ln -s test.txt test-link.txt
```

Remove target:

```bash
rm test.txt
```

Now:

```bash
ls -l test-link.txt
```

The link is broken because its target no longer exists.

---

# 9. Absolute vs Relative Symbolic Links

Absolute:

```bash
ln -s /home/user/application current
```

Relative:

```bash
ln -s ../application current
```

Relative links can be useful when a directory tree needs to remain portable.

---

# 🧪 Hands-On Lab

Create:

```bash
mkdir links-lab
cd links-lab
```

Create file:

```bash
echo "Linux Links Lab" > original.txt
```

Create hard link:

```bash
ln original.txt hardlink.txt
```

Create symbolic link:

```bash
ln -s original.txt symlink.txt
```

Check:

```bash
ls -li
```

---

# 🧪 Link Test

Run:

```bash
cat original.txt
cat hardlink.txt
cat symlink.txt
```

Modify:

```bash
echo "Second line" >> original.txt
```

Check:

```bash
cat hardlink.txt
cat symlink.txt
```

---

# 🎯 Link Challenge

Create:

```text
link-project/
├── releases/
│   ├── v1/
│   └── v2/
└── current
```

Make:

```text
current -> releases/v2
```

Verify:

```bash
ls -l current
```

Then switch:

```text
current -> releases/v1
```

This is a useful pattern for application deployments.

---

# ☁️ AWS / DevOps Connection

Symbolic links are commonly useful in application deployment patterns.

Example:

```text
/var/www/application/
│
├── releases/
│   ├── v1/
│   ├── v2/
│   └── v3/
│
└── current -> releases/v3
```

A deployment can switch:

```text
current -> v2
```

to:

```text
current -> v3
```

without moving the entire application directory.

---

# 🧠 Interview Questions

1. What is an inode?
2. What is a hard link?
3. What is a symbolic link?
4. How do you create a hard link?
5. How do you create a symbolic link?
6. What is the difference between hard and symbolic links?
7. Can a hard link cross filesystems?
8. Can a symbolic link point to a directory?
9. What is a broken symbolic link?
10. How can symbolic links be used during application deployment?

---

# ✅ Checklist

- [ ] Understand inode
- [ ] Understand hard links
- [ ] Understand symbolic links
- [ ] Practice `ln`
- [ ] Practice `ln -s`
- [ ] Compare inode numbers
- [ ] Create broken symlink
- [ ] Practice directory symlinks
- [ ] Understand relative symlinks
- [ ] Understand absolute symlinks
- [ ] Complete link project
- [ ] Understand deployment use case

---

## Next

➡️ [ACL](./ACL.md)