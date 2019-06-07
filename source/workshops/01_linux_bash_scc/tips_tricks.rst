8. Tips and tricks
====================

Customizing your ``.bashrc``
****************************

.. raw:: html

    <div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe src="https://www.youtube.com/embed/vDOVEDl2z84" frameborder="0" allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe>
    </div>

``.bash_profile`` and ``.bashrc`` files. *Runtime ~ 8min*

.. raw:: html

    <div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe src="https://www.youtube.com/embed/rK9Y6DEYfKA" frameborder="0" allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe>
    </div>

Environment variables and aliases. *Runtime ~ 14min*


Brace expansion
********************

.. code-block:: sh

    mkdir {a..c}-{1..2}.txt

Aliasing
********************

.. code-block:: sh

    alias gst="git status"

Processes
********************

.. code-block:: sh

    # SIGKILL
    kill -9 pid
    # SIGTERM
    kill -15 pid

.. raw:: html

    <div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe src="https://www.youtube.com/embed/C-AQAJXdoS8" frameborder="0" allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe>
    </div>

Bash shortcuts. *Runtime ~ 9min*

.. raw:: html

    <div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe src="https://www.youtube.com/embed/V8EUdia_kOE" frameborder="0" allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe>
    </div>
    
History Substitutions
********************

Bash stores your history. If you find yourself needing to reuse parts of code, as you often do, use these tricks.

Long complicated command has a typo in the middle? Feel like you have to pull the command down and then go to the error and correct it? Well, just use this syntax:

``^[mistake]^[correction``

Doing this, bash will pull the previous command and make that single substitution then run it.

The ``!`` symbol stands for "the last line." Therefore:

- ``!!`` - run the last line again. useful if you need to rerun things with more permission, ie ``sudo !!``
- ``!$`` - this will be replaced by the last word of the last line. useful when you ``mkdir`` and then want to quickly ``cd`` into it
- ``!^`` - this will be replaced by the first word of the last line. useful when the first word is long, complicated and not able to autocomplete
- ``!-[0-9]``- this indicates not the last line, but the [0-9] line beforehand. by itself, it will run the [0-9] line before it.
- ``!.*`` - This means "run the most recent command that began with this character string." Useful if that command is who knows how many commands back it was or a command that took in many parameters that would be tedious to type again or find and copy.

More found here: https://www.thegeekstuff.com/2011/08/bash-history-expansion/

Command Substitutions
********************
If you have multiple commands on a single line, you may put backticks on the ones that you want to go first. They act as parantheses in math do.


Shell tricks. *Runtime ~ 11min*
