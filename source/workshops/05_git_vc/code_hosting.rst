Source Code Hosting
-------------------

What is GitHub?
+++++++++++++++

GitHub is a web-based hosting service for version control using Git.
It offers all of the distributed version control and source code management (SCM) functionality of Git as well as adding its own features.
It provides access control and several collaboration features such as bug tracking, feature requests, task management, and wikis for every project
GitHub offers plans for both private repositories and free accounts which are commonly used to host open-source software projects.

.. admonition:: Exercise

    1. Create a GitHub account
    2. Get familiar with GitHub
    3. Read this `short guide <https://guides.github.com/activities/hello-world/>`_

SSH vs HTTPS
++++++++++++

The connection to the server is secured with SSH or HTTPS.
`GitHub explains which URL to use <https://help.github.com/articles/which-remote-url-should-i-use/>`_.
If you use SSH you will need an SSH key.
Read `here to learn how to connect to GitHub with SSH <https://help.github.com/articles/connecting-to-github-with-ssh/>`_.

.. image:: HTTPS_SSH_github.png

When using ``your_username`` to clone/fetch a ``repository`` from ``the_author``, an SSH url will look like:

``git@github.com:[the_author]/[repository].git``

and HTTPS will look like:

``https://[your_username]@github.com/[the_author]/[repository].git``.


Semantic versioning
+++++++++++++++++++++

Have you ever wondered how developers decide how to number the different versions of their software?
Do they just randomly come up with numbers? No, the version number consists of 3 numbers, ``x.y.z`` where ``x`` is a major change, ``y`` is a minor change and ``z`` a patch. There is `official documentation <http://semver.org/>`_ on this, which you can read if you are interested. But assume you have a tool that reads some data and performs some function on the data. If you find a bug and fix it, you publish the fix by adding to ``z``. If you added a small functionality, for example support for compressed data input and compatibility with other tools, increase ``y``. If you added another function to it, increase ``x``.


Licensing
+++++++++

Public repositories on GitHub are often used to share open source software.
For your repository to truly be open source, you'll need to license it so that others are free to use, change, and distribute the software.
You're under no obligation to choose a license.
However, without a license, the default copyright laws apply, meaning that you retain all rights to your source code and no one may reproduce, distribute, or create derivative works from your work.

*For example*: if you use GitHub and/or Bitbucket, you can publish your tool with the GNU licensing.
GNU is open source, and open source does not mean free.
Whenever using code with GNU licensing, you must cite the authors/developers.
For more information on the license check `the GNU organization documentation <https://www.gnu.org/licenses/gpl-3.0.en.html>`_.

This `link <https://choosealicense.com/>`_ contains useful information to help you choose a license for your project.

README and Markdown syntax
++++++++++++++++++++++++++

It's a good practice to make a **README** for your repository.
The README file can also be edited online using the editors GitHub and Bitbucket provide.
Typically they are written in ``Markdown`` syntax, which is very simple.
You might have heard about ``R Markdown``, but ``Markdown`` is a syntax that ``R`` has knitted into its compiler.
Again there are many tutorials to learn ``Markdown``.
You can check the syntax on the `Atlassian website <https://confluence.atlassian.com/bitbucketserver/markdown-syntax-guide-776639995.html>`_.

A README should include information about:

- name of the tool and the version
- what is this tool about
- who are the authors
- requirements and dependencies
- how to install/clone it
- how to run it
- what is the input and output
- licensing
- how to cite it

Look at `this nice outline <https://gist.github.com/PurpleBooth/109311bb0361f32d87a2>`_ for a standard README file in ``Markdown`` syntax.
To get the source code click the ``Raw`` button on the top left.


Bug and Issue tracking
++++++++++++++++++++++

Both GitHub and Bitbucket allow for issue tracking.
Members of a team can create an issue, assign it to a developer or admin, and comment on it.
An issue can be marked according to its importance and type, for example, fixing a bug or adding functionality; and the issue can be resolved once it is has been taken care of.
Issues can be linked to commits, to show which commit resulted in resolving an issue.

When a repository is publicly accessible, you can create issues to inform the developers there is a bug or a functionality you would be interested in.
So, the next time you find an issue with some tool that you can't resolve after trying for a few days, just post an issue on their GitHub repository.
You can also link/mention issues and commits from different repositories.

Read this `useful guide <https://guides.github.com/features/issues/>`_ to learn more.
