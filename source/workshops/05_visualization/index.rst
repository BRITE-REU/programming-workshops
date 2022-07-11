.. _visualization

=========================
Workshop 5: Visualization
=========================

Introduction
------------

This workshop will serve as an introduction to popular visualization tools and
plots used in bioinformatics. While not exhaustive, the workshop should
hopefully aid students in not only understandings how to interpret common
plots, but also how to create them themselves.

The workshop is broken in to two parts: a basic introduction to visualization
tools, and a problem based workshop. The workshop will be done in Python, so
while a small section of the introduction mentions plotting tools in R, the
major focus will be on Python. The workshop will be done using
paired programming, with both students alternating who "drives" on a regular
basis. It is important that you read and actively engage in the introductory
material before the workshop.

Installation 
------------

You should either have already installed Anaconda/`conda` for the python
workshop, or have access to a Python IDE like Jupyter Notebook via the
`BU Shared Computing Cluster <https://scc-ondemand1.bu.edu/pun/sys/dashboard/batch_connect/sessions>`.

This workshop will use a `conda environment` to make sure all required packages
are installed without version issues. However, if choose to work in a `Jupyter
Notebook` we will first need to install the `nb_conda_kernels` package. This
will ensure the `conda environment` is discoverable when working in a Notebook.

To install, issue the following command in a terminal:

.. code-block:: bash

    conda install -c conda-forge nb_conda_kernels

Conda environments are isolated installations of software that are kept
seperate from each other. For example, if we wanted to have both Python 2.7 and
Python 3.x installed on a machine -- without conflicting with one another --
we could run the following commands:

.. code-block:: bash

    conda create --name p2 python=2
    conda create --name p3 python=3

This will create two conda environments ("p2" and "p3") that we can access by 
typing

.. code-block:: bash

    conda activate p2

or

.. code-block:: bash

    conda activate p3

For this workshop, we will create a conda environment named "viz". However,
instead of manually entering all necessary packages, we will install all the
packages from a specification file called "environment.yaml". To do this, first
download the :download:`specification file <files/environment.yaml>`, and
navigate to the directory containing the downloaded "environment.yaml" file.
Run the following command in a terminal:

.. code-block:: bash

    conda env create --name viz --file environment.yaml


Jupyter
-----
If you would prefer to go through the introductory material in a `Jupyter
Notebook`, you can download the complete notebook.

:download:`Notebook <files/intro.ipynb>`.

However, before doing so, you will need to
follow the above installation instructions to both install the required packages
and gain access to the installed `conda` environment. Once you've activated
either `Jupyter Lab` or `Jupyter Notebook`, click the **kernel** tab, go to 
**change kernel**, and select "Python [conda env:viz]". You should now have
access to all required packages.

Troubleshooting
~~~~~~~~~~~~~~~
If you follow the above instructions, and you do not see
"Python [conda env:viz]" in selectable the list of selectable kernels, make sure
you started `Jupyter` from the base conda environment (i.e. you don't see
"(viz)" at the beginning of your terminal prompt). Otherwise, try restarting.

Workshop Materials
------------------

.. toctree::
    :maxdepth: 2

    Visualization Introduction <intro>
    Workshop <workshop>