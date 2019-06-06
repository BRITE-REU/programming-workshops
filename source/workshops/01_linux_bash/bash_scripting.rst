7. Bash scripting
====================

A bash script is a file containing commands that can run on the bash shell. They usually have the ``.sh`` extension.

A minimal example
**********************

.. code-block:: sh

    #!/usr/bin/env bash
    # A simple bash script

    echo "Hello World"

.. note::

    ``#!`` is called the "shebang". It indicates the path to the program/interpreter that would be used to execute the script.
    
Please create a file named myscript.sh and copy-paste the code from the example above.

--------------------

Execution
********************
The permissions on the script you created should be set so you can execute it. The file can be executed either as ``./myscript.sh`` or ``bash myscript.sh``. Try that.

However, sometimes the file might not have an appropriate permissions set. For example:

.. code-block:: sh

    $ ./myscript.sh
    bash: ./myscript.sh: Permission denied
    $ ls -l myscript.sh
    -rw-r--r-- 18 dkishore users 4096 Jun 10 09:12 myscript.sh

To be able to run the file, the permissions on the script need to be changed to allow for execution - ``chmod +x myscript.sh``

--------------------

Variables
********************

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

    * Use quotes if your value has a space. Eg: ``myvar="Hello World!"``
    * When referring to or reading a variable we place a ``$`` sign before the variable name
    * When setting a variable we leave out the ``$`` sign
    * **Do not** use white-space around the ``=``
 
--------------------

Input
********************

Run the command read and save the users response into the variable ``varname``.

.. code-block:: sh

   #!/bin/bash
   # Ask the user for their name
   echo Hello, who am I talking to?
   read varname
   echo It\'s nice to meet you $varname

Create a new shell script with the code above and run it. Isn't it cool?


--------------------

Arithmetic
********************


1. ``let``

.. code-block:: sh

   #!/bin/bash
   # Basic arithmetic using let
   let a=5+4
   echo $a # 9
   let "a = 5 + 4"
   echo $a # 9
   let a++
   echo $a # 10
   let "a = 4 * 5"
   echo $a # 20
   let "a = $1 + 30"
   echo $a # 30 + first command line argument

2. ``expr``

.. code-block:: sh

   #!/bin/bash
   # Basic arithmetic using expr
   expr 5 + 4 # 9
   expr "5 + 4" # 5 + 4
   expr 5+4 # 5+4
   expr 5 \* $1
   expr 11 % 2
   a=$( expr 10 - 3 )
   echo $a # 7

3. ``double parentheses``

.. code-block:: sh

   #!/bin/bash
   # Basic arithmetic using double parentheses
   a=$(( 4 + 5 ))
   echo $a # 9
   a=$((3+5))
   echo $a # 8
   b=$(( a + 3 ))
   echo $b # 11
   b=$(( $a + 4 ))
   echo $b # 12
   (( b++ ))
   echo $b # 13
   (( b += 3 ))
   echo $b # 16
   a=$(( 4 * 5 ))
   echo $a # 20


--------------------

If statements
********************

1. ``If`` statements

.. code-block:: sh

   #!/bin/bash
   # Basic if statement
   if [ $1 -gt 100 ]
   then
       echo "Hey that\'s a large number."
       pwd
   fi

-  The square brackets in the if statement is a reference to the ``test`` command.
-  ``-gt`` is equivalent to >=. Similarly there are ``!``, ``-n``, ``-z``, ``=``, ``!=`` and many more.
-  Can be alternatively used as ``test 001 = 1``. (This won’t return anything you can test the exit status using ``$?``. 0 means TRUE and 1 means FAILURE).

2. ``If-else``

.. code-block:: sh

   #!/bin/bash
   # else example
   if [ $# -eq 1 ]
   then
       nl $1
   else
       nl /dev/stdin
   fi

3. ``If-else-if``

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

4. ``Case`` statements

.. code-block:: sh

   #!/bin/bash
   # case example
   case $1 in
       start)
       echo starting
       ;;
       stop)
       echo stoping
       ;;
       restart)
       echo restarting
       ;;
       *)
       echo "don\'t know"
       ;;
   esac

.. note::

    The ``;;`` are used as break statements


--------------------

Loops
********************

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

2. ``until`` loop

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

The ``until`` loop is the exact opposite of the ``while`` loop

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

4. Ranges and Iterators

.. code-block:: sh

   #!/bin/bash
   # Basic range in for loop
   for value in {1..5}
   do
       echo $value
   done
   echo All done

.. note::

    1. You can have custom range by providing a step. Eg. ``{10..0..2}``
    2. GNU ``seq`` can also be used to create custom iterators. Eg. ``seq 10 -2 0``


--------------------

Functions
********************

* Simple example

.. code-block:: sh

   #!/bin/bash
   # Basic function
   print_something () {
       echo Hello I am a function
   }
   print_something

* Passing arguments

.. code-block:: sh

   #!/bin/bash
   # Passing arguments to a function
   print_something () {
       echo Hello $1
   }
   print_something Mars
   print_something Jupiter

* Return values

Bash functions don’t allow for return values however they allow for a return status

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

* Variable scope

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

``result``

::

   Before function call: var1 is global 1 : var2 is global 2
   Inside function: var1 is local 1 : var2 is global 2
   After function call: var1 is global 1 : var2 is 2 changed again


