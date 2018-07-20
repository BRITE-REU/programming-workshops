.. _linux_bash:

====================================================
Workshop 6: An Introduction to Relational Detabases
====================================================

This workshop provides a basic introduction to Relational Databases using the SQLite program.

There are **three main aspects** of database usage, 

- database **design and construction**
- **loading data**
- **querying the data** 

Below I discuss the main points of each and introduce use of the **SQL language** in the context of the **sqlite3** database management program.  This document contains the following sections:

- ` 1 Database Design`_
- `2 Adding Data`_
- `3 Querying Data`_

First we will talk about data preparation and exploration. 
Then we will introduce a general pipeline for unsupervised and supervised learning. 

You are expected to study the the following content:

* `Dataset exploration and validation <dataset.html>`_
* `Learning models <learning.html>`_
    - `Unsupervised learning <unsupervised_learning.html>`_
    - `Supervised learning <supervised_learning.html>`_


In the workshop, do some basic data exploration and modeling.

- `Machine Learning Workshop <Workshop_machine_learning.html>`_



**Tutorials**

.. toctree::
    :maxdepth: 2

    Datasets <dataset>
    SQLite <SQLite>
    Relational Databases <Relational_Databases>
    SQL <Workshop_SQL>


.. _`1 Database Design`:

---------------------
1 Database Design
---------------------

Relational databases, the most common type, are designed around entities and relationships between entities.  Database design deals with these.  

For example, a movie database might contain information on movies and actors.  These are entities.  The relationship that ties certain actors to certain movies can be called the cast. The figure below is part of the design of such a database.  In it, the rectangles are entities and the diamond is a relationship.  The lines connect the entities to the relationship.  

 

Relational databases consist of tables of data.  Each table consists of rows.  In an entity table, each row contains data about one instance of that entity.  For example, in a movie table, each row has information about one movie.   The following is a description of a table to hold movie data written is SQL.  This description is used to create the movie table.

.. code:: SQL

    CREATE TABLE movies (
        mid integer primary key, 
        title text, 
        year integer, 
        genres text
    );

The data in a row is divided into fields.  Each field holds a particular piece of data.  In our movie rows, the individual fields are:
- mid – a unique integer identifier for the row
- title – the movie title, stored as a text string	
- year – the year the movie came out, stored as an integer
- genres – a list of classification labels for the movie content, stored as a text string

The primary key notation on the mid field indicates that the data will be sorted for fast lookup on this field.  
The following are a few rows of data from the movies table.   This data comes from the publicly available IMDb (Internet Movie Database) at https://www.imdb.com/interfaces/.

.. code:: 

    mid         title                           year  genres              
    ----------  ------------------------------  ----  --------------------
    369610      Jurassic World                  2015  Action,Adventure,Sci
    1326190     Aliens: Zone-X                  2015  Sci-Fi              
    1392190     Mad Max: Fury Road              2015  Action,Adventure,Sci
    1828251     Journey to Mt. Fuji             2015  Adventure,Family,Sci
    2395427     Avengers: Age of Ultron         2015  Action,Adventure,Sci
    2577662     The Rise of the Robots          2015  Sci-Fi              
    2651352     Ratpocalypse                    2015  Fantasy,Sci-Fi      

Similarly, each row in an actors table holds data about an actor.  The following is a description of a table to hold actor data written is SQL.  Again, this description is used to create the actor table.

.. code:: SQL

    CREATE TABLE actors3 (
        aid integer primary key, 
        name text
    );

Rows in this table hold only two values:
o	aid, a unique integer identifier for the row
o	name, the name of the actor, stored as a text string

The following are a few rows of data from the actors table.  

.. code:: bash

    aid         name                          
    ----------  ------------------------------
    1           Fred Astaire                  
    2           Lauren Bacall                 
    3           Brigitte Bardot               
    4           John Belushi                  
    5           Ingmar Bergman                
    6           Ingrid Bergman                
    7           Humphrey Bogart               
    8           Marlon Brando                 
    9           Richard Burton                
    10          James Cagney

Here the fields are 
o	aid– a unique integer identifier for the row
o	name – the actor's name


Relationship tables are different.   They hold values that tie the entities together.  Instead of using actual data, the identifiers are used in a relationship table.  The following is a description of the cast table.

.. code:: SQL

    CREATE TABLE cast (
        mid integer, 
        aid integer, 
        role text
    ); 

The fields are:
o	mid, an integer identifier from the movies table
o	aid, an integer identifier from the actors table
o	role, a description of the actors role in the movie, stored as a text string

Movies typically have more than one actor, so the cast table will typically have more than one row for the same movie, each with a different actor.  For example, the movie "Wonder Woman" has the following row in the movies table:

.. code:: SQL

    mid         title         year        genres                  
    ----------  ------------  ----------  ------------------------
    451279      Wonder Woman  2017        Action,Adventure,Fantasy

