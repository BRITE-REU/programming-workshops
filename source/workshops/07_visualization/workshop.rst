Introduction
============

Welcome to the in-class portion of the visualization workshop in Python! Feel
free to work in either a Jupyter Notebook or a typical text editor/IDE,
depending on your preference.

If you would like to use a Notebook, you can download that here:

:download:`Notebook <files/workshop.ipynb>`

Otherwise, you can follow along here and use the following skeleton code
provided in a Python file:


:download:`Python <files/workshop.py>`.


In case you don't finish, there are, of course, solutions provided:


:download:`Notebook Solutions<files/solutions.ipynb>`.


:download:`Python Solutions<files/solutions.py>`.

With that out of the way, let's get started!

The Data Set
------------

In today’s workshop, we will revisit the data set you worked with in the
Machine Learning workshop. As a refresher: this data set is from the
GSE53987 dataset on Bipolar disorder (BD) and major depressive disorder
(MDD) and schizophrenia:

Lanz TA, Joshi JJ, Reinhart V, Johnson K et al. STEP levels are
unchanged in pre-frontal cortex and associative striatum in post-mortem
human brain samples from subjects with schizophrenia, bipolar disorder
and major depressive disorder. PLoS One 2015;10(3):e0121744. PMID:
25786133

This is a microarray data on platform GPL570 (HG-U133_Plus_2, Affymetrix
Human Genome U133 Plus 2.0 Array) consisting of 54675 probes.

The raw CEL files of the GEO series were downloaded, frozen-RMA
normalized, and the probes have been converted to HUGO gene symbols
using the annotate package averaging on genes. The sample clinical data
(meta-data) was parsed from the series matrix file. You can download it
**here**.

In total there are 205 rows consisting of 19 individuals diagnosed with
BPD, 19 with MDD, 19 schizophrenia and 19 controls. Each sample has gene
expression from 3 tissues (post-mortem brain). There are a total of
13768 genes (numeric features) and 10 meta features and 1 ID (GEO sample
accession):

-  Age
-  Race (W for white and B for black)
-  Gender (F for female and M for male)
-  Ph: pH of the brain tissue
-  Pmi: post mortal interval
-  Rin: RNA integrity number
-  Patient: Unique ID for each patient. Each patient has up to 3 tissue
   samples. The patient ID is written as disease followed by a number
   from 1 to 19
-  Tissue: tissue the expression was obtained from.
-  Disease.state: class of disease the patient belongs to: bipolar,
   schizophrenia, depression or control.
-  source.name: combination of the tissue and disease.state

Workshop Goals
--------------

| This workshop will walk you through an analysis of the GSE53987
  microarray data set. This workshop has the following three tasks:
| 1. Visualize the demographics of the data set
| 2. Cluster gene expression data and appropriately visualize the
  cluster results 3. Compute differential gene expression and visualize
  the differential expression

Each task has a **required** section and a **bonus** section. Focus on
completing the three **required** sections first, then if you have time
at the end, revisit the **bonus** sections.

Finally, as this is your final workshop, we hope that you will this as
an opportunity to integrate the different concepts that you have learned
in previous workshops.

Workshop Logistics
------------------

As mentioned in the pre-workshop documentation, you can do this workshop
either in a Jupyter Notebook, or in a python script. Please make sure
you have set-up the appropriate environment for youself. This workshop
will be completed using “paired-programming” and the “driver” will
switch every 15 minutes. Also, we will be using the python plotting
libraries matplotlib and seaborn.

TASK 0: Import Libraries and Data
---------------------------------

-  Download the data set (above) as a .csv file
-  Initialize your script by loading the following libraries.

.. code:: python3

    # Import Necessary Libraries
    import pandas as pd
    import numpy as np
    import seaborn as sns
    from sklearn import cluster, metrics, decomposition
    from matplotlib import pyplot as plt
    import itertools
    data = pd.read_csv('GSE53987_combined.csv', index_col=0)
    genes = data.columns[10:]

