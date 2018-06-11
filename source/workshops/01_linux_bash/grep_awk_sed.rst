3. Grep/Awk/Sed
====================

Materials to use
********************

Files for ``grep`` tutorial

`Linux word dictionary <https://github.com/BRITE-REU/programming-workshops/tree/master/source/workshops/01_linux_bash/files/cracklib-small.txt>`_

`Mary had a little lamb <https://github.com/BRITE-REU/programming-workshops/tree/master/source/workshops/01_linux_bash/files/mary-lamb.txt>`_



Grep (an acronym for “Global Regular Expression Print”), finds a string in a given file or input.
********************

Grep format:
********************
grep [options] [regexp] [filename]
--------------------

Regexp or regular expression:
********************
Regexp is how we specify that we find to see a particular pattern (it could be words or characters). 

.. note::
      Case-insensitive search (grep -i):

.. code-block:: sh

      grep -i 'mary' mary-lamb.txt
--------------------

.. note::
      Whole-word search (grep -w):

.. code-block:: sh

      grep -w 'as' mary-lamb.txt
--------------------

.. note::
      recursively search through sub-folders (grep -r <pattern> <path>):
.. code-block:: sh

      grep -r '456' /<your_working_directory>/
--------------------

.. note::
      Inverted search (grep -v):

.. code-block:: sh

      grep -v ‘the’ mary-lamb.txt
--------------------

.. note::
      Print additional (trailing) context lines after match (grep -A <NUM>):

.. code-block:: sh

      grep -A1 'School'  Mary_Lamb_lyrics.txt
--------------------


      6) Print additional (leading) context lines before match (grep -B <NUM>):

CL > grep -B2 'School'  Mary_Lamb_lyrics.txt

      7) Print additional (leading and trailing) context lines before and after the match (grep -C <NUM>):

CL > grep -C3 'School' Mary_Lamb_lyrics.txt

     8) Print the filename for each match (grep -H <pattern> filename):
CL > grep -H 'School' Mary_Lamb_lyrics.txt

 Now, let’s look at single regular expressions:

* The period ``.`` matches any single character.
* ``?`` when that the previous item could be optional, it will only be matched once.
* when that the previous item could be matched zero or more times.
+ when the preceding item will be matched one or more times.
{n} when the previous pattern is matched exactly n times, while {n,} means the patten is matched n or more times. {n,m} means that the previous item is matched at least n times, but not more than m times. {,m}means that the previous pattern is , at the most, m times.

CL > grep 'M.a' Mary_Lamb_lyrics.txt
