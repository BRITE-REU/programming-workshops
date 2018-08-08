
Python 3
========

Welcome to this supa-quick, supa-dope Python 3 tutorial. Python is a
general purpose programming language created in the early 1990s by Guido
van Rossum. Today, Python is one of the most popular languages and
enjoys particular success in statistics/data science and scientific
computing. This tutorial will serve as a brief introduction to the
capabilities of Python and its syntax.

Getting Started
---------------

To get started we will likely need to install Python. While there are
many ways to install Python on your system, I recommend using the
Anaconda Distribution (https://www.continuum.io/downloads). Anaconda is
a cross-platform (OSX, Linux, Windows) distribution manager that
simplifies installing and managing packages. While this tutorial only
makes use of the base Python packages, installing via Anaconda will also
install several scientific libraries that you will likely find useful
later. Further, Jupyter is also included in the Anaconda install, giving
you access to Jupyter Notebooks.

Interacting with Python
~~~~~~~~~~~~~~~~~~~~~~~

Once Python is installed on our system, there are two main ways we can
interact with Python: 1) opening a python interpreter using the
terminal, 2) creating a python script file.

Accessing a Python Interpreter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To access a Python Interpreter simply open a terminal window, and type
'**python**'. This will create an interactive Python session where we
can write and test Python code. If you are on a Windows machine, instead
of the normal command prompt, barring specific installation steps, you
will need to open an Anaconda Prompt. This is a special terminal that
will give you access to your Python/Anaconda installation.

Writing a Python Script
^^^^^^^^^^^^^^^^^^^^^^^

A python script is a file with the '.py' extension and can be written
using your favorite text editor or IDE. If you have Anaconda installed
on your computer, you will have access to the Sypder IDE, which is a
popular and useful IDE for writing scripts in Python. A python file can
be run by typing '**python *script\_name*.py**' into the terminal.

Basic Python Variables and Operations
-------------------------------------

Mathematical Operators
~~~~~~~~~~~~~~~~~~~~~~

Unsurprisingly, Python can do math! The basic mathematic operators are
**+**, **-**, **\***, and **\\** for addition, subtraction,
multiplication, and division

.. code-block:: python

    # The print function takes a value or expression and displays the output to
    # the screen. The hash symbol denotes the proceeding text as a comment, and
    # thus is not evaluated by the interpreter. 
    
    print(2 + 2)
    print(2 - 2)
    print(2*2)
    print(2/2)


::

    4
    0
    4
    1.0


.. code-block:: python

    # Negative values are demonstrated with a '-'
    print(-3 + 2)


::

    -1


.. code-block:: python

    # Exponents use the double star operator '**'
    print(2**3)


::

    8


.. code-block:: python

    # The percent symbol, '%', is used as the modulo operator for calculating
    # remainders.
    print(6 % 4)  # 6 = 4*1 + 2


::

    2


.. code-block:: python

    # Mathematical expressions follow the order of operations.
    print((2+3)*(-1)**2/2)


::

    2.5


Mathematical Variables
~~~~~~~~~~~~~~~~~~~~~~

There are two basic numerical data types in Python: integers and
floating point numbers. Integers are whole number, signed or unsigned,
while floating point numbers contain decimal values.

.. code-block:: python

    # The data type of a value can be determined using the 'type()' function.
    print(type(2))
    print(type(2.0))


::

    <class 'int'>
    <class 'float'>


.. code-block:: python

    # Values in Python can be assigned to variables with different names for
    # later access. Variable assignment is done using the '=' symbol.
    x = 2
    y = 3.0
    print(x)
    print(y)
    print(y*x)


::

    2
    3.0
    6.0


.. code-block:: python

    # Variables can be cast to compatible data types using the desired data
    # type function.
    print(y)
    print(type(y))
    
    z = int(y)
    print(z)
    print(type(z))


::

    3.0
    <class 'float'>
    3
    <class 'int'>


.. code-block:: python

    # While we instantiated 'z' using 'y' and then modified 'z', the value 'y'
    # remains unchanged.
    print(y)


::

    3.0


Boolean Values and Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Boolean values are values that determine the truth value of a specific
statement. In Python, these take the form the key words, **True** and
**False**. There are several useful operators such as **<**, **>**,
**<=**, **>=**, and **==** for excessing relationships between numerical
values. Each of these operators returns a boolean value representing the
truth value of the given statement. All the previously listed operators
expect to be sandwiched between two values, one to the left and one to
the right, and are evaluated left to right.

