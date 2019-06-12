R Workshop: RNA-seq Airway Data and Differential Expression Analysis
=====================================================================

In this workshop, we will focus on learning how to load packages, import data, perform exploratory analysis with built in functions as well as functions from packages installed, performing differential expression analysis of RNA-seq data with the DESeq2 package, and visualizing the results using ggplot2. 

We will work in R Markdown, a .Rmd file written in markdown and contains chunks of embedded R code. 

You can dowload the R Mardown file and two csv files containing count data (airway_scaledcounts.csv) and meta data file (airway_metadata.csv) from here:

1. `R_Workshop.Rmd <https://github.com/BRITE-REU/programming-workshops/tree/master/source/workshops/02_R/files/R_Workshop.Rmd>`_
2. `BRITE students <https://raw.githubusercontent.com/BRITE-REU/programming-workshops/master/source/workshops/01_linux_bash_scc/files/BRITE_students.txt>`_
3. `Geekfile <https://raw.githubusercontent.com/BRITE-REU/programming-workshops/master/source/workshops/01_linux_bash_scc/files/geekfile.txt>`_

***********************
Load Packages
***********************
We will begin by loading the necessary packages: 

Go ahead and install these packages using install.packages():

- readr

- ggplot2

- dplyr

- magrittr

We will use packages from the bioconductor repository, which provides tools for analysis of high-throughput genomic data.

source("https://bioconductor.org/biocLite.R")

Use bioclite("package_name") function to install packages SummarizedExperiment, DESeq2 and airway.

Note: If package base is not already installed, please install that as well.

.. code:: R
   
   packages <- c("readr", "ggplot2", "dplyr", "magrittr")
   install.packages(packages, dependencies = TRUE)

   source("https://bioconductor.org/biocLite.R")
   biocLite("SummarizedExperiment", dependencies = TRUE)
   biocLite("DESeq2", dependencies = TRUE)
   biocLite("airway", dependencies = TRUE)




Load these libraries using library("package_name") function:

.. code:: R
   
   #library(base) in case it's not loaded
   library(readr)
   library(dplyr)
   library(ggplot2)
   library(magrittr)
   library(SummarizedExperiment)
   library(DESeq2)
   library(airway)


***********************
Import Airway Data
***********************

If you have not downloaded the R_Workshop folder already, please do that now. 

Let's begin first by setting our working directory. Set your working directory to where the R_Workshop folder is located on your computer.

.. code:: R

   #Find working directory
   getwd()

   #Set working directory path
   setwd("/Users/tanyatk/Desktop/R_Workshop/")

   #Check working directory again
   getwd()


Today we will work with the airway dataset. This data set comes from an RNA-Seq experiment, a high throughput sequencing method, on four human airway smooth muscle cell lines treated and untreated with dexamethasone. We will work with read counts or expression matrix for this dataset (i.e. processed files). 

Note: The sequencing files of this experiment are available on the GEO database with GEO Series Number GSE52778, and can be downloaded using SRA toolkit.

Use the read_csv("file") function from package readr to import the airway_scalecounts.csv (count data) and airway_metadata.csv (meta data) files from the downloaded folder R_Workshop.

.. code:: R

   #User read_csv() function to import airway_scaledcounts.csv and airway_metadata.csv files into R


Use base functions to describe and look at the airway data: scaledcounts and metadata.

- dim() - Dimensions

- head() - Print first lines of data

- tail() - Print last few lines of data

- str() - Describe data object structure and information


.. code:: R

   #Use base functions to gain an initial view of the data


This data set is also available in a package called "airway" in bioconductor. It is saved as an S4 object (object oriented programming) that contains the count data, meta data, and other information important to the data in fields or slots in the object. To load the airway data we can use the data("data_name") function and call airway to add the dataset to our workspace.

You'll notice that the class is called RangedSummarizedExperiment (i.e. an S4 object), which is used to store matrices of experimental results such as the count data and meta data. This class is from the SummarizedExperiment package which is used often to store sequencing and microarray data.

.. code:: R

   #call airway data using data() and print airway data to save to workspace



Since we imported the same data set twice, we can remove data from our workspace using the rm() function.

Let's remove the variables scaledcounts and metadata from our workspace. We'll keep the airway object since it will be easier to work with for downstream analysis.

.. code:: R

   #remove scaledcounts and metadata variable


**********************
Explore Airway Dataset
**********************

Let's first do some preliminary work with the airway dataset. The sample/metadata information is saved under the slot colData which can be extracted using airway@colData or colData(airway). 

First check the data structure of the colData(airway) dataset.

Hint: Built in functions to check data structure

Let's set colData(airway) as a data frame. 

Hint: We will use the as.data.frame() function to do this. 

.. code:: R

   #Check mode of colData(airway) and make change the structure to a data frame.



