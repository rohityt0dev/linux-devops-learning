📘 File-Directory-Commands.md
File & Directory Commands
🎯 Objective

Learn how to create, copy, move, rename, inspect, and remove files and directories.

1. mkdir

Create directory:

mkdir project

Multiple directories:

mkdir dev test backup

Create nested directories:

mkdir -p project/app/logs
2. touch

Create an empty file:

touch file.txt

Multiple files:

touch file1.txt file2.txt file3.txt
3. cp

Copy file:

cp file.txt backup.txt

Copy into directory:

cp file.txt backup/

Copy directory recursively:

cp -r project project-backup
4. mv

Move file:

mv file.txt backup/

Rename:

mv old.txt new.txt

Move and rename:

mv old.txt backup/new.txt
5. rm

Remove file:

rm file.txt

Remove multiple files:

rm file1.txt file2.txt

Remove directory recursively:

rm -r directory

Force removal:

rm -rf directory

⚠️ Always verify the path before using destructive commands.

6. file

Identify file type:

file example.txt
7. stat

Show detailed file information:

stat file.txt

Information includes:

Size
Permissions
Owner
Timestamps
Inode
8. tree

If installed:

tree

Example:

project/
├── app/
├── logs/
└── backup/
9. Wildcards
*

Matches multiple characters.

ls *.txt
?

Matches one character.

ls file?.txt
[]

Matches selected characters.

ls file[123].txt
10. Practical Lab

Create:

linux-files/
├── documents/
├── logs/
├── backups/
└── scripts/

Commands:

mkdir -p linux-files/{documents,logs,backups,scripts}

Create files:

touch linux-files/documents/readme.txt
touch linux-files/logs/application.log
touch linux-files/scripts/test.sh

Copy:

cp linux-files/documents/readme.txt linux-files/backups/

Rename:

mv linux-files/scripts/test.sh linux-files/scripts/test-script.sh

Inspect:

file linux-files/documents/readme.txt
stat linux-files/documents/readme.txt
🎯 Challenge

Create:

cloud-lab/
├── aws/
│   ├── ec2/
│   ├── s3/
│   └── vpc/
├── azure/
└── backups/

Then:

Create one file in every directory.
Copy the AWS files into backups.
Rename one file.
Move one file.
Display the entire structure.
Delete only a test file.
☁️ AWS Connection

These commands are used when managing application files on EC2:

mkdir
cp
mv
rm
find
ls
stat

Example:

EC2
└── /var/www/html
    ├── index.html
    ├── css/
    ├── js/
    └── images/

---