.. code-block:: python

    # The less than operator '<'
    x = 3
    y = 6
    z = 10
    print(x < 5)
    # The greater than operator '>'
    print(z > x)
    # the less than or equal to operator '<='
    print(x <= 5)
    print(x <= 3)
    # the greater than or equal to operator '>='
    print(x >= 5)
    print(x >= 3)
    # the equality operator '=='
    print(y == 6)
    print(y == 7)


::

    True
    True
    True
    True
    False
    True
    True
    False


Boolean statements (e.g. 3 < 5) can be strung together using and
maniuplated using the **and**, **or**, and **not** keywords. All
keywords follow their formal logic definitions: the **and** keyword is
true if both statements are true, the **or** keyword is true if one
of the statements is true, and **not** negates the original truth value of a
given statement.

.. code-block:: python

    print(y > x and y < z)
    print(y < x or y < z)
    print(not y > x)


::

    True
    True
    False


String Variables and Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Strings are data types used to represent text data. They can be
instantiated by placing expressions between single (**'expression'**)
or double (**"expression"**) quotes.

.. code-block:: python

    string_1 = 'dog'
    string_2 = "cat"
    print(string_1)
    print(string_2)


::

    dog
    cat


.. code-block:: python

    # strings can be concatenated using the '+' operator
    string_3 = string_2 + string_1
    print("What do you mean you've never seen a " + string_3 + "?!")


::

    What do you mean you've never seen a catdog?!


String Substitution
^^^^^^^^^^^^^^^^^^^

Values can be substituted into a string using string substitution. This
is done using the **.format()** method available to string objects.

.. code-block:: python

    # the second single or double quote mark can be escaped using a backslash: \
    statement = 'What do you mean you\'ve never seen a {0}?!'
    print(statement.format(string_3))


::

    What do you mean you've never seen a catdog?!


.. code-block:: python

    # strings be evaluated using boolean operators
    print(string_1 == string_2)  # are they the same string?
    print(string_1 < string_2)  # is string_1 shorter than string_2?
    print(string_3 > string_2)  # is string_3 longer than string_2?
    
    # strings are case sensitive
    print('cat' == 'Cat')


::

    False
    False
    True
    False


.. code-block:: python

    # String case can be changed using the .upper() and .lower() string methods.
    
    print(string_2.upper())
    print(string_2.upper() == 'CAT')
    print(string_2 == 'CAT'.lower())


::

    CAT
    True
    True


.. code-block:: python

    # The length of a string can be accessed using the built-in len() function.
    print("The string '{0}' is {1} characters long.".format(string_1, len(string_1)))


::

    The string 'dog' is 3 characters long.


.. code-block:: python

    # Characters in a string can be assessed by position.
    # Python indexing starts at 0.
    
    print("The first character in '{0}' is: {1}.".format(string_1, string_1[0]))
    
    # Due to zero indexing, the last element is the n - 1 element.
    print("The last character in '{0}' is: {1}.".format(string_1,
                                                        string_1[len(string_1) - 1]))
    
    # Negative indexing also works (e.g. -1 accesses the last element):
    print("The second to last character in '{0}' is: {1}.".format(string_1,
                                                                  string_1[-2]))


::

    The first character in 'dog' is: d.
    The last character in 'dog' is: g.
    The second to last character in 'dog' is: o.


.. code-block:: python

    # If a string is of a numerical value, the string can be converted to an
    # integer or float.
    
    float_string = '2.5'
    int_string = '2'
    print_msg = 'Converted {0} to {1} from type {2} to type {3}'
    
    int_num = int(int_string)
    print(print_msg.format(int_string, int_num, type(int_string),
                           type(int_num)))
    
    float_num = float(float_string)
    print(print_msg.format(float_string, float_num, type(float_string),
                           type(float_num)))
    
    # Likewise, numbers can easily be converted to strings
    num = 3.5
    print(print_msg.format(num, str(num), type(num), type(str(num))))
    
    # It is important to note that if a string represents a floating point
    # number, Python is unable to convert that number to an integer.


::

    Converted 2 to 2 from type <class 'str'> to type <class 'int'>
    Converted 2.5 to 2.5 from type <class 'str'> to type <class 'float'>
    Converted 3.5 to 3.5 from type <class 'float'> to type <class 'str'>


Container Variables and Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are three main container data structures in base Python: lists,
sets, and dictionaries.

Lists
~~~~~

Lists are arbitrarily long collections of objects. The are instantiated
by placing comma-separated values within square bracks **[]**.

.. code-block:: python

    my_list = [1, 2, 3, 4]
    print(my_list)


::

    [1, 2, 3, 4]


.. code-block:: python

    # Like strings, elements within lists can be accessed via their position. 
    print('The first element of my_list is {0}'.format(my_list[0]))


