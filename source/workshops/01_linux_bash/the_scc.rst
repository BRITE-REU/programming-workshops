1. The SCC
===============================

Shared Computing Cluster
########################

The Shared Computing Cluster (SCC) at Boston University is a Linux cluster with over 690 nodes, 14,000 processors, 324 GPUs, and currently over 4.2 petabytes of disk storage. The SCC is located in Holyoke, MA at the Massachusetts Green High Performance Computing Center (MGHPCC), a collaboration between 5 major universities and the Commonwealth of Massachusetts. 

The SCC is suitable for high-performance computing in various areas of research such as bioinformatics and is commonly used to:

- Share and store data
- Run code that exceeds workstation capability (RAM, Network, Disk)
- Run code that runs for long periods of time (hours, days, weeks)
- Run code in highly parallelized formats (use 100 machines simultaneously)
- Access specialized software packages


SCC Architecture
################

The SCC uses the linux command line environment. To use the SCC, you must login to one of several login nodes. Everyone who has a BU ID can login to SCC1. If you are on a project, you can login to SCC2. For users in the Earth and Environmental Departments, use GEO login node. For BUMC users and for work on sensitive data, you can login to SCC4.

Note: SCC4 is only accessible through the BU network. To work remotely, you will need to use a virtual private network (VPN) to connect to the BU network.  

For more information: 

https://www.bu.edu/tech/support/research/system-usage/getting-started/connect-ssh/

http://www.bu.edu/tech/services/cccs/remote/vpn/use/



File Storage
################

1. Home Directory
*****************
This directory is entirely controlled by you. The default permission are set so that no other user can see or access your files. Home directories have a quota of 10 GB. 

2. Backed Up Project Disk Space
********************************
Research projects are by default granted 50GB of backed-up space (/project/project_name/). Files that cannot be replaced and source code should be stored in this space.  

3. Not Backed Up Project Disk Space
************************************
Projects are by default granted 50 GB of space(/projectnb/project_name/). Files generally stored in this space include output files, downloaded data sets, and large quantities of data that you could recreate in the unlikely event of data loss.

4. Scratch Space
*****************
Each node has a directory called /scratch stored on a local hard drive. This can be used by batch jobs to quickly write temporary files. If you wish to keep these files, you should copy them to your own space when the job completes.

Note: Scratch files are kept for 30 days, with no guarantees.

http://www.bu.edu/tech/support/research/system-usage/running-jobs/resources-jobs/local_scratch/

Recovering lost files use Snapshots
************************************
You can retrieve lost files by using snapshots. Snapshots are copies of files from home directories and Project Disk Space that are stored within the file system. This is convenient when you want to retrieve a file that was lost or accidentally deleted.


For more information:

http://www.bu.edu/tech/support/research/computing-resources/file-storage/

SSH Login
#########

To connect to the SCC, first you will need to download an SSH Client or use a terminal application depending on your operating system. An SSH client is a software program which uses the secure shell protocol to connect to a remote computer. 

Go to the Instructions section to download the appropriate software to connect to the SCC. 

To login to the SCC:

Windows/MobaXterm


.. code:: bash

   local_prompt% ssh tanyatk@scc1.bu.edu


Mac

.. code:: bash

   local_prompt% ssh –Y tanyatk@scc1.bu.edu

Linux

.. code:: bash

   local_prompt% ssh –X tanyatk@scc1.bu.edu



Once you login, you will find yourself in your home directory.


Submitting jobs <qsub>
########################

Workshop 1.2 <scc_workshop>
########################
