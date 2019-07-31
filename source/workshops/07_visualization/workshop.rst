========================================
Workshop 7: Bioinformatic Visualizations
========================================

Instructors: Dakota Hawkins & Emma Briars

Introduction & Overview
~~~~~~~~~~~~~~~~~~~~~~~~

The Data Set
-------------

In today's workshop, we will revisit the data set you worked with in the Machine Learning workshop. As a refresher:  this data set is from the `GSE53987 <https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE53987>`_ dataset on Bipolar disorder (BD) and major depressive disorder (MDD) and schizophrenia:

Lanz TA, Joshi JJ, Reinhart V, Johnson K et al. STEP levels are unchanged in pre-frontal cortex and associative striatum in post-mortem human brain samples from subjects with schizophrenia, bipolar disorder and major depressive disorder. PLoS One 2015;10(3):e0121744. PMID: `25786133 <https://www.ncbi.nlm.nih.gov/pubmed/25786133>`_

This is a microarray data on platform GPL570 (HG-U133_Plus_2, Affymetrix Human Genome U133 Plus 2.0 Array) consisting of 54675 probes.

The raw CEL files of the GEO series were downloaded, `frozen-RMA normalized <https://bioconductor.org/packages/release/bioc/html/frma.html>`_ , and the probes have been converted to HUGO gene symbols using the `annotate package <https://www.bioconductor.org/packages/release/bioc/html/annotate.html>`_ averaging on genes. The sample clinical data (meta-data) was parsed from the `series matrix file <ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE53nnn/GSE53987/matrix/>`_. You can download it `here <https://github.com/BRITE-REU/programming-workshops/blob/master/source/workshops/04_Machine_learning/data/GSE53987_combined.csv>`_.

In total there are 205 rows consisting of 19 individuals diagnosed with BPD, 19 with MDD, 19 schizophrenia and 19 controls. Each sample has gene expression from 3 tissues (post-mortem brain). 
There are a total of 13768 genes (numeric features) and 10 meta features and 1 ID (GEO sample accession).
	* Age
	* Race (W for white and B for black)
	* Gender (F for female and M for male)
	* Ph: pH of the brain tissue
	* Pmi: post mortal interval
	* Rin: RNA integrity number
	* Patient: Unique ID for each patient. Each patient has up to 3 tissue samples. The patient ID is written as disease followed by a number from 1 to 19
	* Tissue: tissue the expression was obtained from.
	* Disease.state: class of disease the patient belongs to: bipolar, schizophrenia, depression or control.
	* source.name: combination of the tissue and disease.state

Workshop Overview 
------------------  

This workshop will walk you through an anlaysis of the GSE53987 microarray data set. This workshop has the following three tasks:

  1. Visualize the demographics of the data set  
  2. Cluster gene expression data and appropriately visualize the cluster results
  3. Compute differential gene expression and visualize the differential expression

Each task has a **required** section and a **bonus** section. Focus on completing the three **required** sections first, then if you have time at the end, revisit the **bonus** sections.  

Finally, as this is your final workshop, we hope that you will this as an opportunity to integrate the different concepts that you have learned in previous workshops. 

Workshop Logistics
--------------------

As mentioned in the pre-workshop documentation, you can do this workshop either in a Jupyter Notebook, or in a python script. Please make sure you have set-up the appropriate environment for youself. This workshop will be completed using "paired-programming" and the "driver" will switch every 15 minutes. Also, we will be using the python plotting libraries matplotlib and seaborn.

Workshop Tasks
~~~~~~~~~~~~~~~

Task 0: Set-Up your environment
-------------------------------- 

Whether you are working in a Jupyter Notebook or directly with a python script, make sure that you have followed the pre-workshop instructions. From there, create a script/notebook and load a few libraries that might be useful:  

.. code-block:: python
	
	# Import Necessary Libraries
	import pandas as pd
	import matplotlib.pyplot as plt
	import seaborn as sns
	import scipy.stats as stats   
  
Task 1: Visualize Dataset Demographics
----------------------------------------

Required Workshop Task
+++++++++++++++++++++++

Use the skeleton code to write 3 plotting functions: 
	#. plot_distribution()
		* Returns a distribution plot object given a dataframe and one observation
	#. plot_relational()
		* Returns a distribution plot object given a dataframe and (x,y) observations
	#. plot_categorical()
		* Returns a categorical plot object given a dataframe and (x,y) observations