::

    The first element of my_list is 1


.. code-block:: python

    # Access and assign list value by accessing an indexed element,
    # and assigning it to a new value.
    new_list = [1, 2, 3]
    print(new_list)
    new_list[2] = 5
    print(new_list)


::

    [1, 2, 3]
    [1, 2, 5]


.. code-block:: python

    # A range of objects within a list can be select using ':'
    print(my_list[1:3])
    
    # Another ':' can be used to define step size for the selection range.
    print(my_list[1:4:2])


::

    [2, 3]
    [2, 4]


.. code-block:: python

    # element membership within a list can be tested using the 'in' keyword.
    
    print(5 in my_list)
    print(3 in my_list)


::

    False
    True


.. code-block:: python

    # The length of a list is also assessed using the len() function.
    print(len(my_list))


::

    4


.. code-block:: python

    # An empty list can be constructed using empty square brackets
    x = []
    print(len(x))
    print(x)


::

    0
    []


.. code-block:: python

    # Elements can added onto the end of a list using the .append() list method.
    
    x.append('Hi')
    print(x)


::

    ['Hi']


.. code-block:: python

    # Lists can have mixed-type variables (e.g. a list can contain both integers
    # and strings)
    my_list.append('String!')
    print(my_list)


::

    [1, 2, 3, 4, 'String!']


.. code-block:: python

    # incremented lists up to a defined number can be created using the built-in
    # range() function. The range function outputs a 'range' object. However, it
    # can be casted to a list using the list() function.
    
    n = 10
    # Create list of length 10 ranging from 0 - 9
    range_list = list(range(n))
    print(range_list)
    
    # The list doesn't need to start at 0
    m = 3
    print(list(range(m, n)))
    
    # Likewise, we can specify our own step size
    step = 2
    print(list(range(m, n, step)))


::

    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    [3, 4, 5, 6, 7, 8, 9]
    [3, 5, 7, 9]


.. code-block:: python

    # Lists can be concatenated using the '+' operator
    string_list = ['I', 'Love', 'Dogs']
    print(my_list + string_list)


::

    [1, 2, 3, 4, 'String!', 'I', 'Love', 'Dogs']


Sets
~~~~

Sets are container objects that can only contain unique elements. If you
are familiar with Set Theory in Mathematics, Python sets are simply an
implementation of such a structure. Sets are constructed passing a list
to the 'set()' function or constructing via **{ }**.

.. code-block:: python

    # Sets can only contain unique elements.
    set_1 = set([1, 1, 2, 2, 3, 4, 5])
    print(set_1)
    
    set_2 = {3, 4, 6, 7, 7, 8 , 9, 10}
    print(set_2)


::

    {1, 2, 3, 4, 5}
    {3, 4, 6, 7, 8, 9, 10}


.. code-block:: python

    # add elements to a set using the .add set method
    set_1.add(6)
    print(set_1)


::

    {1, 2, 3, 4, 5, 6}


.. code-block:: python

    # still only unique elements
    set_1.add(5)
    print(set_1)


::

    {1, 2, 3, 4, 5, 6}


.. code-block:: python

    # Remove elements using the .remove set method
    set_1.remove(6)
    print(set_1)


::

    {1, 2, 3, 4, 5}


.. code-block:: python

    # retrieve union of two sets using the .union set method
    print(set_1.union(set_2))
    
    # retrieve set difference of two sets using the .difference method
    print(set_2.difference(set_1))
    
    # retrieve set intersection using the .intersection method
    print(set_1.intersection(set_2))


