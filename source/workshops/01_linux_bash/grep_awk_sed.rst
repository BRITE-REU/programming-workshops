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
* ``?`` when the previous patten could be optional, it will only be matched once.
* ``*`` when the previous pattern could be matched zero or more times.

.. code-block:: sh

      grep 'M.a' mary-lamb.txt
      grep 'M*y' Mary_Lamb_lyrics.txt 
--------------------


AWK:
********************
awk [options] [filename]

Named after the authors: Aho, Weinberger, Kernighan


* Print everything in the text file:

.. code-block:: sh

      awk '{print}' BRITE_students.txt
--------------------

* Now, let's get the more specific. Let's ask for names only:

.. code-block:: sh

      awk '{print $1}' BRITE_students.txt
--------------------

* What if we want to see two columns at the same time, let's say name and GPA?

.. code-block:: sh

      awk '{print $1" "$3}' BRITE_students.txt
--------------------

* Now what let's see what your info is (exact match):

.. code-block:: sh

      awk '$1=="Ali"' BRITE_students.txt
--------------------


* How can we see a particular pattern in our cohort (not an exact match):

.. code-block:: sh

      awk '/Kat/ {print $0}' BRITE_students.txt
--------------------

* Question for you: How do you print the name and favorite sport of students whose names contain the letter "u"?

.. code-block:: sh

      <insert code here>
--------------------

* How many students are there whose name begins with "Kat"? 

.. code-block:: sh

      awk '/Kat/{++cnt} END {print "Count = ", cnt}' BRITE_students.txt
--------------------

* You could also run loops in awk, print all :

.. code-block:: sh

      awk 'BEGIN {
   sum = 0; for (i = 0; i < 20; ++i) {
      sum += i; if (sum > 50) exit(10); else print "Sum =", sum 
   } 
}'
--------------------


SED:
********************
sed [options] [filename]

SED  stands for "Stream EDitor". It is a widely used text processing Linux tool. 

* I want to read the first three lines of a text file:

.. code-block:: sh

      cat BRITE_students.txt | sed -n 3p
--------------------

* What if we want to replace one word with another:

.. code-block:: sh

      cat mary-lamb.txt | sed 's/Mary/Maria/g'
--------------------

* Let's remove the 1st, 2nd and 5th lines from a text file:

.. code-block:: sh

      sed -e '1d' -e '2d' -e '5d' BRITE_students.txt
--------------------

* But what if we had a much longer list and wanted to remove more lines?

.. code-block:: sh

      echo -e "1d\n2d\n5d" > my_lines.txt
      cat my_lines.txt
      sed -f my_lines.txt BRITE_students.txt
--------------------

* Now let's print the 2nd line to last:

.. code-block:: sh

      cat BRITE_students.txt | sed -n 2,'$p'
--------------------


