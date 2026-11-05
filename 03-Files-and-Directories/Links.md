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