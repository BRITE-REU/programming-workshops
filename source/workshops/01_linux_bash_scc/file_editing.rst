4. File editing in the terminal
================================

Typically, you'd want to turn on X-11 forwarding or mount the server onto your machine to work on some sort of GUI or IDE, but sometimes you just want to make a quick change to a file that you have write permissions. Well, I will describe vim, because that is our most used terminal editor. Vim is a very popular text editors these days, and has been around since the 1970s.

You activate vim by typing ``vim`` followed by a file name. If the file doesn't already exist, then it will be created when you save you work.

When you first enter vim, you will be in normal mode. Here, you can go into other modes to perform commands, or you can go into editor mode by pressing ``i`` once. Once in editor mode, you can type your code. You can only move the cursor in the four directions, no mouse. However, if you go back into normal mode, you can do some navigating tricks:

- ``^`` - This brings you to the beginning of a line
- ``$`` - This brings you to the end of a line
- ``G`` - This brings you to the end of the file
- ``gg``- This brings you to the beginning of the file
- ``0`` - Often synonymous with ``^``
-``/.*``-  It's a find function. After typing a forward slash, you may write anything. upon pressing enter, vim will search the document and bring your cursor to the first instance of that string.

You can also do some editting tricks with vim:

- ``[0-9]* dd`` - type a number and then dd. This will delete that many lines below you.
- ``D`` - delete until the end of a line
- ``u`` - undo the last action
- ``[0-9]* y`` - "yank." It means to copy. Regular select control-c works.
- ``p`` - Paste. Regular control-p works too, not in conjunction with yank, though.

if you ever type control-s, vim will keep recording your actions, but not display them, appearing to be stuck. Press control-q to get out of that jam.

To leave vim, go into normal mode from editor mode by pressing escape. Then press ``:``. You can follow this with:

- ``q`` - quit. No changes made.
- ``q!`` - quit. Discard changes made.
- ``w`` - save. returns you to normal mode afterwards.
- ``wq`` - save and return to CLI.

Other text editors exist, such as emacs and nano. Find the one that works best for you and learn all of their tricks!
