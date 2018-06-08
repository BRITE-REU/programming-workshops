.. _instructions:

====================
Instructions
====================

Through the ten weeks you are at BU, we will introduce some useful programming tools and skills during six weekly programming workshop sessions.  These include skills on using linux, the BU shared computing cluster (SCC), sharing your code and work on github using git, coding with R and Python, machine learning software, and the SQL database language. The sessions will have two parts, a 1 hour offline document or video that you study prior to attending the session and 2 hours hands-on session during which we will walk you through different commands and programs.

In order to participate, you will need to install the required tools and applications prior to coming to the classes. Below are the instructions to install an SSH Client, git, R and RStudio, Python and anaconda, RapidMiner, and mySQL. Please have them ready and running on your laptops so we can make the most out of the sessions. These instructions have been tested, but it’s not possible for us to run through all the installation steps for all operating systems.  If you encounter a problem or need more clarification, please make a note and send it to us, or write up your own modification of these instructions.  In case you have any difficulty, please contact us to fix any potential problems before the specific sessions start.

Instructors

- Ali (LSEB room 104, email: aliamin@bu.edu)
- Dakota (LSEB room 645, email: dyh0110@bu.edu)
- Dileep (LSEB 9th floor, email: dkishore@bu.edu)
- Jeff (LSEB room 104, email: maurerj@bu.edu)
- Marzie (LSEB room 106, email: marzie@bu.edu)
- Tanya (LSEB room 645, email: tanyatk@bu.edu)

Workshop schedule

1. *Week 2*: Linux and Bash
2. *Week 3*: Git and SCC
3. *Week 4*: Python
4. *Week 6*: R
5. *Week 7*: Machine learning
6. *Week 8*: SQL

**All sessions meet Tuesday 1-3 pm in LSE 904**


.. contents::


Linux/Unix and Bash
====================

Windows 10 (linux subsystem for windows):
-----------------------------------------------

1. Control Panel -> Programs and Features and click "Turn Windows Features on or off" on the top left pane
2. In the dialog box, check "Windows Subsystem for Linux" and click Ok
    |unix_1|
3. Reboot machine
4. Start Menu -> Microsoft store -> Search for “Linux”
5. Click “Get the apps” under the “Linux on Windows?” banner
    |unix_2|
6. You’ll see a list of every Linux distribution currently available in the Windows Store. We recommend that you select “Ubuntu” (unless you know what you’re doing)
7. To open the Linux environment you installed, just open the Start menu and search for whatever distribution you installed. For example, if you installed Ubuntu, launch the Ubuntu shortcut
8. After installation it will ask to create a UNIX username and password
9. You are now ready to use the bash shell

.. |unix_1| image:: images/unix_1.png
.. |unix_2| image:: images/unix_2.png

Windows 8- (Installing Babun):
-------------------------------

Babun is just a customized and pre-configured Cygwin.  You can install Cygwin if you’re familiar with that.

1. Just download the dist file from `here <http://babun.github.io>`_, unzip it and run the ``install.bat`` script.
2. After a few minutes Babun starts automatically.
3. The application will be installed to the ``%USERPROFILE%\.babun`` directory.
4. Use the ``/target`` option to install babun to a custom directory.


Mac / Linux:
--------------------
You default shell should already be bash.
Otherwise run: ``chsh -s /bin/bash``



Git and SCC
====================

Python
====================

R
====================

Machine Learning
====================

SQL
====================