TASK 1: Visualize Dataset Demographics
--------------------------------------

Required Workshop Task:
~~~~~~~~~~~~~~~~~~~~~~~

Use the skeleton code to write 3 plotting functions:
''''''''''''''''''''''''''''''''''''''''''''''''''''

::

   1. plot_distribution()  
       - Returns a distribution plot object given a dataframe and one observation
   2. plot_relational()
       - Returns a distribution plot object given a dataframe and (x,y) observations  
   3. plot_categorical()
       - Returns a categorical plot object given a dataframe and (x,y) observations

Use these functions to produce the following plots:
'''''''''''''''''''''''''''''''''''''''''''''''''''

::

   1. Histogram of patient ages
   2. Histogram of gene expression for 1 gene
   3. Scatter plot of gene expression for 1 gene by ages 
   4. Scatter plot of gene expression for 1 gene by disease state 

| Your plots should satisfy the following critical components:
| - Axis titles - Figure title - Legend (if applicable) - Be readable

Bonus Task:
~~~~~~~~~~~

1. Return to these functions and include functionality to customize
   color palettes, axis legends, etc. You can choose to define your own
   plotting “style” and keep that consistent for all of your plotting
   functions.
2. Faceting your plots. Modify your functions to take in a “facet”
   argument that when facet is an observation, the function will create
   a facet grid and facet on that observation. Read more about faceting
   here: Faceting generates multi-plot grids by **mapping a dataset onto
   multiple axes arrayed in a grid of rows and columns that correspond
   to levels of variables in the dataset.**

   -  In order to use facteting, your data **must be** in a Pandas
      DataFrame and it must take the form of what Hadley Whickam calls
      “tidy” data.
   -  In brief, that means your dataframe should be structured such that
      each column is a variable and each row is an observation. There
      are figure-level functions (e.g. relplot() or catplot()) that will
      create facet grids automatically and can be used in place of
      things like distplot() or scatterplot().

.. code:: python3

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
        fig, ax = plt.subplots()
        return ax
    
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
        fig, ax = plt.subplots()
        return ax
    
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
        fig, ax = plt.subplot()
        return ax
    
    def main():
        """
        Generate the following plots:
        1. Histogram of patient ages
        2. Histogram of gene expression for 1 gene
        3. Scatter plot of gene expression for 1 gene by ages 
        4. Scatter plot of gene expression for 1 gene by disease state 
        """
        

TASK 2: Differential Expression Analysis
----------------------------------------

Differential expression analysis is a fancy way of saying, “We want to
find which genes exhibit increased or decreased expression compared to a
control group”. Neat. Because the dataset we’re working with is
MicroArray data – which is mostly normally distributed – we’ll be using
a simple One-Way ANOVA. If, however, you were working with sequence data
– which follows a Negative Binomial distribution – you would need more
specialized tools. A helper function is provided below.

.. code:: python3

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
                Columns in `data` to test for differential expression. Having them
                be gene names would make sense. :thinking:
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
                                           lambda x: largest_deviation(x.values), axis=1)
    
        return results_df  

.. code:: python3

    # Here's some pre-subsetted data
    hippocampus = data[data["Tissue"] == "hippocampus"]
    pf_cortex = data[data["Tissue"] == "Pre-frontal cortex (BA46)"]
    as_striatum = data[data["Tissue"] == "Associative striatum"]
    # Here's how we can subset a dataset by two conditions.
    # You might find it useful :thinking:
    data[(data["Tissue"] == 'hippocampus') & (data['Disease.state'] == 'control')]



Task 2a: Volcano Plots
~~~~~~~~~~~~~~~~~~~~~~

Volcano plots are ways to showcase the number of differentially
expressed genes found during high throughput sequencing analysis. Log
fold changes are plotted along the x-axis, while p-values are plotted
along the y-axis. Genes are marked significant if they exceed some
absolute Log fold change theshold **as well** some p-value level for
significance. This can be seen in the plot below.

