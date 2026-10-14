# 📘 File & Directory Commands

## 🎯 Objective

Learn how to create, copy, move, rename, inspect, and remove files and directories in Linux.

## 1. `mkdir` — Create Directories

```bash
mkdir project
mkdir dev test backup
mkdir -p project/app/logs
```

- `mkdir` creates directories.
- `-p` creates parent directories when needed.

## 2. `touch` — Create Files

```bash
touch file.txt
touch file1.txt file2.txt file3.txt
```

Creates empty files or updates timestamps on existing files.

## 3. `cp` — Copy Files and Directories

```bash
cp file.txt backup.txt
cp file.txt backup/
cp -r project project-backup
```

- `cp` copies files.
- `-r` copies directories recursively.

## 4. `mv` — Move or Rename

```bash
mv file.txt backup/
mv old.txt new.txt
mv old.txt backup/new.txt
```

Use `mv` to move files or rename them.

## 5. `rm` — Remove Files and Directories

```bash
rm file.txt
rm file1.txt file2.txt
rm -r directory
rm -rf directory
```

- `-r` removes directories recursively.
- `-f` forces removal without confirmation prompts.

⚠️ **Warning:** Verify the path before using `rm -r` or `rm -rf`. Deleted files may not be recoverable.

## 6. `file` — Identify File Type

```bash
file example.txt
```

Displays information about a file's detected type.

## 7. `stat` — File Information

```bash
stat file.txt
```

Displays file metadata, including:

- Size
- Permissions
- Owner and group
- Timestamps
- Inode number

## 8. `tree` — Display Directory Structure

```bash
tree
tree project/
```

Example:

```text
project/
├── app/
├── logs/
└── backup/
```

Install `tree` if it is unavailable on your system.

## 9. Wildcards

| Wildcard | Purpose | Example |
|---|---|---|
| `*` | Matches multiple characters | `ls *.txt` |
| `?` | Matches one character | `ls file?.txt` |
| `[]` | Matches selected characters | `ls file[123].txt` |

## 10. 🧪 Practical Lab

### Step 1: Create the directory structure

```bash
mkdir -p linux-files/{documents,logs,backups,scripts}
```

### Step 2: Create sample files

```bash
touch linux-files/documents/readme.txt
touch linux-files/logs/application.log
touch linux-files/scripts/test.sh
```

### Step 3: Copy a file

```bash
cp linux-files/documents/readme.txt linux-files/backups/
```

### Step 4: Rename a file

```bash
mv linux-files/scripts/test.sh linux-files/scripts/test-script.sh
```

### Step 5: Inspect files

```bash
file linux-files/documents/readme.txt
stat linux-files/documents/readme.txt
```

### Step 6: Display the structure

```bash
tree linux-files/
```

## 🎯 Challenge

Create this structure:

```text
cloud-lab/
├── aws/
│   ├── ec2/
│   ├── s3/
│   └── vpc/
├── azure/
└── backups/
```

**Tasks:**

1. Create the directory structure.
2. Create one test file in every directory.
3. Copy the AWS files into `backups/`.
4. Rename one file.
5. Move one file.
6. Display the complete structure using `tree`.
7. Delete only a designated test file.

Hint:

```bash
mkdir -p cloud-lab/{aws/{ec2,s3,vpc},azure,backups}
```

## ☁️ Cloud Engineering Connection

These commands are useful for managing application files on Linux servers, including AWS EC2 instances.

```text
/var/www/html/
├── index.html
├── css/
├── js/
└── images/
```

Common commands:

```bash
mkdir
cp
mv
rm
find
ls
stat
```

Use these commands to organize website files, deploy application updates, inspect permissions, and clean up temporary files.

## ✅ What I Learned

- Creating files and directories
- Copying, moving, and renaming files
- Removing files and directories safely
- Inspecting file types and metadata
- Using wildcards
- Building directory structures through hands-on practice

---

**Next Topic:** Text Processing Commands