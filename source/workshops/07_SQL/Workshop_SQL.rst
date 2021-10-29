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

- `Task 3`_:  Write queries to get answers for questions about the data.

************
Abbreviated workshop only
************
If this is an abbreviated workshop, we'll skip Tasks 1 and 2 and instead load a pre-existing sqlite database.  This can be done as follows:  

1. **Create a directory** for this workshop called **SQLworkshop**.  Do this on the SCC under your directory.  All your work should be done in this directory. Open a terminal window and **`cd` to your `SQLworkshop` directory**.  **Note that % is used below as an arbitrary symbol for your system prompt.**

.. code::
	
	%mkdir SQLworkshop
	%cd SQLworkshop


2. **Load sqlite3**.

Use module load.

.. code::
	
	%module load sqlite3

3. **Copy the pre-existing database file** to your SQLworkshop directory.

.. code::
	
	cp /projectnb/bubpwtf/SQL_workshop/mymovies.db .

4. **Open the pre-existing sqlite database file**.

.. code::
	
	%sqlite3 mymovies.db


5. Use **.schema to see the tables** in the database.  This will list the CREATE TABLE and CREATE INDEX statements that were used to create the database tables. **Note that "sqlite>" is the sqlite prompt.**

.. code::

   sqlite> .schema
 
6. **Stop sqlite and restart** (so you can see how this is done).

.. code::

    sqlite> .quit
    %sqlite3 mymovies.db

7. **Set the viewing parameters** in sqlite.

.. code::

    sqlite> .mode columns
    sqlite> .width 18 18 18 18 18 18 18
    sqlite> .headers on
    
***Note:** If the columns are too narrow to see all the content, you can always switch columns off using `sqlite> .mode list`{:.sqlite}.

7. **Skip ahead** to `Task 3`_.


.. _`Task 1`:

************
Task 1
************

1. **Create a directory** for this workshop called **SQLworkshop**.  Do this on the SCC under your directory.  All your work should be done in this directory. Open a terminal window and `cd` to your `SQLworkshop` directory. **Note that % is used below as an arbitrary symbol for your system prompt.**

.. code::
	
	%mkdir SQLworkshop
	%cd SQLworkshop


2. **Load sqlite3**.

Use module load.

.. code::
	
	%module load sqlite3

3. **Create the database file**

Starting sqlite3 with a file name creates a database file with that name or uses that file if it already exists.  Create a file called **mymovies.db**.  

.. code::
	
	%sqlite3 mymovies.db


Now, stop sqlite.  **Note that "sqlite>" is the sqlite prompt.**

.. code::

    sqlite> .quit

4. **Create the database tables**

Create a file **create.sql** in an editor and enter the CREATE TABLE statements for movies, actors, and cast.  You can copy and paste the statements below.  

.. code:: SQL

    CREATE TABLE movies (
        mid integer primary key, 
        title text, 
        year integer, 
        genres text
    );


    CREATE TABLE actors (
        aid integer primary key, 
        name text
    );


    CREATE TABLE cast (
        mid integer, 
        aid integer, 
        role text
    ); 



**Also add the following two lines at the bottom of your create.sql file**.  They create indexes which sort the data in the cast table for fast lookup.  This is necessary because the cast table doesn't have a primary key.

.. code:: SQL

	CREATE INDEX mid_aid_index on cast (mid, aid);
	CREATE INDEX aid_mid_index on cast (aid, mid);

**Restart sqlite** with mymovies.db.  Then use **.read** to read in the file create.sql.  This will execute the statements in the file and create the tables.


.. code::
	
	%sqlite3 mymovies.db

        sqlite> .read create.sql


Use **.schema** to see that all the tables were created.  This will list the CREATE TABLE and CREATE INDEX statements.

.. code::

   sqlite> .schema
 
 
If you've made a mistake at this point, quit sqlite, delete the mymovies.db file in SQLworkshop and start again.


.. _`Task 2`:

************
Task 2
************  
  
Data for the three tables, in tab separated format, has been stored on the SCC in the following files:
 - /projectnb/bubpwtf/SQL_workshop/movies.tsv
 - /projectnb/bubpwtf/SQL_workshop/actors.tsv
 - /projectnb/bubpwtf/SQL_workshop/cast.tsv


Note that these files are also stored at the following location if you want to download them to your own computer.  Click on the names and use the download button on the next page.
 - "`movies.tsv <https://github.com/BRITE-REU/programming-workshops/blob/master/movies.tsv>`_"  
 - "`actors.tsv <https://github.com/BRITE-REU/programming-workshops/blob/master/actors.tsv>`_"   
 - "`cast.tsv <https://github.com/BRITE-REU/programming-workshops/blob/master/cast.tsv>`_"

Load each file into its own table.  Use the following for the movies.tsv file.  

.. code::

	sqlite> .mode tabs
	sqlite> .import /projectnb/bubpwtf/SQL_workshop/movies.tsv movies

Confirm that data has been loaded into the movies table using the following command that counts the number of records in the table.  The answer should be 102754.  

.. code::

	sqlite> select count(*) from movies;
	
Note that if you get the continuation symbol  **...>** it means you hit return before the command was complete.  Either continue typing or add a missing semicolon (;) at the end. 


.. code:: 

	sqlite> select count(*) from movies
   	...>; 