.. image:: images/volcanoplot.png

Your first task will be to generate some Volcano plots:

**Requirments** 1. Use the provided function to perform an ANOVA
(analysis of variance) between control and experimental groups in each
tissue. - Perform a separate analysis for each tissue. 2. Implement the
skeleton function to create a volcano plot to visualize both the log
fold change in expression values and the adjusted p-values from the
ANOVA 3. Highlight significant genes with distinct colors

.. code:: python3

    def volcano_plot(data, sig_col, fc_col, sig_thresh, fc_thresh):
        """
        Generate a volcano plot to showcasing differentially expressed genes.
        
        Parameters
        ----------
            data : (pandas.DataFrame)
                A data frame containing differential expression results
            sig_col : str
                Column in `data` with adjusted p-values.
            fc_col : str
                Column in `data` with fold changes.
            sig_thresh : str
                Threshold for statistical significance.
            fc_thresh
        """
        return ax

Task 2b: Plot the Top 1000 Differentially Expressed Genes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Clustered heatmaps are hugely popular for displaying differences in gene
expression values. To reference such a plot, look back at the
introductory material. Here we will be plotting the 1000 most
differentially expressed genes for each of the analysis performed
before.

**Requirements** - Implement the skeleton function below - Z normalize
gene values - Use a diverging and perceptually uniform colormap -
Generate plots for each of the DE results above

**Hint**: Look over all the options for
`sns.clustermap() <https://seaborn.pydata.org/generated/seaborn.clustermap.html>`__.
It might make things easier.

.. code:: python3

    def heatmap(data, genes, group_col):
        """[summary]
        
        Parameters
        ----------
        data : pd.DataFrame
            A (sample x gene) data matrix containing gene expression values for each sample.
        genes : list, str
            List of genes to plot   
        """
        return ax

**Bonus** There’s nothing denoting which samples belong to which
experimental group. Fix it.

*Bonus hint*: Look real close at the documentation.

TASK 3: Clustering Analysis
---------------------------

You’ve seen clustering in the previous machine learning workshop. Some
basic plots were generated for you, including plotting the clusters on
the principle componets. While we can certainly do more of that, we will
also be introducing two new plots: elbow plots and silhouette plots.

Elbow Plots
~~~~~~~~~~~

Elbow plots are plots that are used to help diagnose the perennial
question of K-means clustering: how do I chose K? To create the graph,
you plot the number of clusters on the x-axis and some evaluation of
“cluster goodness” on the y-axis. Looking at the name of the plot, you
might guess that we’re looking for an “elbow”. This is the point in the
graph when we start getting diminished returns in performance, and
specifying more clusters may lead to over-clustering the data. An
example plot is shown below.

.. image:: images/elbowplot.jpg

You can see the K selected (K = 3), is right before diminishing returns
start to kick in. Mathematically, this point is defined as the point in
which curvature is maximized. However, the inflection point is also a
decent – though more conservative – estimate. However, we’ll just stick
to eye-balling it for this workshop. If you would like to know how to
automatically find the elbow point, more information can be found
`here <https://raghavan.usc.edu/papers/kneedle-simplex11.pdf>`__

Task 2a: Implement a function that creates an elbow plot
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Skeleton code is provided below. The function expects a list of k-values
and their associated scores. An optional “ax” parameter is also
provided. This parameter should be an axes object and can be created by
issueing the following command:

``ax = plt.subplot()``

While we won’t need the parameter right now, we’ll likely use it in the
future.

**Function Requirements** - Generate plot data by clustering the entire
dataset on the first 50 principle components. Vary K values from 2 - 10.
- While you’ve been supplied a helper function for clustering, you’ll
need to supply the principle components yourself. Refer to your machine
learning workshop along with the scikit-learn
`documentation <https://scikit-learn.org/stable/modules/generated/sklearn.decomposition.PCA.html>`__
- Plots each k and it’s associated value. - Plots lines connecting each
data point. - Produces a plot with correctly labelled axes.

