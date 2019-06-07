5. Bash scripting
====================

A bash script is a file containing commands that can run on the bash shell. They usually have the ``.sh`` extension.

A minimal example
---------------------

Create a file named ``myscript.sh`` and insert the code from the example below.

.. code-block:: sh

    #!/usr/bin/env bash
    # A simple bash script

    echo "Hello World"

.. note::

    ``#!`` is called the "shebang". It indicates the path to the program/interpreter that should be used to execute the script.

Execution
------------

The permissions on the script you created should be set so you can execute it with either ``./myscript.sh`` or ``bash myscript.sh``. Sometimes the file might not have appropriate permissions set. For example:

.. code-block:: sh

    $ ./myscript.sh
    bash: ./myscript.sh: Permission denied
    $ ls -l myscript.sh
    -rw-r--r-- 18 dkishore users 4096 Jun 10 09:12 myscript.sh

To run this file, the permissions on the script need to be changed to allow for execution: ``chmod +x myscript.sh``

Variables
-----------

.. code-block:: sh

    #!/bin/bash
    cp $1 $2
    # Verification
    echo Details for $2
    ls -lh $2

``$1`` and ``$2`` are the first and second arguments to the script.

Let's experiment here. First, create a file named ``variables_test.sh`` and copy-paste the code above there. Next, try calling this file with ``myscript.sh`` as the first argument, and ``myscript2.sh`` as the second argument. What happened?  

 .. note:: 

    * ``$0`` refers to the name of the bash script
    * ``$#`` refers to the number of arguments passed to the script
    * ``$@`` refers to all the arguments supplied
    * ``$?`` refers to the exit status of the most recent process

You can also set your own variables inside the script:

.. code-block:: sh

    #!/bin/bash
    myvariable=Hello
    anothervar=Fred
    echo $myvariable $anothervar
    sampledir=/etc
    echo $sampledir

.. note::

    * Use quotes if your value has a space. For example: ``myvar="Hello World!"``
    * When referring to or reading a variable we place a ``$`` sign before the variable name
    * When setting a variable we leave out the ``$`` sign
    * **Do not** use white-space around the ``=``

Input
------------

Run the command ``read`` and save the users response into the variable ``varname`` as shown below. Then create a new shell script with the code below and run it. Isn't it cool?

.. code-block:: sh

   #!/bin/bash
   # Ask the user for their name
   echo Hello, who am I talking to?
   read varname
   echo It\'s nice to meet you $varname

Conditional statements
---------------------------

Play with the scripts below. Do you understand what they are doing? If you don't understand, make sure to test them out and ask us questions!

1. ``if`` statements

.. code-block:: sh

   #!/bin/bash
   # Basic if statement
   if [ $1 -gt 100 ]
   then
       echo "Hey that\'s a large number."
       pwd
   fi

-  The square brackets in the if statement is a reference to the ``test`` command.
-  ``-gt`` is equivalent to >=. Similarly there are ``=``, ``!=`` and many more.
-  0 means TRUE and 1 means FALSE (fail).

2. ``if-else``

.. code-block:: sh

   #!/bin/bash
   # else example
   if [ $# -eq 1 ]
   then
       nl $1
   else
       nl /dev/stdin
   fi

3. ``if-else-if``

.. code-block:: sh

   #!/bin/bash
   # elif statements
   if [ $1 -ge 18 ]
   then
       echo "You may go to the party."
   elif [ $2 == 'yes' ]
   then
       echo "You may go to the party but be back before midnight."
   else
       echo "You may not go to the party."
   fi

Loops
--------------

1. ``while`` loop

.. code-block:: sh

   #!/bin/bash
   # Basic while loop
   counter=1
   while [ $counter -le 10 ]
   do
       echo $counter
       ((counter++))
   done
   echo "All done"

2. ``until`` loop (opposite of the ``while`` loop)

.. code-block:: sh

   #!/bin/bash
   # Basic until loop
   counter=1
   until [ $counter -gt 10 ]
   do
       echo $counter
       ((counter++))
   done
   echo "All done"

3. ``for`` loops

.. code-block:: sh

   #!/bin/bash
   # Basic for loop
   names='Stan Kyle Cartman Kenny'  # is one way to define lists
   for name in $names
   do
       echo $name
   done
   echo All done

4. Ranges and iterators

.. code-block:: sh

   #!/bin/bash
   # Basic range in for loop
   for value in {1..5}
   do
       echo $value
   done
   echo All done

.. note::

    You can have custom range by providing a step. For example: ``{10..0..2}``

Functions
--------------------

- Minimal example

.. code-block:: sh

   #!/bin/bash
   # Basic function
   print_something () {
       echo Hello I am a function
   }
   print_something

- Passing arguments

.. code-block:: sh

   #!/bin/bash
   # Passing arguments to a function
   print_something () {
       echo Hello $1
   }
   print_something Mars
   print_something Jupiter

- Returning values

Bash functions don’t allow for return values, but they do allow for a return status.

.. code-block:: sh

   #!/bin/bash
   # Setting a return status for a function
   print_something () {
       echo Hello $1
       return 5
   }
   print_something Mars
   print_something Jupiter
   echo The previous function has a return value of $?

- Variable scope

.. code-block:: sh

   #!/bin/bash
   # Experimenting with variable scope
   var_change () {
       local var1='local 1'
       echo Inside function: var1 is $var1 : var2 is $var2
       var1='changed again'
       var2='2 changed again'
   }
   var1='global 1'
   var2='global 2'
   echo Before function call: var1 is $var1 : var2 is $var2
   var_change
   echo After function call: var1 is $var1 : var2 is $var2

Results
---------

::

   Before function call: var1 is global 1 : var2 is global 2
   Inside function: var1 is local 1 : var2 is global 2
   After function call: var1 is global 1 : var2 is 2 changed again


