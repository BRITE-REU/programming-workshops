====================
SQL
====================

--------------------
SQLite
--------------------

**Install SQLite**
(Note: the SQLite program is called sqlite3)

**Windows:**
See this very useful video to install SQLite
https://www.youtube.com/watch?v=zOJWL3oXDO8

**Mac and Linux:**
Should already be preinstalled.  To check, open a terminal window and type “sqlite3”.  To quit the program after you’ve started it, type “.quit”.

**GUI**
There are two reasonably good GUIs for using SQLite.  I haven’t used either extensively, so can’t make a strong recommendation, but I prefered SQLite Studio..  

- SQLite Studio.  Download for all three major operating systems here: https://sqlitestudio.pl/index.rvt?act=download
- DB Browser for SQLite. Downloads are here: https://sqlitebrowser.org/

Test
In all three major operating systems, open a command terminal and create and move to a directory called “sqlitedb”  
then create a new database file called test.db by typing: “sqlite3 test.db”  
you should see something like:
SQLite version 3.13.0 2016-05-18 10:57:30
Enter ".help" for usage hints.
sqlite> 
If so, it’s working.  To exit the program, type “.quit”

Tutorial
This is a good introduction:
https://www.tutorialspoint.com/sqlite/index.htm



********************
MySQL
********************

For Mac, use the DMG archive.
https://dev.mysql.com/downloads/mysql/5.7.html#downloads

For Windows:
https://dev.mysql.com/downloads/mysql/5.7.html#downloads
Choose (mysql-installer-web-community-8.0.11.0.msi)

For linux:
https://dev.mysql.com/doc/refman/5.7/en/linux-installation.html

Install a mysql database interface
****************************************

This gives a GUI interface to databases and their contents, as well as a window to write SQL commands.

On Mac use Sequel Pro: https://www.sequelpro.com/

On linux and Windows, use phpmyadmin: https://www.phpmyadmin.net/

See this wiki page for installing on Windows:
https://www.wikihow.com/Install-phpMyAdmin-on-Your-Windows-PC
