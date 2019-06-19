SCC and qsub exercises
====================

Login into SCC
-----------------

.. code:: bash

   ssh username@scc1.bu.edu

Loading modules
--------------------

The SCC has many preinstalled programs and utilities, which we refer to as modules. You can search for different modules using:

.. code:: bash

   module avail [pattern]
   
To load a specific module:

.. code:: bash

   module load [module_name]
   
For example, let's check for all the available JAVA versions on SCC and load version 9.

.. code:: bash

   module avail java
   module load java/9.0.1
   java -version

Submitting jobs to the SCC
------------------------------

When you ``ssh`` to the SCC you are connected to a head node. Head nodes are the only nodes on the cluster that are connected to the internet (so that you can access the SCC). They are the busiest and maintain all user connections. We should not run any program on the head node. By default your program will be killed if it runs more than 20 minutes, but even if you have some code that runs in 5 minutes, do not run it on the head node. Instead, always submit it as a job with ``qsub``.

.. code:: bash

   qsub -P [project_name] -N [name_of_job] [bash_script]

When a job is running, its standard output will be saved in a file named ``[job_name].o[job_ID]`` and its standard error will go to ``[job_name].e[job_ID]`` in the directory where you called ``qsub``. To merge them use ``-j y``. For a full list of parameters and option for qsub see `here <http://www.bu.edu/tech/support/research/system-usage/running-jobs/submitting-jobs/>`_. You can see how to allocate more memory, multiple processes to multi-threaded jobs, send notification emails upon the completion of your job, and much more.

Useful parameters
***********************

- Send an email upon ending: ``-m e -M [email]``
- Get multiple processes/slots: ``-pe omp [#processes]`` 
- Set the maximum (hard) running time: ``-l h_rt=hh:mm::ss``

Once the job is given the resources it requires, you can check the status of your ongoing jobs using ``qstat``. This will return all the running jobs with their job_ID, name, starting time, and status.

.. code:: bash

   qstat -u [username]

To delete or stop a job use ``qdel``.

.. code:: bash

   qdel [job_ID]


Useful tips
-------------

- Always use a meaningful name for your jobs.
- Do not allocate more resources than you need. It will not make your program run faster and will only make your queue wait time longer.
- You can use ``j_hold`` to make one job to wait for another one to finish then run. If the job is running the machine associated to it will be shown too. You can ssh to that machine and see the status of that job, too. 
- Use ``top -u username`` to see your ongoing processes and their allocated resources.


Hands-on activity
--------------------

The NCBI's `SRA toolkit <https://www.ncbi.nlm.nih.gov/sra/docs/>`_ is a useful tool to download sequencing data from `GEO <https://www.ncbi.nlm.nih.gov/geo/>`_.
Here we will use the toolkit to download some RNASeq data.

Log on to SCC
****************

.. code:: bash

   ssh [username]@scc1.bu.edu
   
Choose some RNA-seq data
***************************

First `query for a series <https://www.ncbi.nlm.nih.gov/geo/browse/?view=series>`_ on GEO. For example, the `GSE113476 series <https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE113476>`_ contains human breast cancer PDX samples. Get the SRA project (SRP) accession ID (`SRP141444 <https://www.ncbi.nlm.nih.gov/sra?term=SRP141444>`_) in the relations box. To download this project, we need to get all the sample files (with SRR accession IDs), which is possible using the `SRA Run Selector <https://www.ncbi.nlm.nih.gov/Traces/study/>`_. Search for project SRP141444 and get the SRR accession for each sample. Save this list as a file on the SCC.

.. code:: bash
   
   vim SRR_acc_List.txt
   
Copy the first four SRR IDs into the file and save it:

.. code:: bash
   
   SRR7050666
   SRR7050667
   SRR7050668
   SRR7050669


Load sra toolkit using the ``module`` commands
***************************************************

Check what versions of the toolkit are available and then load the default version.

.. code:: bash

   module avail sra
   module load sratoolkit

Download the files with a bash script
***************************************************

Make a script to read the SRR accession IDs one by one and ``fastq-dump`` them into a directory using the following code.
   
.. code:: bash

  #!/bin/bash
  ACCESSION_LIST_FILE=$1
  OUTPUT_DIR=$2
  while read SRR_ID; do
     fastq-dump --gzip --split-files --outdir $OUTPUT_DIR $SRR_ID
  done < $ACCESSION_LIST_FILE
 
Now submit the script as a job!

.. code:: bash

   qsub -N SRA_example dl_sra.sh SRR_Acc_List.txt SRP141444


Check if your code is running:

.. code:: bash

   qstat -u username
   

This script will download each SRR one by one. That is slow. Let's kill it (``qdel``) and make it faster.


Make your code run faster
******************************

One way you can make jobs multi processing, especially when you need to use large numbers of processes, is to use multiple jobs. Try that on your own. Make a bash script that sends a query (``qsub``) for each SRR accession.
   