**Hint:** Working with an axis object is similar to base matplotlib,
except ``plt.scatter()`` might become something like ``ax.scatter()``.

Helper Function
^^^^^^^^^^^^^^^

.. code:: python3

    def cluster_data(X, k):
        """
        Cluster data using K-Means.
        
        Parameters
        ----------
            X : (numpy.ndarray)
                Data matrix to cluster samples on. Should be (samples x features).
            k : int
                Number of clusters to find.
        Returns
        -------
            tuple (numpy.ndarray, float)
                A tuple where the first value is the assigned cluster labels for
                each sample, and the second value is the score associated with
                the particular clustering.
        """
        model = cluster.KMeans(n_clusters=k).fit(X)
        score = model.score(X)
        return (model.labels_, score)

Task 2a Implementation
^^^^^^^^^^^^^^^^^^^^^^

.. code:: python3

    def elbow_plot(ks, scores, best=None, ax=None):
        """
        Create a scatter plot to aid in choosing the number of clusters using K-means.
        
        
        Arguments
        ---------
            ks : (numpy.ndarray)
                Tested values for the number of clusters.
            scores: (numpy.ndarray)
                Cluster scores associated with each number K.
            ax: plt.Axes Object, optional
        """
        if ax is None:
            ax = plt.subplot()
        return ax

Once you’ve created the base plotting function, you’ll probably realize
we have no indivation of where the elbow point is. Fix this by adding
another optional parameter (``best``) to your function. The parameter
``best`` should be the K value that produces the elbow point.

**Function Requirements**

-  Add an optional parameter ``best`` that if supplied denotes the elbow
   point with a vertical, dashed line.
-  If ``best`` is not supplied, the plot should still be produced but
   without denoting the elbow point.

**Hint**: ``plt.axvline`` and ``plt.axhline`` can be used to produce
vertical and horizontal lines, respectively. More information
`here <https://matplotlib.org/3.1.1/api/_as_gen/matplotlib.pyplot.axvline.html>`__

**Note**: You are not required to have the line end at the associated
score value.

.. code:: python3

    def elbow_plot(ks, scores, best=None, ax=None):
        """
        Create a scatter plot to aid in choosing the number of clusters using K-means.
        
        
        Arguments
        ---------
            ks : (numpy.ndarray)
                Tested values for the number of clusters.
            scores: (numpy.ndarray)
                Cluster scores associated with each number K.
            best: int, optional
                The best value for K. Determined by the K that falls at the elbow. If
                passed, a black dashed line will be plotted to indicate the best.
                Default is no line.
            ax: plt.Axes Object, optional
        """
        if ax is None:
            fig, ax = plt.subplots()
        return ax

Silhouette Plots
~~~~~~~~~~~~~~~~

Silhouette plots are another way to visually diagnose cluster
performance. They are created by finding the `silhouette
coefficient <https://en.wikipedia.org/wiki/Silhouette_(clustering)>`__
for each sample in the data, and plotting an area graph for each
cluster. The silhouette coefficient measures how well-separated clusters
are from each other. The value ranges from :math:`[-1 , 1]`, where 1
indicates good separation, 0 indicates randomness, and -1 indicates
mixing of clusters. An example is posted below.

|image0|

As you can see, each sample in each cluster has the area filled from
some minimal point (usually 0 or the minimum score in the dataset) and
clusters are separated to produce distinct
`silhouettes <https://www.youtube.com/watch?v=-TcUvXzgwMY>`__.

Task 3b: Implement a function to plot silhouette coefficients
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Because the code for create a silhouette plot can be a little bit
involved, we’ve created both a skeleton function with documentation, and
provided the following pseudo-code:

