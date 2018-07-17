R Workshop: Machine learning workshop
=====================================================================

In this workshop, we will study `GSE53987 <https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE53987>`_ dataset on Bipolar disorder (BD) and major depressive disorder (MDD) and schizophrenia: 

Lanz TA, Joshi JJ, Reinhart V, Johnson K et al. STEP levels are unchanged in pre-frontal cortex and associative striatum in post-mortem human brain samples from subjects with schizophrenia, bipolar disorder and major depressive disorder. PLoS One 2015;10(3):e0121744. PMID: `25786133 <https://www.ncbi.nlm.nih.gov/pubmed/25786133>`_

This is a microarray data on platform GPL570 (HG-U133_Plus_2, Affymetrix Human Genome U133 Plus 2.0 Array) consisting of 54675 probes.

The raw CEL files of the GEO series were downloaded, `frozen-RMA normalized<https://bioconductor.org/packages/release/bioc/html/frma.html>`_, and the probes have been converted to HUGO gene symbols using the annotate package `<https://www.bioconductor.org/packages/release/bioc/html/annotate.html>`_ averaging on genes. The sample clinical data (meta-data) was parsed from the `series matrix file <ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE53nnn/GSE53987/matrix/>`_. You can download it here:

In total there are 205 rows consisting of 19 individuals diagnosed with BPD, 19 with MDD, 19 schizophrenia and 19 controls. Each sample has gene expression from 3 tissues (post-mortem brain). 
There are a total of 13769 genes (numeric features) and 10 meta features [TODO: explain]. {file=data/GSE53987_combined.csv}

***********************
Data exploration
***********************

1. check all the features, which one is numeric, binominal.. 
* sex is binominal balanced, age can be centeralized, see if the measurements are normally distributed and (we say) what is the normal expected in literature, race is very unbalanced 
* what would the labels be? could be (MDD/BPD/control) or tissue () or combine (9 classes)
* what is the mean age of each disease?  boxplots

2. plot PCA, (we give them) code for plotting, color by disease, tissue, race, sex ...
* repeat for each tissue (which tissue is more predective)
* repeat for each disease... 

3. feature selection
- by DE 
- by PCA weights 
- by variability (limma)
- fisher's criteria 
* how many genes did you get? 

4. correlation matrix 

***********************
Unsupervised learning
***********************
5. clustering
* hierarichal (heatmap)
* k-means with k in {3,9,12} (use cluster on pca plot)
* tell them xmeans finds the "best" k
* is age correlated to the disease? 

6. association rules

***********************
Supervised learning
***********************

7. learning models (on 2 sets of labels)
* logistic regression, naive bayes, SVM

8. rapidminer KNN-GBT-Rule induction


