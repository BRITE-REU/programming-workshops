1. Running Jobs
===============================

The SCC is also a space to run code or other jobs that require multiple resources that are unavailable on a local workstation, including jobs that exceed workstation capability (RAM, Network, Disk), long periods of time to run (hours, days, weeks), and specialized software.

Types of Jobs
################

Interactive job – running interactive shell: run GUI applications, code debugging, benchmarking of serial and parallel code performance;

Interactive Graphics job ( for running interactive software with advanced graphics ) .  

Batch  job – execution of the program without manual intervention;

During the workshop, we will focus on batch jobs.

Submitting jobs using qsub
##########################

To submit a non-interactive job, you will use the qsub command. 

.. code:: bash

   scc1 % qsub [options] command [arguments]


Example: Submit code printenv using qsub to print the environment variables

.. code:: bash

   scc1 % qsub -b y printenv
   Your job #jobID ("printenv") has been submitted

The option -b y tells the batch system that the following command is a binary executable. The output message of the qsub command will print the job ID, which you can use to monitor the job’s status within the queue. 

While the job is running the batch system creates stdout and stderr files in the job’s working directory. These files are names after the job (i.e. printenv) followed by the job's id number. 

For example, 

printenv.o#jobID - the output of the command
 
printenv.e#jobID - list of errors, if any, that occurred while the job was running


Another way to submit a job using qsub is through a bash script (job_script.sh) that specifies the options, commands, and arguments required to run the job.

.. code:: bash

   scc1 % qsub job_script.sh


Resources required to run a job
###############################

There are a number of directives or options that the user can pass to the batch system. These are provided as arguments to the qsub command or added as lines with symbols #$ in the job script.

Example: Qsub command arguments

.. code:: bash

   scc1% qsub -l h_rt=24:00:00 -N myjob -j y printenv

Example: Job Script arguments

.. code:: bash

   #!/bin/bash
   #$ -l h_rt=24:00:00   # Specify the hard time limit for the job
   #$ -N myjob           # Give job a name
   #$ -j y               # Merge the error and output streams into a single file

   printenv

The table below shows general directives that are commonly used including specifying the number of processes or project name required to run a job.

.. image:: images/Qsub_Resources.png

To request other resources besides the general directives, the scc website details available directives that can be requested. 
http://www.bu.edu/tech/support/research/system-usage/running-jobs/submitting-jobs/


Job status and deletion
#######################

After submitting a job, you can check the status of your job using the qstat command.

Checking status of a batch job:

.. code:: bash

   scc1% qstat -u <userID>

List running jobs only:

.. code:: bash

   scc1% qstat -s r <userID>


Checking information about a job:

.. code:: bash

   scc1% qstat -j <userID>


 Display resources requested by the user jobs:

.. code:: bash

   scc1% qstat -r <userID>

   
To retreive information about a past job, you can use the qacct command.

Information about a specific job:

.. code:: bash

   scc1% qacct -j <userID>


Information about all jobs that were run in the past number of days:

.. code:: bash

   scc1% qacct -o <userID> -d <number of days> -j


To delete a job, you can use the qdel command.

Delete all jobs of user:

.. code:: bash

   scc1% qdel -u <userID>


Delete specific job:

.. code:: bash

   scc1% qdel <jobID>








 