Use these functions to produce the following plots:
	#. Histogram of patient ages
	#. Histogram of gene expression for 1 gene
	#. Scatter plot of gene expression for 1 gene by ages
	#. Scatter plot of gene expression for 1 gene by disease state

Your plots should satisfy the following critical components:
	* Axis titles
	* Figure title
	* Legend (if applicable)
	* Be readable

Incorporate the below function skeleton code to complete Task 1.

.. code-block:: python
	
	# Import the data (.csv file) as a data frame
	data = pd.read_csv("/path/to/data/GSE53987_combined.csv", index_col=0)

	# Function to Plot a Distribtion
	def plot_distribution(df, obs1, obs2=''):
		"""
		Create a distribution plot for at least one observation

		Arguments:
			df (pandas data frame): data frame containing at least 1 column of numerical values
			obs1 (string): observation to plot distribution on
			obs2 (string, optional)
		Returns:
			axes object
		"""
		return

	# Function to Plot Relational (x,y) Plots 
	def plot_relational(df, x, y, hue=None, kind=None):
		"""
		Create a plot for an x,y relationship (default = scatter plot)
		Optional functionality for additional observations.

		Arguments:
			df (pandas data frame): data frame containing at least 2 columns of numerical values
			x (string): observation for the independent variable
			y (string): observation for the dependent variable
			hue (string, optional): additional observation to color the plot on
			kind (string, optional): type of plot to create [scatter, line]
		Returns:
			axes object
		"""
		return

	def plot_categorical(df, x, y, hue=None, kind=None):
		"""
		Create a plot for an x,y relationship where x is categorical (not numerical)

		Arguments:
			df (pandas data frame): data frame containing at least 2 columns of numerical values
			x (string): observation for the independent variable (categorical)
			y (string): observation for the dependent variable
			hue (string, optional): additional observation to color the plot on
			kind (string, optional): type of plot to create. Options should include at least: 
			strip (default), box, and violin
		"""
		return

	def main():
		"""
		Generate the following plots:
		1. Histogram of patient ages
		2. Histogram of gene expression for 1 gene
		3. Scatter plot of gene expression for 1 gene by ages 
		4. Scatter plot of gene expression for 1 gene by disease state 
		"""

Bonus Tasks
++++++++++++
	#. Return to these functions and include functionality to customize color palettes, axis legends, etc. You can choose to define your own plotting "style" and keep that consistent for all of your plotting functions.
	#. Faceting your plots. Modify your functions to take in a "facet" argument that when facet is an observation, the function will create a facet grid and facet on that observation. Read more about faceting here <https://seaborn.pydata.org/tutorial/axis_grids.html>`_. Faceting generates multi-plot grids by mapping a dataset onto multiple axes arrayed in a grid of rows and columns that correspond to levels of variables in the dataset.
		* In order to use facteting, your data **must be** in a Pandas DataFrame and it must take the form of what Hadley Whickam calls “tidy” data.
		* In brief, that means your dataframe should be structured such that each column is a variable and each row is an observation. There are figure-level functions (e.g. relplot() or catplot()) that will create facet grids automatically and can be used in place of things like distplot() or scatterplot().

Task 2: Cluster Analysis
--------------------------

Required Workshop Tasks
++++++++++++++++++++++++

Bonus Tasks
++++++++++++

Task 3: Differential Expression Analysis
-----------------------------------------

Required Workshop Tasks
++++++++++++++++++++++++

	#. Use the provided function to perform an ANOVA (analysis of variance) between two groups of data.
	#. Modify the skeleton code to plot box plots for the top 5 differentially expressed genes. You can modify the function you wrote in Task 1. The plot should show the expression of the gene for each sample and seperate out the control v. treatment group.
	#. Modify the skeleton code and use the provided function to plot a volcano plot to visualize both the gene expression fold change and the p-value from the ANOVA.
		- Look at volcano plots in publications/google images. Modify the function so that your plots mirror the expected format.

