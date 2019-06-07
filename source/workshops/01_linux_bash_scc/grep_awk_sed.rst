4. Grep/Awk/Sed
====================

Materials to download
-----------------------

1. `Linux word dictionary <https://raw.githubusercontent.com/BRITE-REU/programming-workshops/master/source/workshops/01_linux_bash_scc/files/cracklib-small.txt>`_
2. `Mary had a little lamb <https://raw.githubusercontent.com/BRITE-REU/programming-workshops/master/source/workshops/01_linux_bash_scc/files/mary-lamb.txt>`_
3. `BRITE students <https://raw.githubusercontent.com/BRITE-REU/programming-workshops/master/source/workshops/01_linux_bash_scc/files/BRITE_students.txt>`_

Grep
--------------------


Grep (**G**\lobal **R**\egular **E**\xpression **P**\rint”) finds a string in a given file or input.

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

- **Question for you:** How do you print the first name and faculty advisor of students whose last names contain the letter "u"?

SED
------------

SED stands for "**S**\tream **ED**\itor". It is a widely used text processing Linux tool.

.. code-block:: sh

      sed [options] [filename]

Usecases
************

- Read the fourth line of a text file:

.. code-block:: sh

      cat BRITE_students.txt | sed -n 4p

- Replace one word with another:

.. code-block:: sh

      cat mary-lamb.txt | sed 's/Mary/Maria/g'

- Remove the 1st, 2nd and 5th lines from a text file:

.. code-block:: sh

      sed -e '1d' -e '2d' -e '5d' BRITE_students.txt
