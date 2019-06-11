4. Grep/Awk/Sed
====================

Materials to download
-----------------------

1. `Mary had a little lamb <https://raw.githubusercontent.com/BRITE-REU/programming-workshops/master/source/workshops/01_linux_bash_scc/files/mary-lamb.txt>`_
2. `BRITE students <https://raw.githubusercontent.com/BRITE-REU/programming-workshops/master/source/workshops/01_linux_bash_scc/files/BRITE_students.txt>`_
3. `Geekfile <https://raw.githubusercontent.com/BRITE-REU/programming-workshops/master/source/workshops/01_linux_bash_scc/files/geekfile.txt>`_

Grep
--------------------


Grep (**G**\lobal **R**\egular **E**\xpression **P**\rint) finds a string in a given file or input.

.. code-block:: sh

    grep [options] [regexp] [filename]

Usecases
************

- Case-insensitive search (``grep -i``):

.. code-block:: sh

      grep -i 'mary' mary-lamb.txt


- Whole-word search (``grep -w``):

.. code-block:: sh

      grep -w 'as' mary-lamb.txt


- Inverted search (``grep -v``):

.. code-block:: sh

      grep -v ‘the’ mary-lamb.txt


- Print additional (trailing) context lines after match (``grep -A <NUM>``):

.. code-block:: sh

      grep -A1 'eager'  mary-lamb.txt


- Print additional (leading) context lines before match (``grep -B <NUM>``):

.. code-block:: sh

      grep -B2 'fleece'  mary-lamb.txt


- Print additional (leading and trailing) context lines before and after the match (``grep -C <NUM>``):

.. code-block:: sh

      grep -C3 'appear' mary-lamb.txt
      
      
Exercises
************

-  Display all the lines of the file **mary-lamb.txt** that do NOT contain the word *lamb*. 

- Display only those lines of the file **mary-lamb.txt** that contain the word *he* in them. The search should NOT be sensitive to case.

- Display only those lines of the file **mary-lamb.txt** which contain either *lamb* or *Mary* words in the them. The search should not be sensitive to case.    


AWK
--------------------

Named after the authors: Aho, Weinberger, Kernighan

.. code-block:: sh

      awk [options] [filename]

Usecases
************

- Print everything in the text file:

.. code-block:: sh

      awk '{print}' BRITE_students.txt

- Now, let's get the more specific. Let's ask for first names only:

.. code-block:: sh

      awk '{print $1}' BRITE_students.txt

- What if we want to see two columns at the same time (e.g. first and last names)?

.. code-block:: sh

      awk '{print $1" "$2}' BRITE_students.txt

- Now let's see what your info is (exact match):

.. code-block:: sh

      awk '$1=="Anastasia"' BRITE_students.txt

- How can we see a particular pattern in our cohort (e.g. students in Campbell lab)?

.. code-block:: sh

      awk '/Campbell/ {print $0}' BRITE_students.txt

- How many students are there whose name begins with "B"? 

.. code-block:: sh

      awk '/B/{++cnt} END {print "Count = ", cnt}' BRITE_students.txt

Exercise
************

- How do you print the first name and faculty advisor of students whose last names contain the letter *u* (file **BRITE_students.txt**)?


SED
------------

SED stands for "**S**\tream **ED**\itor". It is a widely used text processing Linux tool.

.. code-block:: sh

      sed [options] [filename]

Usecases
************

- Replacing or substituting string: ``sed`` command is mostly used to replace the text in a file. The below simple ``sed`` command replaces the word “unix” with “linux” in the file.

.. code-block:: sh

      sed 's/unix/linux/' geekfile.txt

Here the ``s`` specifies the substitution operation. The ``/`` are delimiters. The ``unix`` is the search pattern and the ``linux`` is the replacement string.

By default, the ``sed`` command replaces the first occurrence of the pattern in each line and it won’t replace the second, third, …occurrence in the line.

- Replacing the nth occurrence of a pattern in a line: Use the ``/1``, ``/2`` etc flags to replace the first, second occurrence of a pattern in a line. The below command replaces the second occurrence of the word ``unix`` with ``linux`` in a line.

.. code-block:: sh

      sed 's/unix/linux/2' geekfile.txt

- Replacing all the occurrence of the pattern in a line: The substitute flag ``/g`` (global replacement) specifies the ``sed`` command to replace all the occurrences of the string in the line.

.. code-block:: sh

      sed 's/unix/linux/g' geekfile.txt

- Replacing from nth occurrence to all occurrences in a line: Use the combination of ``/1``, ``/2``, etc. and ``/g`` to replace all the patterns from the nth occurrence of a pattern in a line. The following ``sed`` command replaces the third, fourth, fifth, … ``unix`` word with ``linux`` word in a line.

.. code-block:: sh

      sed 's/unix/linux/3g' geekfile.txt

- Replacing string on a specific line number: You can restrict the ``sed`` command to replace the string on a specific line number. An example is:

.. code-block:: sh

      sed '3 s/unix/linux/' geekfile.txt
      
The above ``sed`` command replaces the string only on the third line.

- Deleting lines from a particular file: ``sed`` command can also be used for deleting lines from a particular file. To Delete a particular line, e.g. 4 in this example:

.. code-block:: sh

      sed '4d' geekfile.txt
      
- To delete a last line:

.. code-block:: sh

      sed '$d' geekfile.txt
      
- To delete line from range 2 to 4:

.. code-block:: sh

      sed '2,4d' geekfile.txt

- To delete from 3d to last line:

.. code-block:: sh

      sed '3,$d' geekfile.txt


Exercise
************

- Replace word *Mary* with *Maria* in the file **mary-lamb.txt**.

- Remove the 1st, 2nd and 5th lines from the file **BRITE_students.txt**.