The count data is saved under the slot assay. We can extract the count matrix by calling airway@assay or assay(airway). We can also use descriptive statistics to look at the expression acrosss samples. We will sum the expression of each column and scale by 1e6 to get scaled expression value. We will then use the summary() function to look at the range of expression between the samples. 

Determine a way to sum the expression of each column.

Hint: You can use a for loop, apply function, or base functions such as colSums()

.. code:: R

   #Sum the expression of each column, divide by 1e6
   #Use summary function to see the range of values between each sample


*********************************************
Differential Expression Analysis using DESeq2
*********************************************

We will use DESeq2 package for differential expression analysis of the airway data set to find differentially expressed genes between untreated and treated samples. We will first load DESeq2 and set up the data to be compatible with DESeq by using the function DESeqDataSet(). 

We can use the help("function_name") or ?function_name to look up the function to get a description.

A description or help pages will show up under the Help tab in the bottom right corner.

.. code:: R

   #Look up DESeqDataSet() function description 


We can also go to the bioconductor page for DESeq2 and look at the manual for functions as well as a tutorial of using the package itself. Click here to see the `page <https://bioconductor.org/packages/release/bioc/html/DESeq2.html>`_.

The function DESeqDataSet includes an argument called design which asks for a formula that expresses how the counts for each gene depends on the variables in colData. In this case we choose variables cell and dex because we care about the cell line and which samples are treated with dexamethasone versus which samples are untreated controls.  

.. code:: R

   DE_airway <- DESeqDataSet(airway, design = ~ cell + dex)

   DE_airway


Before we continue, we must set our control group as our reference level for comparison in our differential expression analysis. 

.. code:: R

   DE_airway@colData$dex <- relevel(DE_airway@colData$dex, ref = "untrt")


Now we wil run the differential expression analysis steps through the function DESeq(). Again we can look up the function to learn more about what it does and the arguments needed to run it. We use the results() function to generate a results table with log2 fold changes, p values and adjusted p values for each gene. The log2 fold change and the Wald test p value is based on the last variable in the design formula, in this case variable dex. Therefore our results will show which genes are differentially expressed between the untreated and treated groups.  

.. code:: R
   
   help("DESeq")

   DE_airway <- DESeq(DE_airway)
   res <- results(DE_airway) 

   res


How do we order the results table (res) based on the p-value? 
There are already available functions in R that we can use to sort the dataframe.
Hint: Use function order() to order the rows based on p-value

.. code:: R

   #Use order() to order the results table based on the p-value



In DESeq2, the function plotMA generates an MA Plot commonly used to visualize the differential expression results. The plot shows the log2 fold changes attributable to a given variable over the mean of normalized counts for all the samples in the DESeqDataSet. Points represent genes and will be colored red if the adjusted p value is less than 0.1. Points which fall out of the window are plotted as open triangles pointing either up or down.

.. code:: R

  plotMA(res, ylim=c(-2,2))



*********************************
Manipulate and Visualize Results
*********************************

Let's add a column that tell us whether each gene is significant. Using the mutate() function from library dplyr, we can add a column showing whether the significance is TRUE or FALSE based on cutoff padj < 0.01.

.. code:: R

   #change res to a tibble format to work with dplyr

   res <- tbl_df(res)

   #add sig column to show which genes are significant or not by using mutate() from dplyr

   res <- mutate(res, sig=padj<0.01)

   # We can use the symbol %>% from library magrittr to represent a pipe. Pipes take the output from one function and feed it to the first argument of the next function. You may have seen something similar in unix with |

   res <- res %>% mutate(sig=padj<0.01)

   head(res)



Let's use the filter() function from dplyr to filter out results based on padj < 0.01, and write this to a csv file using write_csv() function from readr.

Try using piping format %>% to do this!

.. code:: R

   # Filter res based on cutoff padj < 0.01 and save this result into a csv file called significant_results.csv



What if we want to generate our own plots? We can use ggplot2 to create our own volcano plot of the differential expression results between the untreated and treated groups. 

Now let's try generating a volcano plot using ggplot2?

Hint: log2FoldChange for x-axis, -1*log10(pvalue) for y-axis, sig to color the points.

Make sure to include argument for points and include the title "Volcano plot"

Bonus: Change the axis titles to something more readable and change the point shapes, or play around with any other parameters to get a feel for how ggplot2 works.  

.. code:: R

   #Create Volcano plot using ggplot2



How would you generate the same MA plot above using ggplot2? 
Hint: Use baseMean for x-axis, log2FoldChange for y-axis, sig for color. 

Make sure to have points and to use a log10 scale for the x-axis (i.e. scale_x_log10() ).

Add the title "MA plot" to your plot as well.


.. code:: R
   
   #Create MA plot using ggplot2




We can look at our session information including the packages we loaded and worked with. 

.. code:: R

   sessionInfo()