Note the movie row identifier mid = 451279.  In order to tie the movies to its actors, the same identifier, is used in the cast table.

.. code:: SQL

    mid         aid         role                          
    ----------  ----------  ------------------------------
    451279      2933757     ["Diana"]                     
    451279      1517976     ["Steve Trevor"]              
    451279      705         ["Antiope"]                   
    451279      205063      ["Etta"]

Who are these actors?  The only way to find out is to go to the actors table and look for the rows with the corresponding aid identifiers.

.. code:: SQL

    aid         name                
    ----------  --------------------
    2933757     Gal Gadot           
    1517976     Chris Pine          
    705         Robin Wright        
    205063      Lucy Davis          



.. _`2 Adding Data`:

---------------
2 Adding Data 
---------------

In sqlite3, the easiest way to add data to a table is to load it from a file.  sqlite3 has a special command for this called .import that is one of a series of commands that start with a period and are called dot commands.  

The file should:
o	contain rows of data
o	have in each row, 
o	one value for each field
o	fields in the same order as the create table statement
o	all fields separated by the same character, such as
o	a tab "\t" (a tab separated file or tsv)
o	a comma "," (a comma separated file or csv)

For example, importing movie data into the movies table can be done as follows.  First set the type of field separator.  This can be done with .mode csv or .mode tabs then import the data from the file movies.tsv.  Note that the prompt sqlite> appears when the sqlite3 program is running.

.. code:: SQL

    sqlite>.mode tabs
    sqlite>.import movies.tsv

.. _`3 Querying data`:

--------------------
3 Querying Data
--------------------

Data is queried with SQL query statements.  These statements have the following clauses.  Select and From clauses are required, all others are optional.

o	Select – lists the fields in the output 
o	From – lists the table or tables used to collect the data
o	Where – boolean conditions (true/false) limiting the rows used
o	Group by – used with aggregates like count(*)
o	Having – boolean conditions limiting output after a group by
o	Order by – sort the output by a field, either ascending (ASC) or descending (DESC)
o	Limit – limit the maximum rows of output

The following example lists the first ten sci-fi movies from 2017 whose titles start with "star".  Note that like is used for string matching and that "%" stands for zero or more "I don't care" characters.  So this means that sci-fi occurs somewhere in the genres field.  
 
sqlite> select title, year, genres 
   ...> from movies
   ...> where year = 2017 and title like "star%" and genres like "%sci-fi%"
   ...> limit 10;
Joins

When you want to combine data from different tables, joins are used.  This is how to retrieve information on both actors and movies in the same query.  Joins occur in the FROM clause.  All the tables required are listed and the columns that should be used to join the rows are specified.  Recall the diagram from above.  Now it's labeled with the columns that join the entity and relationship tables.


 

Going back to the Wonder Woman example.  Here is a query that returns the actors by looking for the movie name.  The results are shown after the query.

.. code:: SQL

    sqlite> select mid, title, aid, name, role 
       ...> from movies join cast using(mid) join actors using (aid) 
       ...> where title like "wonder woman";

.. code:: SQL

    mid         title         aid         name        role                
    ----------  ------------  ----------  ----------  --------------------
    451279      Wonder Woman  2933757     Gal Gadot   ["Diana"]           
    451279      Wonder Woman  1517976     Chris Pine  ["Steve Trevor"]    
    451279      Wonder Woman  705         Robin Wrig  ["Antiope"]         
    451279      Wonder Woman  205063      Lucy Davis  ["Etta"]

Notice the joins in the from clause.   The first one is  
.. code:: SQL

    movies join cast using(mid)

This indicates that rows from movie should be combined with rows from cast when they share the same mid value.  In effect, this produces an intermediate table with the following rows: mid, title, aid, role as can be seen in the following query.
sqlite> select * from movies join cast using (mid) limit 10;

