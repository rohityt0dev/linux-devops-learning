# Archive & Compression

## 🎯 Objective

Learn how to create archives, compress files, extract backups, and manage files efficiently in Linux.

### 📌 Why It Is Important

- Backups and recovery
- Log collection
- Application deployment
- File transfer
- Cloud administration

## 1. TAR

Create an archive:

```bash
tar -cvf backup.tar files/
```

Extract an archive:

```bash
tar -xvf backup.tar
```

List archive contents:

```bash
tar -tvf backup.tar
```

## 2. TAR.GZ

Create a compressed archive:

```bash
tar -czvf backup.tar.gz files/
```

Extract a compressed archive:

```bash
tar -xzvf backup.tar.gz
```

List contents:

```bash
tar -tzvf backup.tar.gz
```

## 3. GZIP

Compress a file:

```bash
gzip file.txt
```

Decompress a file:

```bash
gunzip file.txt.gz
```

## 4. ZIP

Create a ZIP archive:

```bash
zip backup.zip file1.txt file2.txt
```

Compress a directory:

```bash
zip -r backup.zip directory/
```

## 5. UNZIP

Extract a ZIP archive:

```bash
unzip backup.zip
```

List contents:

```bash
unzip -l backup.zip
```

## 🧪 Hands-On Lab

Create sample files:

```bash
mkdir archive-lab
touch archive-lab/file1.txt archive-lab/file2.txt archive-lab/file3.txt
```

Create TAR and TAR.GZ archives:

```bash
tar -cvf archive.tar archive-lab/
tar -czvf archive.tar.gz archive-lab/
```

Verify the compressed archive:

```bash
tar -tzf archive.tar.gz
```

Extract the archive:

```bash
mkdir extracted
tar -xzvf archive.tar.gz -C extracted/
```

Create and extract a ZIP archive:

```bash
zip -r archive.zip archive-lab/
unzip archive.zip
```

## ☁️ Linux Backup Example

Create a backup of website files:

```bash
sudo tar -czvf application-backup.tar.gz -C /var/www html
```

Verify the backup:

```bash
tar -tzf application-backup.tar.gz
```

> **Note:** Store backups in a safe location and test extraction regularly. This command creates a local archive; it does not upload the backup to cloud storage.

## 📚 Quick Reference

| Command | Purpose |
|---|---|
| `tar -cvf` | Create TAR archive |
| `tar -xvf` | Extract TAR archive |
| `tar -czvf` | Create compressed TAR archive |
| `tar -tzf` | List TAR.GZ contents |
| `gzip` | Compress a file |
| `gunzip` | Decompress a file |
| `zip -r` | Compress a directory |
| `unzip` | Extract ZIP archive |

## ✅ What I Learned

- Creating and extracting TAR archives
- Compressing files with GZIP
- Creating and extracting ZIP archives
- Verifying archive contents
- Performing basic Linux backups

---

**Next Topic:** Linux File Searching Commands