1. Linux/Bash
===============================

**UNIX and Linux**

UNIX is an operating system which was first developed in the 1960s, and has been under constant development ever since. It is a stable, multi-user, multi-tasking system for servers, desktops and laptops. There are many different versions of UNIX, although they share common similarities. The most popular varieties of UNIX are Sun Solaris, GNU/Linux, and MacOS X.

The UNIX operating system is made up of three parts; the kernel, the shell and the programs.

1. **The kernel**: The kernel of UNIX is the hub of the operating system: it allocates time and memory to programs and handles the filestore and communications in response to system calls.
2. **The shell**: The shell acts as an interface between the user and the kernel. The shell is a command line interpreter (CLI). It interprets the commands the user types in and arranges for them to be carried out. The commands are themselves programs.
3. **The programs**: Programs are instructions that tell the computer what to do.

Everything in UNIX is either a file or a process. A process is an executing program identified by a unique PID (process identifier). A file is a collection of data. They are created by users using text editors, running compilers etc.

.. raw:: html

    <div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe src="https://www.youtube.com/embed/xRX6ZI_P-LA" frameborder="0" allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe>
    </div>

Introduction to UNIX and Linux. *Runtime ~ 5min*

In a GNU/Linux system, Linux is the kernel component. The rest of the system consists of other programs, many of which were written by or for the GNU Project. Because the Linux kernel alone does not form a working operating system, the term “GNU/Linux” is more appropriate for systems that many people casually refer to as “Linux”. The `GNU Project <https://www.gnu.org/gnu/thegnuproject.en.html>`_ has developed a comprehensive set of free software tools for use with Unix™and Unix-like operating systems such as Linux. These tools enable users to perform tasks ranging from the mundane (such as copying or removing files from the system) to the arcane (such as writing and compiling programs or doing sophisticated editing in a variety of document formats).

Linux is also less likely to crash, better able to run more than one program at the same time, and more secure than many operating systems. With these advantages, Linux is the fastest growing operating system in the server market. More recently, Linux has begun to be popular among home and business users as well.

-----------------------

**Bash**

Bash is a UNIX shell and command language developed by the GNU Project as a replacement for the Bourne shell. It the default login shell for most Linux distributions and maxOS. Bash is a command processor that typically runs in a text window, where the user types commands that cause actions. Bash can also read and execute commands from a file, called a shell script. Like all Unix shells, it supports filename globbing (wildcard matching), piping, here documents, command substitution, variables, and control structures for condition-testing and iteration. We will explore some of these concepts in the subsequent tutorial sections.

.. raw:: html

    <div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe src="https://www.youtube.com/embed/Yt57-gg9jVg" frameborder="0" allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe>
    </div>

The terminal vs. the shell. *Runtime ~ 1min*

.. raw:: html

    <div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe src="https://www.youtube.com/embed/cBgHrShnhaU" frameborder="0" allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe>
    </div>

What is the Bash Shell. *Runtime ~ 1min*


--------------------

**Tutorials**

.. toctree::
    :maxdepth: 2

    Introduction to the Command Line <cli_intro>
    Navigation and Working with Files <nav_files>
    Grep, AWK and Sed <grep_awk_sed>
    Editing Files in the Terminal <file_editing>
    Piping and Redirection <piping>
    Processes <processes>
    Bash Scripting <bash_scripting>
    Tips & Tricks <tips_tricks>
..	The SCC <the_scc>
..    Submitting jobs <qsub>
..	SCC/qsub exercises <scc_workshop>