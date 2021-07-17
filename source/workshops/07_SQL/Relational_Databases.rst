====================================================
Workshop 7: An Introduction to Relational Detabases
====================================================

This workshop provides a basic introduction to Relational Databases using the SQLite program.

There are **three main aspects** of database usage, 

- database **design and construction**
- **loading data**
- **querying the data** 

Below I discuss the main points of each and introduce use of the **SQL language** in the context of the **sqlite3** database management program.  This document contains the following sections:

- `Database Design`_
- `Adding Data`_
- `Querying Data`_

---------------------
Database Design
---------------------

**Relational databases**, the most common type, are designed around **entities** and **relationships** between entities.  Database design deals with these.  

For example, a **movie database** might contain information on **movies** and **actors**.  These are entities.  The relationship that ties certain actors to certain movies can be called the **cast**. The figure below is part of the design of such a database.  In it, the **rectangles are entities** and the **diamond is a relationship**.  The lines connect the entities to the relationship.  

.. image:: movies.actors.cast.er.diagram.png
    :width: 400px
    :align: center
    :height: 80px
 

Relational databases consist of **tables of data**.  Each table consists of **rows**.  In an **entity table**, each row contains data about one instance of that entity.  For example, in a movie table, each row has information about one movie.   The following is a description of a table to hold movie data written is SQL.  This description is used to create the movie table.

.. code:: SQL

    CREATE TABLE movies (
        mid integer primary key, 
        title text, 
        year integer, 
        genres text
    );


The data in a row is divided into **fields**.  Each field holds a particular piece of data.  In our movie rows, the individual fields are:

- **mid** – a unique integer identifier for the row
- **title** – the movie title, stored as a text string	
- **year** – the year the movie came out, stored as an integer
- **genres** – a list of classification labels for the movie content, stored as a text string

The **primary key** notation on the mid field indicates that the data will be sorted for fast lookup on this field.  
The following are a **few rows of data from the movies table**.   This data comes from the publicly available IMDb (Internet Movie Database) at `https://www.imdb.com/interfaces/ <https://www.imdb.com/interfaces/>`_ .

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
    

Similarly, each row in an **actors table** holds data about an actor.  The following is a description of a table to hold actor data written is SQL.  Again, this description is used to create the actor table.

.. code:: SQL

    CREATE TABLE actors (
        aid integer primary key, 
        name text
    );


Rows in this table hold only two values:

- **aid** – a unique integer identifier for the row
- **name** – the name of the actor, stored as a text string

The following are a **few rows of data from the actors table**.

.. code:: 

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


**Relationship tables** are different.   They hold values that tie the entities together. Instead of using actual data, the identifiers are used in a relationship table.  The following is a description of the cast table.

.. code:: SQL

    CREATE TABLE cast (
        mid integer, 
        aid integer, 
        role text
    ); 


The fields are:


- **mid** – an integer identifier from the movies table
- **aid** – an integer identifier from the actors table
- **role** – a description of the actor's role in the movie, stored as a text string

Movies typically have more than one actor, so the **cast table will typically have more than one row for the same movie**, each with a different actor.  For example, the movie "Wonder Woman" has the following row in the movies table:

.. code:: 

    mid         title         year        genres                  
    ----------  ------------  ----------  ------------------------
    451279      Wonder Woman  2017        Action,Adventure,Fantasy


**Note** the movie row identifier mid = 451279.  In order to tie the movies to its actors, the same identifier, is used in the cast table.

.. code:: 

    mid         aid         role                          
    ----------  ----------  ------------------------------
    451279      2933757     ["Diana"]                     
    451279      1517976     ["Steve Trevor"]              
    451279      705         ["Antiope"]                   
    451279      205063      ["Etta"]


Who are these actors?  The only way to find out is to go to the actors table and look for the rows with the corresponding aid identifiers.