Now **repeat for the other two files**. The counts are: actors: 223146, cast: 420000.

To view the contents of an individual table, use a **select** command like the following, which lists the first 10 lines from a table.  Note that the **.mode** and **.headers** commands make the output easy to read.  **select \*** means output all fields of each row. 

.. code::

	sqlite> .mode column
	sqlite> .headers on
	sqlite> select * from movies limit 10;
	

.. _`Task 3`:

************
Task 3
************

Write SQL select statements to get the answers to the listed questions.  Use the format shown below.


.. code:: 

    SELECT field name, field name, ...
    FROM table name
    WHERE condition [AND|OR condition etc.] 
    GROUP BY field name
    HAVING condition [AND|OR condition etc.] 
    ORDER BY field name [asc|desc] ...
    LIMIT integer
    
    
**Using SELECT and WHERE in a single table**

	1. Pick a movie you know from year 2000 or later and find out its mid. Try using the `LIKE' keyword for pattern matching so you don't have to write out the entire name.  (answer is mid, title, *i.e.*, use **SELECT mid, title ...**)
	
	#. Pick an actor you know and find out her or his aid.  (answer is aid, name)
	
	#. Pick a year from 2000 or later and list the first five movies in the year you picked with titles that start with a "b" and with "comedy" in the genres column.  (answer is five rows, each containing year, title, genre) 

**Using count()**

	4. How many actors have a first name that starts "Amy"? (answer is a count)
	
	#. How many actors have a last name beginning with "C"? (answer is a count)
	
	#. How many movies are in the comedy genre? (answer is a count)
	
	#. How many movies have the word "bride" in the title?  "groom" in the title? (answer for each is a count)
	
	#. How many movies have both comedy and romance listed in their genres? (answer is a count) 
	
**Using GROUP BY**
	
	9. List the number of movies in each year.  (answer is multiple rows, each containing year and count)
	
**Using GROUP BY, HAVING, ORDER BY**

	10. List the top genre combinations, i.e, those that occur at least 500 times. List them in descending order by the number of occurrences.
	
You'll have to adjust the column widths to see the entire genre names.  Use this:

.. code:: 

	sqlite> .width 30 10

**Using joins**
	
	11. Pick a favorite actor and list all titles and years of the movies that person appears in. (answer is multiple rows, each containing name, title, year) 
	
	#. Pick a movie and find all the actors that appeared in it.  (answer is multiple rows, each containing title, name)
	
	#. Pick an actor and list each movie that person appears in and that person's role in the movie.  (answer is multiple rows, each containing a movie and role
	
	#. List the actors in descending order by their number of roles and limit the list to the top ten.  (answer is multiple rows, each containing name, count of roles)
	
	#. Find actors who have appeared in at least five comedies.  Limit to 30.  First do this without any ordering.  Then, list them in descending order of number of comedies. (answer is multiple rows, each containing name, count of movies)
	
	#. (Hard) Find actors who have appeared in at least five comedies and five dramas.  Limit to 30.  First do this without any ordering, then list them in descending order of the combined number of comedies and dramas. 


***************
Try It At Home
***************

Follow these steps to add movie ratings to your database.

- **Create** a **ratings** table.  It should have three fields: 
	- **mid** – a unique integer identifier for the movie (set this as the **primary key**)
	- **rating** – a floating point value for the movie rating (**datatype: real**)
	- **votes** – an integer value for the number of votes received by the movie
- The **data file** is on the SCC at /projectnb/bubpwtf/SQL_workshop/ratings.tsv (or download at "`ratings.tsv <https://github.com/BRITE-REU/programming-workshops/blob/master/ratings.tsv>`_" by clicking on the name and selecting Raw on the next page.)  
- **Import** the data into your table.  There should be 66781 records.

Answer these queries

	1. How many movies are rated? (answer is a count)
	#. How many movies have more than 5000 votes? (answer is a count)
	#. What are the top ten rated movies with at least 5000 votes? With at least 50,000 votes?  With less than 5000 votes? (answer is multiple rows, each with a title, rating, votes)
	#. What is the range of ratings (use min() for low and max() for high)? (answer is two values)
	#. Show the ratings, votes, and year of Star Wars movies with at least 100,000 votes, ordered by rating from highest to lowest. (answer is multiple rows, each with a year, title, rating, votes)
	#. What is the distribution of ratings in bins of size 1 (i.e., how many are rated from 0 to 0.999, from 1 to 1.999, etc).  To do this you can use 1) the **round( )** function on the ratings and 2) GROUP BY.  (answer is multiple rows, each with a rounded rating and count)
	

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
	.mode OPTION		Set output/input mode where OPTION is one of:
				    csv     	  Comma-separated values
				    tabs    	  Tab-separated values
				    list     	  Values delimited by .separator strings
                                    column        Left-aligned columns for display (use with .width)
	.open FILE	       	Close existing database and open FILE database
	.output FILE|stdout    	Send output (such as result of SQL query) to FILE or screen
	.read FILE	       	Execute SQL in FILE
	.schema 		Show the CREATE statements in this database
	.separator "x"		Change the column separator to x for both .import and .output
	.show                  	Show the current values for various settings
	.width n1 n2 …		Set column widths for "column" mode, 0 means auto set column, 
				    negative values right-justify
                       			







