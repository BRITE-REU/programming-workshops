3. Grep/Awk/Sed
====================

Materials to download
**************************

1. `Linux word dictionary <https://github.com/BRITE-REU/programming-workshops/tree/master/source/workshops/01_linux_bash/files/cracklib-small.txt>`_
2. `Mary had a little lamb <https://github.com/BRITE-REU/programming-workshops/tree/master/source/workshops/01_linux_bash/files/mary-lamb.txt>`_
3. `BRITE students <https://github.com/BRITE-REU/programming-workshops/blob/master/source/workshops/01_linux_bash/files/BRITE_students.txt>`_

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


3) Inverted search (grep -v):

.. code-block:: sh

      grep -v ‘the’ mary-lamb.txt


4) Print additional (trailing) context lines after match (grep -A <NUM>):

.. code-block:: sh

      grep -A1 'eager'  mary-lamb.txt


5) Print additional (leading) context lines before match (grep -B <NUM>):

.. code-block:: sh

      grep -B2 'fleece'  mary-lamb.txt


6) Print additional (leading and trailing) context lines before and after the match (grep -C <NUM>):

.. code-block:: sh

      grep -C3 'appear' mary-lamb.txt


AWK
********************
awk [options] [filename]

Named after the authors: Aho, Weinberger, Kernighan


* Print everything in the text file:

.. code-block:: sh

      awk '{print}' BRITE_students.txt
--------------------

* Now, let's get the more specific. Let's ask for first names only:

.. code-block:: sh

      awk '{print $1}' BRITE_students.txt
--------------------

* What if we want to see two columns at the same time, let's say first and last names?

.. code-block:: sh

      awk '{print $1" "$2}' BRITE_students.txt
--------------------

* Now let's see what your info is (exact match):

.. code-block:: sh

      awk '$1=="Anastasia"' BRITE_students.txt
--------------------


* How can we see a particular pattern in our cohort (e.g. students in Campbell lab)?

.. code-block:: sh

      awk '/Campbell/ {print $0}' BRITE_students.txt
--------------------

* Question for you: How do you print the first name and faculty advisor of students whose last names contain the letter "u"?

.. code-block:: sh

      <try it out on your terminal>
--------------------

* How many students are there whose name begins with "B"? 

.. code-block:: sh

      awk '/B/{++cnt} END {print "Count = ", cnt}' BRITE_students.txt
--------------------


SED
********************
sed [options] [filename]

SED  stands for "Stream EDitor". It is a widely used text processing Linux tool. 

* I want to read the fourth line of a text file:

.. code-block:: sh

      cat BRITE_students.txt | sed -n 4p
--------------------

* What if we want to replace one word with another:

.. code-block:: sh

      cat mary-lamb.txt | sed 's/Mary/Maria/g'
--------------------

* Let's remove the 1st, 2nd and 5th lines from a text file:

.. code-block:: sh

      sed -e '1d' -e '2d' -e '5d' BRITE_students.txt
--------------------


