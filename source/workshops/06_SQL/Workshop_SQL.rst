.. _linux_bash:

=====================================================================
SQL Workshop
=====================================================================
.. _tasks:

-------------- 
Tasks 
--------------
In the workshop, we'll do the following.  See the instructions below for guidance in each task.

- `Task 1`_: Create tables for movies, actors, and cast.

- `Task 2`_: Add data to the tables using the files movies.tsv, actors.tsv, cast.tsv.

- `Task 3`_:  Write queries to get answers for the following.

**Using SELECT and WHERE in a single table**

	1. Pick a movie you know from year 2000 or later and find out its mid.  (answer is mid)
	
	#. Pick an actor you know and find out her or his aid.  (answer is aid)
	
	#. Pick a year and list the first five movies in the year you picked with titles that start with a "b" and with "comedy" in the genres column.  (answer is five rows, each containing year, title, genre) 

**Using count()**

	4. How many actors are listed in the actor table?  (answer is a count)
	
	#. How many movies in the movie table? (answer is a count)
	
	#. How many movies have the word "bride" in the title?  "groom" in the title? (answer for each is a count)
	
	#. How many actors have a first name that starts "Amy"? (answer is a count)
	
**Using Group By**
	
	8. List the number of movies in each year.  (answer is multiple rows, each containing year and count)
	
**Using joins**
	
	9. Pick a favorite actor and list all titles and years of the movies that person appears in. (answer is multiple rows, each containing name, title, year) 
	
	#. Pick a movie and find all the actors that appeared in it.  (answer is multiple rows, each containing title, name)
	
**Using ORDER BY**

	11. List the top ten actors with the most roles.  (answer is multiple rows, each containing name, count of roles)
	
**Using the same table more than once in a join**

	12. Find two actors that appear together in two different movies (harder).  (answer is multiple rows, each containing actor1, actor2, movie1, movie2)
	
	

.. _`Task 1`:

************
Task 1
************

**Starting and stopping sqlite.**

The following starts sqlite and creates a database file **mydatabase.db** or uses that file if it already exists.  **Note that % is used below as an arbitrary symbol for your system prompt.**

.. code::
	
	%sqlite3 mydatabase.db


The following stops sqlite.  **Note that "sqlite>" is the sqlite prompt.**

.. code::

    sqlite> .quit


Create a file **create.txt** in an editor and enter the CREATE TABLE statements for movies, actors, and cast.  Use **.read** to read in and execute the statements in sqlite.

.. code::

   sqlite> .read create.txt


Use **.schema** to see that all the tables were created.  This will list the CREATE TABLE statements.

.. code::

   sqlite> .schema

.. _`Task 2`:

************
Task 2
************

Copy the files "`movies.csv <https://github.com/BRITE-REU/programming-workshops/blob/master/source/workshops/06_SQL/data/movies.csv>`_", "`actors.csv <https://github.com/BRITE-REU/programming-workshops/blob/master/source/workshops/06_SQL/data/actors.csv>`_", and "`cast.csv <https://github.com/BRITE-REU/programming-workshops/blob/master/source/workshops/06_SQL/data/cast.csv>`_" into your directory and load their data into the tables you've created.  Use something similar to the following for each file.

.. code::

	sqlite>.mode tabs
	sqlite>.import movies.tsv

Confirm that data has been loaded into each table using commands like the following, which list the first 10 lines from a table.  Note that the **.mode** and **.headers** commands make the output easy to read.  **select \*** means output all fields of each row. 

.. code::

	sqlite> .mode column
	sqlite> .headers on
	sqlite> select * from movies limit 10;
	

Note that if you get the continuation symbol  **...>** it means you hit return before the command was complete.  Either continue typing or add a missing semicolon (;) at the end. 

.. code:: 

	sqlite> select * from movies limit 10
   	...>; 
	

Confirm the number of rows of data in the table. **select count(*)** means count the number of rows in the table.

.. code:: 

	sqlite> select count(*) from movies;


.. _`Task 3`:

************
Task 3
************

Write SQL select statements to get the answers to the listed questions.

.. _`dot commands`:

---------------
SQLite Dot Commands 
---------------

.. code:: 
	
	sqlite3 dot commands

	.quit                  	Exit sqlite3
	.headers on|off        	Turn display of field names on or off
	.help                  	Show this message
	.import FILE TABLE     	Import data from FILE into TABLE
	.mode OPTION		Set output mode where OPTION is one of:
				    csv     	  Comma-separated values
				    tabs    	  Tab-separated values
				    list     	  Values delimited by .separator strings
                                    column        Left-aligned columns for display (use with .width)
	.open FILE	       	Close existing database and open FILE database
	.output FILE|stdout    	Send output (such as result of SQL query) to FILE or screen
	.read FILE	       	Execute SQL in FILE
	.schema 		Show the CREATE statements in this database
	.separator "x"		Change the column separator to x for both .import and output
	.show                  	Show the current values for various settings
	.width n1 n2 …		Set column widths for "column" mode, 0 means auto set column, 
				    negative values right-justify
                       			







