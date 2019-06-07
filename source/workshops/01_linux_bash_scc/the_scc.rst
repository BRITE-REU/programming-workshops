1. The SCC
===============================

Shared Computing Cluster
--------------------------

The Shared Computing Cluster (SCC) at Boston University is a Linux cluster with over 690 nodes, 14,000 processors, 324 GPUs, and currently over 4.2 petabytes of disk storage. The SCC is located in Holyoke, MA at the Massachusetts Green High Performance Computing Center (MGHPCC), a collaboration between 5 major universities and the Commonwealth of Massachusetts. 

The SCC is suitable for high-performance computing in various areas of research such as bioinformatics and is commonly used to

- Share and store data
- Run code that exceeds workstation capability (RAM, Network, Disk)
- Run code that runs for long periods of time (hours, days, weeks)
- Run code in highly parallelized formats (use 100 machines simultaneously)
- Access specialized software packages


Architecture
--------------

The SCC uses the linux command line environment. To use the SCC, you must login to one of several login nodes. Everyone who has a BU ID can login to SCC1. If you are on a project, you can login to SCC2. For users in the Earth and Environmental Departments, use GEO login node. For BUMC users and for work on sensitive data, you can login to SCC4. For more information, see the SCC's `SSH <https://www.bu.edu/tech/support/research/system-usage/getting-started/connect-ssh/>`_ and `VPN <https://www.bu.edu/tech/services/cccs/remote/vpn/use/>`_ pages.

.. note:: SCC4 is only accessible through the BU network. To work remotely, you will need to use a virtual private network (VPN) to connect to the BU network.  

File Storage
--------------

1. **Home directory:** This directory is entirely controlled by you. The default permission are set so that no other user can see or access your files. Home directories have a quota of 10 GB. 

2. **Backed-up project disk space:** Research projects are by default granted 50GB of backed-up space (``/project/project_name/``). Files that cannot be replaced and source code should be stored in this space.  

3. **Not backed-up project disk space:** Projects are by default granted 50 GB of space(``/projectnb/project_name/``). Files generally stored in this space include output files, downloaded data sets, and large quantities of data that you could recreate in the unlikely event of data loss.

4. **Scratch space:** Each node has a directory called /scratch stored on a local hard drive. This can be used by batch jobs to quickly write temporary files. If you wish to keep these files, you should copy them to your own space when the job completes. More information can be found `here <https://www.bu.edu/tech/support/research/system-usage/running-jobs/resources-jobs/local_scratch/>`_ .

.. note:: Scratch files are kept for 30 days, with no guarantees.

Recovering Lost Files
------------------------

You can retrieve lost files using snapshots. Snapshots are copies of files from home directories and Project Disk Space that are stored within the file system. This is convenient when you want to retrieve a file that was lost or accidentally deleted. More information can be found `here <https://www.bu.edu/tech/support/research/computing-resources/file-storage/>`_ .

SSH Login
-------------

To connect to the SCC, you will need to download an SSH Client or use a terminal application depending on your operating system. An SSH client is a software program which uses the secure shell protocol to connect to a remote computer. Go to the instructions section to download the appropriate software to connect to the SCC. Once you login using the instructions below, you will find yourself in your home directory.

Windows/MobaXterm
*********************

.. code:: bash

   local_prompt% ssh username@scc1.bu.edu


Mac
*********

.. code:: bash

   local_prompt% ssh –Y username@scc1.bu.edu

Linux
**********

.. code:: bash

   local_prompt% ssh –X username@scc1.bu.edu


Submitting jobs
--------------------

.. toctree::
    :maxdepth: 3

    Submitting jobs <qsub>

Workshop 1.2 
----------------

.. toctree::
    :maxdepth: 3
	
	SCC activity <scc_workshop>
	
