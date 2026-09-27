📦 Archive-Compression.md
Archive & Compression
🎯 Objective

Learn how to create archives, compress files, and extract backups.

These skills are important for:

Backups
Log collection
Application deployment
File transfer
Cloud administration
1. tar

Create archive:

tar -cvf backup.tar files/

Options:

-c = create
-v = verbose
-f = file

Extract:

tar -xvf backup.tar

List contents:

tar -tvf backup.tar
2. tar.gz

Create compressed archive:

tar -czvf backup.tar.gz files/

Extract:

tar -xzvf backup.tar.gz

Options:

-c = create
-x = extract
-z = gzip
-v = verbose
-f = file
3. gzip

Compress:

gzip file.txt

Result:

file.txt.gz

Decompress:

gunzip file.txt.gz
4. zip

Create ZIP:

zip backup.zip file1.txt file2.txt

Directory:

zip -r backup.zip directory/
5. unzip

Extract:

unzip backup.zip

List contents:

unzip -l backup.zip
🧪 Archive Lab

Create:

mkdir archive-lab
touch archive-lab/file1.txt
touch archive-lab/file2.txt
touch archive-lab/file3.txt

Create TAR:

tar -cvf archive.tar archive-lab/

Create TAR.GZ:

tar -czvf archive.tar.gz archive-lab/

List:

tar -tvf archive.tar.gz

Extract:

mkdir extracted
tar -xzvf archive.tar.gz -C extracted/

Create ZIP:

zip -r archive.zip archive-lab/

Extract:

unzip archive.zip
☁️ AWS Backup Example

A simple application backup:

tar -czvf application-backup.tar.gz /var/www/html/

Verify:

tar -tzf application-backup.tar.gz

This is a basic Linux-side backup operation. Later, the archive can be integrated with cloud storage such as Amazon S3.

---