::

   - Calculate scores for each sample.
   - Get a set of unique sample labels.
   - Set a score minimum
   - Initialize variables y_lower, and y_step
       - y_lower is the lower bound on the x-axis for the first cluster's silhouette
       - y_step is the distance between cluster silhouettes
   - Initialize variable, breaks
       - breaks are the middle point of each cluster silhouette and will be used to
         position the axis label
   - Interate through each cluster label, for each cluster:
       - Calcaluate the variable y_upper by adding the number of samples
       - Fill the area between y_lower and y_upper using the silhoutte scores for
         each sample
       - Calculate middle point of y distance. Append the variable break.
       - Calculate new y_lower value
   - Label axes with appropriate names and tick marks
   - Create dashed line at the average silhouette score over all samples

**Hint**: you might find
`ax.fill_betweenx() <https://matplotlib.org/3.1.1/api/_as_gen/matplotlib.axes.Axes.fill_betweenx.html>`__
and
`ax.set_yticks() <https://matplotlib.org/3.1.1/api/_as_gen/matplotlib.axes.Axes.set_yticks.html?highlight=set_yticks#matplotlib.axes.Axes.set_yticks>`__/
`ax.set_yticklabels() <https://matplotlib.org/3.1.1/api/_as_gen/matplotlib.axes.Axes.set_yticklabels.html?highlight=set_yticklabels#matplotlib.axes.Axes.set_yticklabels>`__
useful.

.. |image0| image:: https://scikit-plot.readthedocs.io/en/stable/_images/plot_silhouette.png

.. code:: python3

    def silhouette_plot(X, y, ax=None):
        """
        Plot silhouette scores for all samples across clusters. 
        
        Parameters
        ----------
        X : numpy.ndarray
            Numerical data used to cluster the data.
        y : numpy.ndarray
            Cluster labels assigned to each sample.
        ax : matplotlib.Axes
            Axis object to plot scores onto. Default is None, and a new axis will
            be created.
        
        Returns
        -------
        matplotlib.Axes
        """
        if ax is None:
            ax = plt.subplot()
        scores = metrics.silhouette_samples(X, y)
        clusters = sorted(np.unique(y))
        score_min = 0
        y_lower, y_step = 5, 5
        props = plt.rcParams['axes.prop_cycle']
        colors = itertools.cycle(props.by_key()['color'])
        breaks = []
        for each, color in zip(clusters, colors):
            # Aggregate the silhouette scores for samples, sort scores for
            # area filling
        return ax

Task 3C: Put it all together!
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Requirements** - Create a function ``cluster_and_plot`` that will
cluster a provided dataset for a range of k-values - The function should
return a single figure with two subplots: - An elbow plot with the
“best” K value distinguished - A silhouette plot associated with
clustering determined by the provided K value. - Appropriate axes labels

**Hint**: You will likely find
`plt.subplots() <https://matplotlib.org/3.1.1/api/_as_gen/matplotlib.pyplot.subplots.html?highlight=subplots#matplotlib.pyplot.subplots>`__
useful.

.. code:: python3

    def cluster_and_plot(X, best=3, kmax=10):
        """
        Cluster samples using KMeans and display the results.
        
        Results are displayed in a (1 x 2) figure, where the
        first subplot is an elbow plot and the second subplot
        is a silhouette plot.
        
        Parameters
        ----------
            X : (numpy.ndarray)
                A (sample x features) data matrix used to cluster
                samples.
            best : int, optional
                Final value of K to use for K-Means clustering.
                Default is 3.
            kmax : int, optional
                Maximum number of clusters to plot in the elbow
                plot. Default is 10.
        Returns
        -------
            matplotlib.Figure
                Clustering results.
        """
        fig, axes = plt.subplots(nrows=1, ncols=2)
        return fig
=======
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

Utilize the below functions in skeleton code to complete Task 1.

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