.. code:: 

    aid         name                
    ----------  --------------------
    2933757     Gal Gadot           
    1517976     Chris Pine          
    705         Robin Wright        
    205063      Lucy Davis          



---------------
Adding Data 
---------------

In **sqlite3**, the easiest way to add data to a table is to **load it from a file**.  sqlite3 has a special command for this called **.import** that is one of a series of commands that start with a period and are called `Dot Commands`_.  

.. _`Dot Commands`: https://github.com/BRITE-REU/programming-workshops/blob/master/source/workshops/06_SQL/Workshop_SQL.rst#sqlite-dot-commands

The file should:

* contain **rows of data**

* have **in each row** 
   * **one value for each field**
   * **fields in the same order as the create table statement**
* **all fields separated by the same character**, such as
   * a tab "\\t" (a tab separated file or **tsv**)
   * a comma "," (a comma separated file or **csv**)
    
For example, importing movie data into the movies table can be done as follows.  First, create a tab separated file with the data.  We'll arbitrarily call it movies.tsv.  Next, set the type of field separator in sqlite.  This can be done with **.mode tabs** command (or **.mode csv** if your file is comma separated).  Finally import the data from the file movies.tsv using the **.import** command including the file name and the destination table.  Note that the prompt **sqlite>** appears when the sqlite3 program is running.

.. code:: SQL

    sqlite>.mode tabs
    sqlite>.import movies.tsv movies


--------------------
Querying Data
--------------------

Data is queried with **SQL select statements**.  The basic form of an SQL query (Structured Query Language) for a single table is:

.. code:: 

    SELECT field name, field name, ...
    FROM table name
    WHERE condition [AND|OR condition etc.] 
    GROUP BY field name
    ORDER BY field name [asc|desc] ...
    LIMIT integer

The individual query parts are referred to as clauses. The **Select and From clauses are required**, all others are optional.

- **Select** – lists the fields in the output, any order 
- **From** – lists the table(s) where the data is stored 
- **Where** – gives boolean condition(s) (true/false) limiting the rows used
- **Group by** – used with aggregates like count(*)
- **Having** – gives boolean conditions limiting output after a GROUP BY
- **Order by** – sorts the output by field(s), either ascending (ASC) or descending (DESC)
- **Limit** – restricts the output to a maximum number of rows

The simplest query returns the whole table.  Limit is used in this example because the table contains over 100,000 rows. Here, "*" means “all fields.”

.. code::

    SELECT *
    FROM Movies
    LIMIT 10

.. code::

    mid     title           year  genres    
    ------  --------------  ----  ----------
    35423   Kate & Leopold  2001  Comedy,Fan
    66853   Na Boca da Noi  2016  Drama     
    69049   The Other Side  2018  Drama     
    88751   The Naked Mons  2005  Comedy,Hor
    94859   Chief Zabu      2016  Comedy    
    96056   Crime and Puni  2002  Drama     
    97540   Responso        2004  \N        
    100275  The Wandering   2017  Comedy,Dra
    102362  Istota          2000  Drama,Roma
    107706  Stupid Lovers   2000  \N             


Note that **\\N** means NULL or no value.
    
To restrict the fields, use field names:

.. code::

    SELECT title, genres, year
    FROM Movies
    LIMIT 10
    
.. code::

    title           genres                year
    --------------  --------------------  ----
    Kate & Leopold  Comedy,Fantasy,Roman  2001
    Na Boca da Noi  Drama                 2016
    The Other Side  Drama                 2018
    The Naked Mons  Comedy,Horror,Sci-Fi  2005
    Chief Zabu      Comedy                2016
    Crime and Puni  Drama                 2002
    Responso        \N                    2004
    The Wandering   Comedy,Drama,Fantasy  2017
    Istota          Drama,Romance         2000
    Stupid Lovers   \N                    2000    
              
To restrict records, impose a condition

.. code::

    SELECT title, genres, year
    FROM Movies
    WHERE year = 2018
    LIMIT 10