.. code:: SQL

    mid     title           year  genres      aid       role          
    ------  --------------  ----  ----------  --------  --------------
    35423   Kate & Leopold  2001  Comedy,Fan  212       ["Kate McKay"]
    35423   Kate & Leopold  2001  Comedy,Fan  413168    ["Leopold"]   
    35423   Kate & Leopold  2001  Comedy,Fan  630       ["Stuart Besse
    35423   Kate & Leopold  2001  Comedy,Fan  5227      ["Charlie McKa
    66853   Na Boca da Noi  2016  Drama       180878    ["Vítor Hugo"
    66853   Na Boca da Noi  2016  Drama       206883    ["Hugo"]      
    66853   Na Boca da Noi  2016  Drama       94426     \N            
    66853   Na Boca da Noi  2016  Drama       138681    \N            
    69049   The Other Side  2018  Drama       1379      ["Jake Hannafo
    69049   The Other Side  2018  Drama       709947    ["John Dale"] 

The second join is
.. code:: SQL

    X join actors using (aid)
where X is the result of the first join.   This indicates that rows from the first join should be combined with rows from actors when they share the same aid.  Again, this has the effect of producing an intermediate table with one additional field, name.  
sqlite> select * from movies join cast using (mid) join actors using (aid) limit 10;

.. code:: SQL


    mid     title           year  genres      aid       role            name                
    ------  --------------  ----  ----------  --------  --------------  --------------------
    35423   Kate & Leopold  2001  Comedy,Fan  212       ["Kate McKay"]  Meg Ryan            
    35423   Kate & Leopold  2001  Comedy,Fan  413168    ["Leopold"]     Hugh Jackman        
    35423   Kate & Leopold  2001  Comedy,Fan  630       ["Stuart Besse  Liev Schreiber      
    35423   Kate & Leopold  2001  Comedy,Fan  5227      ["Charlie McKa  Breckin Meyer       
    66853   Na Boca da Noi  2016  Drama       180878    ["Vítor Hugo"   Rubens Correia      
    66853   Na Boca da Noi  2016  Drama       206883    ["Hugo"]        Ivan de Albuquerque 
    66853   Na Boca da Noi  2016  Drama       94426     \N              Roberto Bonfim      
    66853   Na Boca da Noi  2016  Drama       138681    \N              Marilia Carneiro    
    69049   The Other Side  2018  Drama       1379      ["Jake Hannafo  John Huston         
    69049   The Other Side  2018  Drama       709947    ["John Dale"]   Robert Random       


The result we're interested, the actors in "Wonder Woman" comes from searching the rows in the final intermediate table for those whose title matches "wonder woman".  

 
Tasks
1.	CREATE tables for movies, actors, and cast.
2.	Add data to the tables using the files movies.tsv, actors.tsv, cast.tsv.
3.	Write queries to get answers for the following.
a.	How many actors are listed in the actor table?  (answer is an integer)
b.	How many movies in the movie table? (answer is an integer)
c.	How many movies have the word "bride" in the title?  "groom" in the title? (answer for each is an integer)
d.	How many actors have a first name that starts "Amy"? (answer is a number)
e.	Pick a year and list the first five movies in the year you picked with titles that start with a "b" and with "comedy" in the genres column.  (answer is five rows, each containing year, title, genre)
f.	Pick a favorite actor and list all titles and years of the movies that person appears in. (answer is multiple rows, each containing name, title, year) 
g.	Pick a movie and find all the actors that appeared in it.  (answer is multiple rows, each containing title, name)
h.	List the top ten actors with the most roles.  (answer is multiple rows, each containing name, count of roles)


--------
Task 1
--------

Starting and stopping sqlite.

The following starts sqlite and creates a database file or uses a file if it already exists.  Note that I'm using "%" as an arbitrary symbol for your system prompt.

%sqlite3 mydatabase.db

The following stops sqlite.  Note that "sqlite>" is the sqlite prompt.

sqlite> .quit

Create a file "create.txt" with the CREATE TABLE statements for movie, actor, and cast.  Use .read to read in and execute the statements in sqlite.

 sqlite> .read create.txt

Use .schema to see that all the tables were created.  This will list the CREATE TABLE statements.

 sqlite> .schema



--------
Task 2
--------

Copy the files "movies.csv", "actors.csv", and "cast.csv" into your directory and load their data into the tables you've created.  Use something similar to the following for each file.

sqlite>.mode tabs
sqlite>.import movies.tsv

Confirm that data has been loaded into each table using commands like the following, which list the first 10 lines from a table.  Note that the .mode and .headers commands make the output easy to read.  select * means output all fields of each row. 

sqlite> .mode column
sqlite> .headers on
sqlite> select * from movies limit 10;

Note that if you get the continuation symbol  ...> it means you hit return before the command was complete.  Either continue typing or add a missing semicolon (;) at the end. 

sqlite> select * from movies limit 10
   ...>; 

Confirm the number of rows of data in the table. select count(*)means count the number of rows in the table.

sqlite> select count(*) from movies;



--------
Task 3
--------

Write SQL select statements to get the answers.


 
sqlite3 dot commands

.quit                  	Exit sqlite3
.headers on|off        	Turn display of field names on or off
.help                  	Show this message
.import FILE TABLE     	Import data from FILE into TABLE
.open FILE	       	    Close existing database and open FILE database
.output FILE|stdout    	Send output (such as result of SQL query) to FILE or screen
.read FILE	       	    Execute SQL in FILE
.schema 			    Show the CREATE statements in this database
.separator "x"		    Change the column separator to x for both .import and output
.show                  	Show the current values for various settings

.dump ?TABLE? ...      	Dump the database in an SQL text format
.mode OPTION		Set output mode where OPTION is one of:
                         			csv     	  Comma-separated values
					tabs    	  Tab-separated values
					list     	  Values delimited by .separator strings
                         			column   Left-aligned columns for display (use with .width)
  .width n1 n2 …		Set column widths for "column" mode, 0 means auto set column, 
				negative values right-justify
                       			


