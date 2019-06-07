1. Running Jobs
===============================

The SCC is a space to run code or other jobs requiring resources that are unavailable on a local workstation, including jobs that exceed workstation capability (RAM, network, kisk), long periods of time to run, and specialized software.

Types of jobs
---------------

- **Interactive job:** run an interactive shell for GUI applications, code debugging, or benchmarking of serial and parallel code performance

- **Interactive graphics job:** run interactive software with advanced graphics such as RStudio 

- **Batch  job:** execute a program without manual intervention

.. note:: During this workshop, we will focus on batch jobs.

Submitting jobs with ``qsub``
-----------------------------

To submit a non-interactive job, you will use the ``qsub`` command. 

.. code:: bash

   scc1 % qsub [options] command [arguments]


For example, we can submit the command ``printenv`` using ``qsub`` to print environment variables

.. code:: bash

   scc1 % qsub -b y printenv
   Your job 6580039 ("printenv") has been submitted

The option ``-b y`` tells the batch system that the following command is a binary executable. The output message of the qsub command will print the job ID, which you can use to monitor the job’s status within the queue. While the job is running, the batch system creates ``stdout`` and ``stderr`` files in the job’s working directory. These files are names after the job (i.e. ``printenv``), followed by the job's id number. 

For example, after submitting the ``printenv`` job, we will get the following log files:

- ``printenv.o6580039``: the output of the command
 
- ``printenv.e6580039``: list of errors, if any, that occurred while the job was running

Another way to submit a job using ``qsub`` is through a bash script (``job_script.sh``) that specifies the options, commands, and arguments required to run the job.

.. code:: bash

   scc1 % qsub job_script.sh

Resources required to run a job
-----------------------------------

There are a number of directives or options that the user can pass to the batch system. These are provided as arguments to the ``qsub`` command or added as lines with symbols ``#$`` in the job script.

``qsub`` arguments are passed like this:

.. code:: bash

   scc1% qsub -l h_rt=24:00:00 -N myjob -j y printenv

Job script arguments are specified like this:

.. code:: bash

   #!/bin/bash
   #$ -l h_rt=24:00:00   # Specify the hard time limit for the job
   #$ -N myjob           # Give job a name
   #$ -j y               # Merge the error and output streams into a single file

   printenv

To request other resources besides the general directives, the scc website details available directives that can be requested at `this page <https://www.bu.edu/tech/support/research/system-usage/running-jobs/submitting-jobs/>`_ .

Job status and deletion
-----------------------------

You can check the status of a job using the ``qstat`` command.

.. code:: bash

   scc1% qstat -u userID

**List running jobs only:**

.. code:: bash

   scc1% qstat -s r userID

**Check information about a job:**

.. code:: bash

   scc1% qstat -j userID

**Display resources requested by a user's jobs:**

.. code:: bash

   scc1% qstat -r userID

To retreive information about a past job, you can use the ``qacct`` command.

.. code:: bash

   scc1% qacct -j userID

**Information about all jobs that were run in the past number of days:**

.. code:: bash

   scc1% qacct -o <userID> -d <number of days> -j

To delete a job, you can use the ``qdel`` command.

.. code:: bash

   scc1% qdel -u userID # delete all jobs
   scc1% qdel <jobID>   # delete specific job
