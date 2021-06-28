Machine learning workshop
=========================

In this workshop, we will study `GSE53987 <https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE53987>`_ dataset on Bipolar disorder (BD) and major depressive disorder (MDD) and schizophrenia: 

Lanz TA, Joshi JJ, Reinhart V, Johnson K et al. STEP levels are unchanged in pre-frontal cortex and associative striatum in post-mortem human brain samples from subjects with schizophrenia, bipolar disorder and major depressive disorder. PLoS One 2015;10(3):e0121744. PMID: `25786133 <https://www.ncbi.nlm.nih.gov/pubmed/25786133>`_

This is a microarray data on platform GPL570 (HG-U133_Plus_2, Affymetrix Human Genome U133 Plus 2.0 Array) consisting of 54675 probes.

The raw CEL files of the GEO series were downloaded, `frozen-RMA normalized <https://bioconductor.org/packages/release/bioc/html/frma.html>`_ , and the probes have been converted to HUGO gene symbols using the `annotate package <https://www.bioconductor.org/packages/release/bioc/html/annotate.html>`_ averaging on genes. The sample clinical data (meta-data) was parsed from the `series matrix file <ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE53nnn/GSE53987/matrix/>`_. You can download it `here <https://github.com/BRITE-REU/programming-workshops/blob/master/source/workshops/04_Machine_learning/data/GSE53987_combined.csv>`_.

:download:`GSE53987_combined.csv <data/GSE53987_combined.csv>`

In total there are 205 rows consisting of 19 individuals diagnosed with BPD, 19 with MDD, 19 schizophrenia and 19 controls. Each sample has gene expression from 3 tissues (post-mortem brain). 
There are a total of 13768 genes (numeric features) and 10 meta features and 1 ID (GEO sample accession).

* Age
* Race (W for white and B for black)
* Gender is F for female and M for male
* Ph is the ph of the brain tissue
* Pmi is the post mortal interval
* Rin is the RNA integrity number
* Patient is unique for each patient. Each patient has up to 3 tissue samples. The patient ID is written as disease followed by a number from 1 to 19
* Tissue is the tissue the expression was obtained from.
* Disease.state is the class of disease the patient belongs to: bipolar, schizophrenia, depression or control.
* source.name is the combination of the tissue and disease.state



**************
Workshop tasks
**************

:download:`Notebook <notebooks/workshop4.ipynb>`

:download:`Solutions <notebooks/workshop4_solutions.ipynb>`

1. Check all the features. Which features are numeric, which are categorical? Understanding the nature of your data is a very important and necessary first step before proceeding with any analysis.

  - What type of distributions exist within the features? Is Gender a balanced feature (roughly equal representation between both men and women)? Are numerical values normally distributed? Explore numerical distributions by plotting histograms for Age, an Age + Gender histogram, and one of your favorite genes found in the dataset.
  - Some features display factor dependent values. That is, whether a subject is a male or a female might effect the expression patterns of a given gene. Explore factor and feature relationships by creating boxplots to observe how Age is dependent on Tissue, Gender and Disease.status.

2. Principal Component Analysis (PCA) is a commonly used technique to create linearly uncorrelated features from a set of possibly correlated features. The procedure is done in such a way that the first feature produced by PCA, the first principal component -- PC1, explains the largest amount of variability possible. In this way, PCA is a dimension reduction technique, as the first few principal components often explain upwards of 90% of the variability found within a dataset. It is important to note that if we're planning on predicting anything using the principal components, such as tissue type or Disease.status, those features should *not* be included in the input matrix. Before performing PCA, create a new data frame containing only explanatory values (i.e. the features we want to use to predict class membership).

  - Explore how much variation is explained by the principal components. How much variation is explained by the first two principal components? How many principal components are required to explain 75%, 85%, 90%, 95%, and 99% of the variation within our dataset?
  - Visually explore this separation to plot the first two principal components and color samples according to Tissue and Disease.status. What effect does plotting the third principal component have on sample separation?
  - Subset the dataset into three disjoint datasets by Tissue. Run PCA on all three of these datasets, plot the first two principal components, and color the dots according to Disease.status. Does there appear to be a meaningful difference in the separation between disease classes between the three different datasets?

3. Feature selection is a commonly performed step in statistics/machine learning to distinguish the most informative variable to use in model creation. There are several different ways to perform feature selection, and many of these can be application specific. In this workshop we'll explain two possible avenues for feature selection in gene expression data analysis: 1) removing the least variable features 2) univariate feature selection

4. Unsupervised learning can be thought of as applying an algorithm to a dataset in order to discover latent structure that exists between samples. We've already been exposed to some of these algorithms via PCA. However, one of the most common techniques in machine learning, and especially bioinformatics, is clustering. Cluster the data using the k-means algorithm.

5. Supervised learning is a technique to teach an algorithm to distinguish between previously labelled groups, such as `Tissue`, `Gender`, or `Disease.status`. However, all supervised methods require data to learn how to differentiate between classes. Therefore, it is necessary to separate data into test/train sets. The training set is used to train the model, while the test set is used to evaluate performance. Cross-validation, a method of partitioning the data into disjoint subsets and continually re-training and re-testing with different partition combinations, is often used to evaluate models. In this section, we will build various classifiers using logistic regression to predict different classes from our data. You should evaluate your models' performances using confusion matrices and accuracy scores.
