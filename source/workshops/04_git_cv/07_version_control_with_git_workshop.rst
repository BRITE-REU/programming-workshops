
2021 Workshop: https://github.com/BRITE-REU/snakemake-workshop


---------------------------------------------
Everything below this line is from a previous version of this workshop. It is retained here for extra documentation.

Workshop 7. Version Control with git workshop
---------------------------------------------

Instructors: Dileep Kishore and Emma Briars

.. contents::
   :local:

In this workshop you will work on both basic and advanced ``git`` commands and collaborate with each other through ``git`` repositories.
For this workshop you will be working in small teams of 2-3 people.
You can either complete the tasks on the Shared Computing Cluster (SCC) or on your local computer.
We will be using the ``git`` command line interface throughout this workshop.


.. tip::

    To login to the SCC use: ``ssh <username>@scc1.bu.edu``

Getting started
+++++++++++++++

You will be working on a movie recommender system that recommends movies based on plot and keyword similarities.

.. admonition:: Task 1

    1. One team member should fork this repository: https://github.com/BRITE-REU/git-practice
    2. Add all your other team members as collaborators.
    3. Clone the repository
    4. Follow the instructions in the README to set up your environment
    5. Ensure that the package runs as expected

.. tip::

    1. If you're working on the scc you can use ``module load anaconda3``
    2. Look at the git history
    3. Observe the list of remote repositories


Your first contribution
+++++++++++++++++++++++

You can now make your first contribution to the package

.. admonition:: Task 2

    1. Add your name to the contributors section of the README
    2. Commit your changes
    3. Oops, I meant to ask you to add your team member's name not yours. Fix that.
    4. Push, pull and merge (fix conflicts, if any)

.. tip::

    1. If you're stuck, look up how to ammend a commit
    2. Use ``git status`` to explore what happens to the unstaged and staging areas


Exploring the tree
++++++++++++++++++

In this section you will explore the history of the repository

.. admonition:: Task 3

    1. Go back 10-20 commits (these should be one of my commits)
    2. Now go to commit ``0338440``
    3. What's changed?
    4. Compare the version of the README you had just updated with this version
    5. Go back to the latest commit


Extending the source code
+++++++++++++++++++++++++

Software development usually involves multiple developers working on the software at the same time. You will now divide your team into *bug fixers* and *feature contributors*. Don't worry you will get to switch roles in the middle.

.. admonition:: Task 4

    1. *Bug fixers* (will work on the ``master`` branch)
        - Fix: Raise ``ValueError`` when unsupported method is passed to ``movie_recommender``
        - Now switch roles
        - Fix: Load pickled recommender when available
    2. *Feature contributors* (will create a new ``feature`` branch)
        - Feat: Save the recommender object after training
        - Now switch roles
        - Feat: Unknown movie query returns fuzzy matches

    The ``save``, ``load`` and ``search`` functions are already implemented in ``utils.py`` and can be imported as

    .. code-block:: python

        ``from .utils import save, load, search``

.. tip::

    1. How can the bug fixers also get access to the feature branch?
    2. Make sure you merge to ``master`` after completing your first feature
    3. Use ``git stash`` to stash changes before switching branches


Changing history
++++++++++++++++

When you ``git`` a time-machine the first thing you do is go change history.

.. admonition:: Task 5

    1. Reset the repository to the state it was in when you found it (my last commit). Observe the working directory
    2. Now reset it back to your commit
    3. Now revert your last commit. Observe the git history
    4. Undo your revert

.. caution::

    Do not push or pull if you've just reset to a previous commit. This will screw up your history and make things a lot more complicated since the remote history will be different.

.. tip::

    1. Use ``git reflog`` to get the reference of your last commit before you reset
    2. Can you reset a revert?


Getting ready for the release
+++++++++++++++++++++++++++++

.. admonition:: Task 6

    1. Add the pickled file to `gitignore`. We don't want to store binaries in version control especially large binaries.
    2. Tag your commit with a version number. Finally, release your source code.


Send me a pull request
++++++++++++++++++++++

You can inform other's of you magnificent changes and accomplishments by making pull requests.
This way you let everyone know that you made some changes and they need to pull.

.. admonition:: Task 7

    Create a new pull request.

.. tip::

    Ideally pull requests should be from branches in your fork of the repository
