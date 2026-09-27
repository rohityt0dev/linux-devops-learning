Text-Processing.md
Linux Text Processing
🎯 Objective

Learn how to inspect, filter, transform, and analyze text from files and command output.

These commands are extremely useful when working with:

Logs
Configuration files
Application output
Reports
Server troubleshooting
1. grep

Search for text.

grep "ERROR" application.log

Case-insensitive:

grep -i "error" application.log

Show line numbers:

grep -n "ERROR" application.log

Invert match:

grep -v "INFO" application.log

Recursive search:

grep -r "database" /var/log
2. Pipes

Send output from one command to another.

ls -l | grep ".log"

Example:

ps aux | grep nginx
3. sort

Sort lines:

sort users.txt

Reverse:

sort -r users.txt

Numeric:

sort -n numbers.txt
4. uniq

Remove consecutive duplicate lines.

sort users.txt | uniq

Count occurrences:

sort users.txt | uniq -c
5. cut

Extract fields.

cut -d: -f1 /etc/passwd

Here:

-d: = delimiter :
-f1 = first field
6. tr

Translate characters.

echo "hello" | tr 'a-z' 'A-Z'

Output:

HELLO
7. awk

Process structured text.

Example:

awk '{print $1}' file.txt

Print first field.

Example:

df -h | awk '{print $1, $5}'
8. sed

Stream editor.

Replace text:

sed 's/old/new/' file.txt

Replace all occurrences on each line:

sed 's/old/new/g' file.txt
9. Redirection

Write output:

ls > files.txt

Append:

ls >> files.txt

Redirect errors:

command 2> errors.txt

Redirect output and errors:

command > output.txt 2>&1
🧪 Text Processing Lab

Create:

cat > users.txt <<EOF
alice
bob
alice
charlie
bob
david
alice
EOF

Run:

sort users.txt

Then:

sort users.txt | uniq

Count users:

sort users.txt | uniq -c

Search:

grep "alice" users.txt

Count:

grep -c "alice" users.txt
🎯 Log Analysis Challenge

Create:

cat > application.log <<EOF
INFO Application started
INFO User login
ERROR Database connection failed
INFO User logout
WARNING Disk usage high
ERROR Database timeout
INFO Application stopped
EOF

Find errors:

grep "ERROR" application.log

Count errors:

grep -c "ERROR" application.log

Find warnings:

grep "WARNING" application.log

Create report:

grep "ERROR" application.log > errors.txt

---