::

    {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
    {8, 9, 10, 6, 7}
    {3, 4}


.. code-block:: python

    # Unlike lists, sets are unordered and thus don't support indexing.
    print(set_1[0])


::


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-37-c17aa407af1e> in <module>()
          1 # Unlike lists, sets are unordered and thus don't support indexing.
    ----> 2 print(set_1[0])
    

    TypeError: 'set' object does not support indexing


Dictionaries
~~~~~~~~~~~~

Dictionaries are collections with key-value pairs. They are constructed
by matching a key with an associated value. The value can then be
retrieved at a later time using the provided key. In python, keys and
values can be of arbitrary data types. Similar to sets, dictionaries are
consructed using curly brackets **{ }**, though each entry must follow
the **key:value** syntax.

.. code-block:: python

    # Construct dictionaries by separating keys and values using ':'
    # Separate key-value pairs using ','
    my_dict = {'a': 1, 'b': 2, 'c': 3}
    print(my_dict)


.. code-block:: python

    # Look up values using keys
    my_dict['a']


.. code-block:: python

    # Create an empty list using {}
    empty_dict = {}
    
    # add elements by 'indexing' by a given key and provided an associated
    # value as an assignment.
    empty_dict['key'] = 'value'
    print(empty_dict)

.. code-block:: python

    # Retrieve keys of a dictionary using .keys() dictionary method
    print(my_dict.keys())


.. code-block:: python

    # Retrieve values of a dictionary using .values() dictionary method
    print(my_dict.values())



If, Else, and Elif Statements
=============================

Sometimes when writing a program, you need to execute different code
snippets depending on the value of a specific variable. In Python, we do
this by employing the three boolean key words: **if**, **else**, and
**elif**

An **if** statement uses if the following syntax:

**if (boolean statement): **

::

    run this code

.. code-block:: python

    # if statements must be followed by a colon.
    # Likewise, the next line MUST be indented using either a tab or 4 spaces.
    if True:
        print("It's true!")
        
    x = 3
    if (x < 10):
        print('{0} is less than 10'.format(x))

.. code-block:: python

    # An else statement must follow an if statement and is executed
    # if the statement in the if statement is not met.
    x = 11
    if (x < 10):
        print('{0} is less than 10'.format(x))
    else:
        print('{0} is greater than or equal to 10'.format(x))

.. code-block:: python

    # Like an else statement, an elif statement must follow a preceding if
    # statement. However, like an if statement, an elif must also have its own
    # boolean statement that must be met in order for its snippets to be run.
    
    if (x < 10):
        print('{0} is less than 10'.format(x))
    elif (x < 15):
        print('{0} is greater than 9, but less than 15'.format(x))
    else:
        print('{0} is greater than 14'.format(x))

Iteration and Looping
=====================

While programming, it is common you will want to execute a code snippet
multiple times, or execute the same line over a set of values. For this,
we use looping. There are two different types of loops we can use in
Python: **for** loops and **while** loops. **For** loops iterate through
a set of values; a **while** loop iterates until a specific condition is
met.

For loops
---------

For loops employ the following syntax:

**for** each **in** list:

::

    run code

The variable **each** is defined in the loop statement. Similarly, the
variable **list** can be any iterable data type: not just a list. Like
**if**, **else**, and **elif** statements, loop statements end with a
colon and must be followed by a new line and an indentation.

.. code-block:: python

    # iterate through a list
    my_list = [1, 'hi', 'yellow', 'pizza', 4.5]
    for each in my_list:
        print(each)

.. code-block:: python

    # use the range() function to iterate through integer values
    for i in range(5):
        print(i)

Nested For Loops
----------------

We can nest loops within other loops for loop-ception. In a nested loop,
the first loop will run with the first value specified by the iterator
(e.g. i = 0) until the inner loop gone to completion (e.g. executed for
j =0 and j = 1). Once the inner loop is completed, the outer loop then
moves on to the next value, and the process is repeated.

.. code-block:: python

    for i in range(5):
        for j in range(2):
            print('(i={0}, j={1})'.format(i, j))

While Loops
-----------

While loops execute until a boolean statement returns **False**. While
loops employ the following syntax:

**while** boolean\_statement:

::

    execute code

.. code-block:: python

    count = 0
    while count < 5:
        print(count)
        count += 1  # the += operator increments the value of a variable by
                    # the right value

Nested While Loops
------------------

Like for loops, while loops can also be nested; however, in order to
fully iterate through each loop, values used in the boolean statement in
the inner loop must be set in the outer loop. This ensures the value
will be reset for the next iteration in the inner loop.

.. code-block:: python

    count = 0
    while count < 3:
        num = 5
        while num > 3:
            print('num: ' + str(num))
            num -= 1  # the -= operater decrements a variable by the right value.
        print('count: ' + str(count))
        count += 1

Functions
---------

It often a good idea to modularize your programming. That is, break your
code into smaller parts that can be run together to complete your task.
This is often performed by declaring functions. In Python, functions
take a defined set of inputs, perform some set of operations using the
inputs, and likely outputs some value. Functions are defined using the
following syntax:

**def** function\_name(input\_1, ...)\ **:**

::

    run code

Like loops and control statements, function definitions end with a colon
followed by a new line and an indentation.

.. code-block:: python

    def add(x, y):
        return(x + y)
    
    print(add(1, 2))

.. code-block:: python

    # It is common to have doc-strings, denoted by three sets of quotation marks, 
    # after a function definition to define the use of the function.
    def multiply(x, y):
        """
        Multiplies two numbers together.
        
        Arguments:
            x (float or int): a numeric value.
            y (float or int): a numeric value.
            
        Returns:
            (float or int): the product of `x` and `y`.
        """
        return(x*y)
    
    print(multiply(3, 2))

.. code-block:: python

    # It is possible to include optional parameters in functions.
    # These are defined by setting an arguments name and giving
    # a default value using '='
    
    def increment(x, step=1):
        """
        Increments a value by specified value.
        
        Arguments:
            x (float or int): a numeric value.
            step (float, optional): a numeric value to increment `x` by. 
                Default value is 1.
        Returns:
            (float or int): sum of `x` and `step`.
        """
        return(x + step)
    print(increment(2))
    print(increment(2, 3))

Scope
-----

When discussing functions, it is important to also talk about the
*scope* of a variable. The scope of a variable is the environment in
which the variable is defined. If a variable is defined within a
function, it's scope is local and unique to that function: the variable
cannot be accessed outside of the function. If a variable is defined
outside of a function, at the first indentation level, the scope is
global: the variable can be accessed anywhere within the Python file.

.. code-block:: python

    global_var = 20
    def scope_function():
        """Scope example."""
        local_var = 3
        print(global_var + local_var)  # global_var has global scope

.. code-block:: python

    # local_var was defined only within scope_function(). Thus,
    # it does not exist outside of the function.
    print(local_var)

File Input and Output.
----------------------

Often when writing a program, it is necessary to read or write to a
file. Reading and writing can be done in a variety of ways and we'll go
over the most useful here.

Reading a file
~~~~~~~~~~~~~~

To read a file, we must first create a connection to the file. The most
basic way to do this is with the **open** command and utilize the
**readline** io method.

.. code-block:: python

    # The open command creates a TextIOWrapper object that is used to read
    # lines in a file. The first argument in the file to open, while the 
    # second argument specifies the object should be in "read-mode"
    
    read_file = open('input_file.txt', 'r')  # open the file
    file_string = ""
    line = read_file.readline()  # read a line using the readline TextIOWrapper method.
    while len(line) > 0:  # read lines until no lines are left in the file.
        file_string += line
        line = read_file.readline()
    print(file_string)
    read_file.close()  # close the connection to the file.

Using *with* to simplify file reading
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The above method requires we create a separate file object and remember
to open and close it. This can be simplified by using the **with** and
*as* keywords:

.. code-block:: python

    with open('input_file.txt') as f:
        for line in f:
            print(line)

Writing Files
~~~~~~~~~~~~~

We write to files analagous to the way we first read a file: creating a
connection, iterating through the lines we want to write, and finally
closing the file.

.. code-block:: python

    write_list = ['This is a line',
                  'This is also a line.',
                  'In case you didn\'t know,',
                  'You can have line breaks',
                  'in between list elements',
                  'and really any bounded element.']
    
    f = open('output_file.txt', 'w')  # the 'w' parameter specifies "write-mode"
    for each in write_list:
        f.write(each)
    f.close()  # Look in your present working directory and you'll notice an output_file.txt file.

Importing Modules
-----------------

In Python, a module is an external library that provides functionality
that extends past the built-in functionality. However, there are several
standard libraries/modules that are included in the base Python install,
such as **math**, **sys**, **os** and other modules. These, and any
other module, must be brought into the python environment using the
**import** keyword.

On a basic import, any method, data structure, or value provided by the
module must be accessed by first appending the module name to the method
(e.g. to use the **sin** function in the **math** module, we type
**math.sin**)

.. code-block:: python

    import math
    # find the sin of 1, 0, and pi
    print(math.sin(1))
    print(math.sin(0))
    print(math.sin(math.pi))

It is possible to import specifc methods or sub-modules from libraries.
This is done by combining the **from** keyword with the **import**
keyword. Depending on the level of import, the syntax for accessing the
imported methods changes.

.. code-block:: python

    from math import cos
    print(cos(math.pi))  # no `math.cos` necessary because we imported
                         # `cos` directly.

.. code-block:: python

    from os import path
    # import 'path' submodule from 'os' module to gain access to 'realpath'
    # method. When executing, os.path.realpath' not necessary because 'path'
    # sub-module imported. However, path.realpath necessary because 'realpath'
    # is in the 'path' sub-module.
    print(path.realpath('input_file.txt'))  

.. code-block:: python

    # You can re-name modules using the 'as' keyword on import
    import math as m
    print(m.pi)

Conclusion
----------

This concludes our brief introduction to Python 3. This document simply
serves as a primer to first getting acquainted with the syntax and data
structures in Python. Many concepts, techniques, and capabilities were
left out. Feel free to explore more of Python's capabilities on your own
if you so desire. Looking into external libraries such as **numpy** and
**scipy** will be incredibly beneficial for anyone looking to continue
to perform numerical/data analysis in Python.
