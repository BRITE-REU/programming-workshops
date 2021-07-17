====================
SQL
====================

--------------------
SQLite
--------------------

**Install SQLite**

(Note: the SQLite program is called sqlite3)

**Windows:**

See this very useful video to install SQLite: https://www.youtube.com/watch?v=zOJWL3oXDO8 

**Mac and Linux:**

Should already be preinstalled.  To check, open a terminal window and type “sqlite3”.  To quit the program after you’ve started it, type “.quit”. (Note the "." before "quit")

**GUI:**

There are two reasonably good GUIs for using SQLite.  I haven’t used either extensively, so can’t make a strong recommendation, but I preferred SQLite Studio. These are not required for the workshop, but may be beneficial if you use the program after this summer. 

- **SQLite Studio**.  Download for all three major operating systems here: https://sqlitestudio.pl
- **DB Browser for SQLite**. Downloads are here: https://sqlitebrowser.org/

**Test:**

Follow these steps:

- In all three major operating systems, open a command terminal, create a directory called “sqlitedb”, and move to that directory 
- Create a new database file called test.db by typing: “sqlite3 test.db”  
- You should see something like this.  If so, it's working.

  .. code::

    SQLite version 3.32.2 2020-06-04 12:58:43
    Enter ".help" for usage hints.
    sqlite> 

- Exit the program by typing “.quit”

**Tutorial and Documentation:**

This is a good introduction:
https://www.tutorialspoint.com/sqlite/index.htm

This is the official SQLite Documentation: 
https://sqlite.org


---------
MySQL  
---------

.. note:: We are not using MySQL this year!

For Mac, use the DMG archive.
https://dev.mysql.com/downloads/mysql/5.7.html#downloads

For Windows:
https://dev.mysql.com/downloads/mysql/5.7.html#downloads
Choose (mysql-installer-web-community-8.0.11.0.msi)

For linux:
https://dev.mysql.com/doc/refman/5.7/en/linux-installation.html

**Install a mysql database interface**


This gives a GUI interface to databases and their contents, as well as a window to write SQL commands.

On Mac use Sequel Pro: https://www.sequelpro.com/

On linux and Windows, use phpmyadmin: https://www.phpmyadmin.net/

See this wiki page for installing on Windows:
https://www.wikihow.com/Install-phpMyAdmin-on-Your-Windows-PC