.. code-block:: python
	
	def differential_expression(data, group_col, features, reference=None):
    """
    Perform a one-way ANOVA across all provided features for a given grouping.
    
    Arguments
    ---------
    
        data : (pandas.DataFrame)
            DataFrame containing group information and feature values.
        group_col : (str)
            Column in `data` containing sample group labels.
        features : (list, numpy.ndarray):
            Columns in `data` to test for differential expression. (e.g. a list of gene names)
        reference : (str, optional)
            Value in `group_col` to use as the reference group. Default is None,
            and the value will be chosen.
            
    Returns
    -------
        pandas.DataFrame
            A DataFrame of differential expression results with columns for
            fold changes between groups, maximum fold change from reference,
            f values, p values, and adjusted p-values by Bonferroni correction.
    """
    if group_col not in data.columns:
        raise ValueError("`group_col` {} not found in data".format(group_col))
    if any([x not in data.columns for x in features]):
        raise ValueError("Not all provided features found in data.")
    if reference is None:
        reference = data[group_col].unique()[0]
        print("No reference group provided. Using {}".format(reference))
    elif reference not in data[group_col].unique():
        raise ValueError("Reference value {} not found in column {}.".format(
                         reference, group_col))
    by_group = data.groupby(group_col)
    reference_avg = by_group.get_group(reference).loc[:,features].mean()
    values = []
    results = {}
    for each, index in by_group.groups.items():
        values.append(data.loc[index, features])
        if each !=  reference:
            key = "{}.FoldChange".format(each)
            results[key] = data.loc[index, features].mean()\
                         / reference_avg
    fold_change_cols = list(results.keys())
    fvalues, pvalues = stats.f_oneway(*values)
    results['f.value'] = fvalues
    results['p.value'] = pvalues
    results['p.value.adj'] = pvalues * len(features)
    results_df = pd.DataFrame(results)
    def largest_deviation(x):
        i = np.where(abs(x) == max(abs(x)))[0][0]
        return x[i]
    results_df['Max.FoldChange'] = results_df[fold_change_cols].apply(
                                       lambda x: largest_deviation(x.values),
                                       axis=1)

    return results_df

	def plot_de_genes(data, sig_col, fc_col, sig_thresh, fc_thresh):
		"""
		Simple script to plot a volcano plot

		Arguments
		---------
		data : (pandas.DataFrame)
				DataFrame containing group information and feature values.
		sig_col : (string)
				Column header in data for column that contains the significance measure (e.g. p value)
		fc_col : (string)
				Column header in data for column that contains the fold change values
		sig_thresh : (int or float)
				Number to draw a threshold line at for significance level cut-off
		fc_thresh : (int or float)
				Number to draw a threshold line at for fold change cut-off
		"""
		ax = sns.scatterplot(x=fc_col, y=sig_col, data=data,
							palette=['black', 'red'], alpha=0.75)
		linewidth = plt.rcParams['lines.linewidth'] - 1
		plt.axvline(x=fc_thresh, linestyle='--', linewidth=linewidth,
					   color='#4D4E4F')
		plt.axvline(x=-fc_thresh, linestyle='--', linewidth=linewidth,
					   color='#4D4E4F')
		plt.axhline(y=sig_thresh, linestyle='--', linewidth=linewidth,
					   color='#4D4E4F')
		ax.legend().set_visible(False)
		ylabel = sig_col
		if sig_col.lower() == 'fdr':
			ylabel = 'False Discovery Rate'
		plt.xlabel("Fold Change")
		plt.ylabel(ylabel)
		for spine in ['right', 'top']:
			ax.spines[spine].set_visible(False)
		plt.tight_layout()
		return ax

.. code-block:: python

	### Skeleton Code
	## Data Pre-Processing
	# Subset the data into different tissue types
	hippocampus = data[data["Tissue"] == "hippocampus"]
	pf_cortex = data[data["Tissue"] == "Pre-frontal cortex (BA46)"]
	as_striatum = data[data["Tissue"] == "Associative striatum"]

	# For one tissue type, reduce the data to just two disease states

	# Get a list of gene names

	## Run Differential Expression Analysis
	# Run differential expression analysis (one-way ANOVA) for 1 tissue type

	## Plot box plots to visualize gene expression across samples for top DE genes
	# Identify the top DE genes
	
	# Melt the data
	
	# Plot box plots
	
	## Visualize DE with a volcano plot 
	##   A volcano plot visualizes the fold change and associated p-value for all genes

Bonus Tasks
++++++++++++
	#. For your box plots, color by disease state and/or other demographics
	#. Plot a heatmap of the gene expression for the top 100 differentially expressed genes in the relevant samples.