.. code::

    title                       genres                year
    --------------------------  --------------------  ----
    The Other Side of the Wind  Drama                 2018
    T.G.M. - osvoboditel        \N                    2018
    To Chase a Million          Action,Drama          2018
    Fahrenheit 451              Drama,Sci-Fi,Thrille  2018
    Nappily Ever After          Comedy,Drama,Romance  2018
    Alita: Battle Angel         Action,Adventure,Rom  2018
    Surviving in L.A.           Comedy,Drama,Romance  2018
    Escape from Heaven          Comedy,Fantasy        2018
    The Last Full Measure       Drama,War             2018
    Caravaggio and My Mother t  Comedy,Drama          2018
       
For **string comparison** several options are available. 

- **=** – strings must match exactly (usage\: **field = "pattern"**)

     - CaSe SeNsItIvE

- **LIKE** –  strings must match exactly (usage\: **field LIKE "pattern"**)
    
    - can use wildcards in pattern
    - ‘%’ for zero or more "I don't care" letters
    - ‘_’ for one letter 
    - not case sensitive

The following example uses a condition on the title and genres to restrict the output to titles which begin with **"star"** and where **"sci-fi"** occurs somewhere in the genres field.
 
.. code:: SQL
	
	sqlite> select title, genres, year 
	   ...> from movies
	   ...> where year = 2017 and title like "star%" and genres like "%sci-fi%"
	   ...> limit 10;

.. code:: 

    title                          genres                year
    -----------------------------  --------------------  ----
    Star Wars: The Fallen Brother  Action,Fantasy,Sci-F  2017
    Starwatch                      Action,Drama,Sci-Fi   2017
    Star Wars: The Dark Reckoning  Sci-Fi                2017
    Star Trek: The Paradise Maker  Adventure,Animation,  2017


******************
Joins
******************

When you want to combine data from different tables, joins are used.  This is how to retrieve information on both actors and movies in the same query.  **Joins occur in the FROM clause**.  All the required tables are listed and the columns that should be used to join the rows are specified.  Recall the actors -- cast -- movies diagram from above.  Now it's labeled with the columns that join the entity and relationship tables.

.. image:: movies.actors.cast.er.diagram.with.primary.keys.png
    :width: 400px
    :align: center
    :height: 80px


Going back to the **Wonder Woman example**.  Here is a query that returns the actors by looking for the movie name.  The results are shown after the query.

.. code:: SQL

    sqlite> select mid, title, aid, name, role 
       ...> from movies join cast using(mid) join actors using (aid) 
       ...> where title like "wonder woman";


.. code:: 

    mid         title         aid         name        role                
    ----------  ------------  ----------  ----------  --------------------
    451279      Wonder Woman  2933757     Gal Gadot   ["Diana"]           
    451279      Wonder Woman  1517976     Chris Pine  ["Steve Trevor"]    
    451279      Wonder Woman  705         Robin Wrig  ["Antiope"]         
    451279      Wonder Woman  205063      Lucy Davis  ["Etta"]


Notice the joins in the from clause.   The first one is  

.. code:: SQL

    movies join cast using(mid)


This indicates that rows from movie should be combined with rows from cast **when they share the same mid value**.  In effect, this produces an intermediate table with the following columns: mid, title, year, genries, aid, role as can be seen in the following query.


.. code:: SQL

    sqlite> select * 
    from movies join cast using (mid) 
    limit 10;

.. code:: 

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


The second join is:

.. code:: SQL

    X join actors using (aid)
    

**where X is the result of the first join**.   This indicates that rows from the first join should be combined with rows from actors **when they share the same aid**.  Again, this has the effect of producing an intermediate table with one additional field, name.  

.. code:: SQL
	
	sqlite> select * 
	from movies join cast using (mid) join actors using (aid) 
	limit 10;


.. code:: 

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


To obtain the results we're interested in, sqlite searches the rows in the final intermediate table for those whose titles match "wonder woman".  
