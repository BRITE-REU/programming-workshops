========================================
Workshop 7: Bioinformatic Visualizations
========================================

Introduction & Overview
------------------------

The Data Set
~~~~~~~~~~~~~~~~~

In today's workshop, we will revisit the data set you worked with in the Machine Learning workshop. As a refresher:  this data set is from the `GSE53987 <https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE53987>`_ dataset on Bipolar disorder (BD) and major depressive disorder (MDD) and schizophrenia:

Lanz TA, Joshi JJ, Reinhart V, Johnson K et al. STEP levels are unchanged in pre-frontal cortex and associative striatum in post-mortem human brain samples from subjects with schizophrenia, bipolar disorder and major depressive disorder. PLoS One 2015;10(3):e0121744. PMID: `25786133 <https://www.ncbi.nlm.nih.gov/pubmed/25786133>`_

This is a microarray data on platform GPL570 (HG-U133_Plus_2, Affymetrix Human Genome U133 Plus 2.0 Array) consisting of 54675 probes.

The raw CEL files of the GEO series were downloaded, `frozen-RMA normalized <https://bioconductor.org/packages/release/bioc/html/frma.html>`_ , and the probes have been converted to HUGO gene symbols using the `annotate package <https://www.bioconductor.org/packages/release/bioc/html/annotate.html>`_ averaging on genes. The sample clinical data (meta-data) was parsed from the `series matrix file <ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE53nnn/GSE53987/matrix/>`_. You can download it `here <https://github.com/BRITE-REU/programming-workshops/blob/master/source/workshops/04_Machine_learning/data/GSE53987_combined.csv>`_.

:download:`GSE53987_combined.csv <data/GSE53987_combined.csv>`  

In total there are 205 rows consisting of 19 individuals diagnosed with BPD, 19 with MDD, 19 schizophrenia and 19 controls. Each sample has gene expression from 3 tissues (post-mortem brain). There are a total of 13768 genes (numeric features) and 10 meta features and 1 ID (GEO sample accession):

- Age
- Race (W for white and B for black)
- Gender (F for female and M for male)
- Ph: pH of the brain tissue
- Pmi: post mortal interval
- Rin: RNA integrity number
- Patient: Unique ID for each patient. Each patient has up to 3 tissue samples. The patient ID is written as disease followed by a number from 1 to 19
- Tissue: tissue the expression was obtained from.
- Disease.state: class of disease the patient belongs to: bipolar, schizophrenia, depression or control.
- source.name: combination of the tissue and disease.state

Workshop Tasks
~~~~~~~~~~~~~~~~~ 
  
This workshop will walk you through an analysis of the GSE53987 microarray data set. This workshop has the following three tasks:  
    1. Visualize the demographics of the data set  
    2. Cluster gene expression data and appropriately visualize the cluster results
    3. Compute differential gene expression and visualize the differential expression

Each task has a **required** section and a **bonus** section. Focus on completing the three **required** sections first, then if you have time at the end, revisit the **bonus** sections.  

Finally, as this is your final workshop, we hope that you will this as an opportunity to integrate the different concepts that you have learned in previous workshops. 

Workshop Logistics:
~~~~~~~~~~~~~~~~~  
As mentioned in the pre-workshop documentation, you can do this workshop either in a Jupyter Notebook, or in a python script. Please make sure you have set-up the appropriate environment for youself. This workshop will be completed using "paired-programming" and the "driver" will switch every 15 minutes. Also, we will be using the python plotting libraries matplotlib and seaborn.


Workshop Tasks
------------------------

Task 0: Set-Up your environment
~~~~~~~~~~~~~~~~~
Whether you are working in a Jupyter Notebook or directly with a python script, make sure that you have followed the pre-workshop instructions. From there, create a script/notebook and load a few libraries that might be useful:  

.. code-block:: python
  # Import Necessary Libraries
  import pandas as pd
  import matplotlib.pyplot as plt
  import seaborn as sns
  import scipy.stats as stats
