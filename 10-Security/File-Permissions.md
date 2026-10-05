📁 Linux File Permissions

📌 Overview

Linux permissions control who can:

Read

Write

Execute

a file or directory.

🔍 View Permissions

ls -l

Example:

-rwxr-xr--  user  group  script.sh

Permission groups:

Owner | Group | Others

Example:

rwx | r-x | r--

🔤 Permission Values

Permission

Symbol

Value

Read

r

4

Write

w

2

Execute

x

1

Example:

rwx = 4 + 2 + 1 = 7
r-x = 4 + 0 + 1 = 5
r-- = 4 + 0 + 0 = 4

Therefore:

754

means:

Owner  → rwx
Group  → r-x
Others → r--

🔧 chmod

Symbolic:

chmod u+x script.sh
chmod g+w file.txt
chmod o-r file.txt

Numeric:

chmod 755 script.sh
chmod 644 file.txt
chmod 600 private.txt

👤 chown

Change owner:

sudo chown user file.txt

Change owner and group:

sudo chown user:group file.txt

Recursive:

sudo chown -R user:group directory/

Use recursive ownership changes carefully.

👥 chgrp

sudo chgrp developers file.txt

📂 Directory Permissions

For directories:

r → list directory contents
w → create/delete entries
x → access/traverse directory

🔐 Common Permissions

600 → private file
644 → normal file
700 → private directory
755 → executable/shared directory

Avoid giving unnecessary permissions such as:

chmod 777 file

🧪 Lab

Create:

touch test.txt
chmod 600 test.txt
ls -l test.txt

Then:

chmod 644 test.txt
ls -l test.txt

🎤 Interview Questions

What are Linux permissions?

What does 755 mean?

What does 644 mean?

Difference between chmod and chown?

What does execute permission mean on a directory?

Why should 777 generally be avoided?

What are owner, group, and others?

✅ Checklist

Understand rwx

Understand numeric permissions

Use chmod

Use chown

Use chgrp

Understand directory permissions