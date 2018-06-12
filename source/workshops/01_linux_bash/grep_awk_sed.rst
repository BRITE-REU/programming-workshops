3. Grep/Awk/Sed
====================

Materials to download
**************************

1. `Linux word dictionary <https://github.com/BRITE-REU/programming-workshops/tree/master/source/workshops/01_linux_bash/files/cracklib-small.txt>`_
2. `Mary had a little lamb <https://github.com/BRITE-REU/programming-workshops/tree/master/source/workshops/01_linux_bash/files/mary-lamb.txt>`_


--------------------

Grep
********************

Grep (an acronym for “Global Regular Expression Print”), finds a string in a given file or input.

**Grep format:**

.. code-block:: sh

    grep [options] [regexp] [filename]


--------------------

**Grep usecases:**

1) Case-insensitive search (grep -i):

.. code-block:: sh

      grep -i 'mary' mary-lamb.txt


2) Whole-word search (grep -w):

.. code-block:: sh

      grep -w 'as' mary-lamb.txt


3) recursively search through sub-folders (grep -r <pattern> <path>):

.. code-block:: sh

      grep -r '456' /<your_working_directory>/


4) Inverted search (grep -v):

.. code-block:: sh

      grep -v ‘the’ mary-lamb.txt


5) Print additional (trailing) context lines after match (grep -A <NUM>):

.. code-block:: sh

      grep -A1 'School'  mary-lamb.txt


6) Print additional (leading) context lines before match (grep -B <NUM>):

.. code-block:: sh

      grep -B2 'School'  mary-lamb.txt


7) Print additional (leading and trailing) context lines before and after the match (grep -C <NUM>):

.. code-block:: sh

      grep -C3 'School' mary-lamb.txt


8) Print the filename for each match (grep -H <pattern> filename):

.. code-block:: sh

      grep -H 'School' mary-lamb.txt


--------------------

**Regexp or regular expression:**

Regexp is how we specify that we find to see a particular pattern (it could be words or characters). 


* The period ``.`` matches any single character.
* ``?`` when that the previous patten could be optional, it will only be matched once.
* ``*`` when that the previous pattern could be matched zero or more times.
* ``+`` when the preceding pattern will be matched one or more times.

.. code-block:: sh

      grep 'M.a' mary-lamb.txt

