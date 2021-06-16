R Workshop: RNA-seq Airway Data and Differential Expression Analysis
=====================================================================

In this workshop, we will focus on learning how to load packages, import data, perform exploratory analysis with built in functions as well as functions from packages installed, performing differential expression analysis of RNA-seq data with the DESeq2 package, and visualizing the results using ggplot2.

We will work in R Markdown, a .Rmd file written in markdown and contains chunks of embedded R code.

The R Mardown file and two csv files containing count data (airway_scaledcounts.csv) and meta data file (airway_metadata.csv) can be downloaded from here:

1. `airway_metadata.csv <https://github.com/BRITE-REU/programming-workshops/tree/master/source/workshops/02_R/files/airway_metadata.csv>`_
2. `airway_scaledcounts.csv <https://github.com/BRITE-REU/programming-workshops/tree/master/source/workshops/02_R/files/airway_scaledcounts.csv>`_
3. `Workshop R Markdown file <https://github.com/BRITE-REU/programming-workshops/tree/master/source/workshops/02_R/files/R_Workshop.Rmd>`_


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
   biocLite("enrichR", dependencies = TRUE)


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
   library(enrichR)


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

Use the read.csv("file") function to import the airway_scalecounts.csv (count data) and airway_metadata.csv (meta data) files from the downloaded folder R_Workshop.

.. code:: R

   # Use read.csv() function to import airway_scaledcounts.csv and airway_metadata.csv files into R
   scaledcounts <- read.csv("airway_scaledcounts.csv")
   metadata <-  read.csv("airway_metadata.csv")


Use base functions to describe and look at the airway data: scaledcounts and metadata.

- dim() - Dimensions

- head() - Print first lines of data

- tail() - Print last few lines of data

- str() - Describe data object structure and information


.. code:: R

   # 1 Use base functions to gain an initial view of the data

   # 2 Look at scaledcounts variable
   
   # 3 Look at metadata variable

***********************
Working with `data.frame` objects
***********************

Looking at `scaledcounts` we can see that the first column, "ensgene", gives the gene identifier for each gene, while each successive column gives the expression values for this gene.

.. code:: R

    # Use the `ensgene` column to extract the gene expression values for "ENSG00000002549".

This is okay, but it's a little clunky. Alternatively we can set the gene identifiers as row names to index rows directly.

.. code:: R

    # 1 Set the gene identifiers to row names in `scaledcounts`.

    # 2 Remove the `ensgene` column.

    # 3 Extract the gene expression values using the string "ENSG00000002549" directly.

***********************
Asking R for help
***********************

Alternative to steps 1 + 2 above, we could have set gene identifiers to row names when we read in the file.

.. code:: R

    # 1 Look up the help page for `read.csv()` using `?read.csv`, scroll down to the `row.names` in the "Arguments" section.
    
    # 2 Use these instructions to reread in `scaledcounts` and set the gene identifiers to row names automatically.

***********************
Working with `matrix` objects
***********************

The main difference between a `data.frame` object and a `matrix` object is that each column of a `data.frame` is free to have it's own format, whereas all values within an entire `matrix` must have the same format (e.g. all numbers). One nice thing about `matrix` objects is that functions in R can be applied to all values at once. Note, that after setting the gene identifiers to row names, all values in `scaledcounts` are now numbers.

For gene expression, it is common to work with log-scaled count data because these tend to adhere more closely to normal distributions than count data. The one caveat to this that log(0) = -Inf. To overcome this, it is common practice to add a small value prior to performing log-transformations, most commonly by adding one to every value, log(1) = 0.

.. code:: R

    # 1 Use the `as.matrix()` function to convert `scaledcounts` to a matrix.

    # 2 Add a pseudocount to every value.

    # 3 Use the `log2()` function to log-scale the matrix.

***********************
Running simple comparative statistical analyses
***********************

In bioinformatics, we frequently want to perform statistical tests to find genes with a significant deviation in expression patterns across experimental conditions, for example genes that seem to be down-regulated in tumors compared to normal cells. Later in this workshop, we will use a fancy Bioconductor package (*DESeq2*) to run differential gene expression analysis.  This type of analysis is common when analyzing high-throughput data, and it has the following basic steps:

1. Extract the expression values for a single gene.
2. Compare the mean expression between two groups using a statistical test.
3. Repeat steps 1 + 2 for every gene.

***********************
Running one test
***********************

The t-test is a common choice for performing a differential analysis. Next we will perform a simple differential test comparing treated and control groups in our gene expression data. The "dex" column in `metadata` gives group values for treated and control samples.

.. code:: R

    # 1 Create a new data.frame called `genedata` with two columns: 1) log-transformed expression values of "ENSG00000002549" and 2) group values from the "dex" variable. Call the columns "ex" and "group", respectively.

    # 2 Run the following to use the `t.test()` function to compare the log transformed expression values between treated and control samples with pooled variance (var.equal = TRUE).


Note that the syntax at the begining of this function, you will see it a lot.  Look up ?formula for more information. This is common in functions for statistical modelling, as well as base R plotting functions.  For example, instead of running a t-test we could run a linear model.

.. code:: R

    lmRes <- lm(ex ~ group, data = genedata)
    print(summary(lmRes))

Note, that the p-value for the linear model is equal to the p-value for the t-test.  This is because simple linear regression models are equivalent to a t-test with pooled variance.

We can use a similar syntax to create boxplots of the expression values for either group with the `boxplot()` function.

.. code:: R

    boxplot(ex ~ group, data = genedata)

As we can see, the difference in mean is very small relative to the variance, hence the large p-value.

***********************
Wrapper functions
***********************

What if we want to run a t-test on any gene? We can greatly reduce the amount of code we need to write by writing a function that takes a gene identifier as an argument, runs the t-test, and returns information we are interested in. For example, below is a function that takes the arguments, `geneid` and returns a vector with two values: the difference in mean and p-value.

.. code:: R

    # Function to run ttest for a given gene ID
    ttestGene <- function(geneid) {

        # Create data matrix
        genedata <- data.frame(ex = scaledcounts[geneid,], group = metadata$dex)

        # Run t-test
        ttestRes <- t.test(ex ~ group, data = genedata)

        # Get difference in mean
        diffMean <- ttestRes$estimate[2] - ttestRes$estimate[1]

        # Get difference and p-value
        results <- c(diffMean, pvalue = ttestRes$p.value)

        # Given these values a name
        names(results) <- c("diff", "pvalue")

        return(results)
    }

    # Run it on "ENSG00000002549"
    ttestGene("ENSG00000002549")

***********************
The apply() Family of Functions
***********************

In order to run this function on every gene in our dataset, we will turn to a family of R functions called the apply functions. These functions are very useful in a wide variety of contexts, so before we get into how we will use them here, let's take time to have a thorough introduction to how they work and why we might use them.

.. code:: R

    x <- list(c(1,5,4,8), c(2,45,7,4,2,6), c(5,347,1))
    # if we want the mean of each of these vectors, we might write a for loop like this
    means <- c()
    for (i in 1:length(x)) {
      means[i] <- mean(x[[i]])
    }
    means
    # output: [1]   4.5000  11.0000 117.6667

For annoying reasons we won't get into right now, R is very bad at handling for loops; when the thing you're looping over gets appreciably large, it takes ages and ages to execute the loop. Consequently, people do all sorts of things to avoid writing for loops in R, and apply functions are often a great alternative. The general idea of all apply functions is passing one argument that is some iterable object, like a vector or list, and some function that you want to be called on each element of that vector/list.

.. code:: R
    lapply(x, mean)
    # output: 
    # [[1]]
    # [1] 4.5

    # [[2]]
    # [1] 11

    # [[3]]
    # [1] 117.6667

In addition to avoiding the potentially inefficient for loop, note that we've also written much less code to accomplish the same thing.
The l in lapply stands for list, so it returns a list with one element for each element of the input object. This can be helpful when the function you're applying returns multiple things, but in our case it makes the output slightly more messy/complicated than it needs to be. Fortunately, we can use sapply to simplify the output (the s stands for simplify):

.. code:: R
    sapply(x, mean)
    # output: [1]   4.5000  11.0000 117.6667

Now we've perfectly replicated the behavior of our for loop in much less code. The full extent of what sapply does when it "simplifies" output it a bit complicated, but much of the time it generally does what you expect/want.

It is often handy to use apply functions to work with lists/vectors/dataframe columns of strings. Let's say we're trying to strip the prefixes off of these gene IDs:

.. code:: R
    genes = c("ENSG00000166411", "ENSG00000143311", "ENSG00039457411")
    # to get just one gene, we might do
    sub(pattern = "ENSG", replacement = "", genes[1])
    # last time the function we were applying only had one argument; what do we do with sub, which needs three arguments?
    lapply(genes, sub, pattern = "ENSG", replacement = "")
    # output: 
    # [[1]]
    # [1] "00000166411"

    # [[2]]
    # [1] "00000143311"

    # [[3]]
    # [1] "00039457411"

When applying functions with multiple arguments where you want to keep some arguments constant as you apply the function to each element of your list/vector, just specify them by name after the name of the function. Alternatively, you can write a little wrapper function:

.. code:: R
    lapply(genes, function(gene) sub(pattern = "ENSG", replacement = "", gene))
    # same output as before

As before, the fact that the output is a list might be undesirable, so let's use sapply

.. code:: R
   sapply(genes, function(gene) sub(pattern = "ENSG", replacement = "", gene))
   # output:
   # ENSG00000166411 ENSG00000143311 ENSG00039457411 
   #   "00000166411"   "00000143311"   "00039457411" 

Notice that this time, sapply returned a vector with named elements where each name was the input string. Sometimes this is valuable information, but sometimes the names get in the way of downstream operations. You can access/remove the names like so:

.. code:: R
    out <- sapply(genes, function(gene) sub(pattern = "ENSG", replacement = "", gene)) 
    names(out)
    names(out) <- NULL

We can also apply functions to dataframes, as we plan to for this workshop:

.. code:: R
    df <- data.frame(
      "ID" = c("p1", "p2", "p3"),
      "Gene1" = c(1,5,0.3),
      "Gene2" = c(10,5,4),
      stringsAsFactors = FALSE # lots of R functions automatically convert strings into factors and it can mess up all sorts of things
    }
    # since dataframes have two axes, you need to specify whether you're applying over rows or columns
    apply(df, 1, function(row) row)
    # output:
    #       [,1]  [,2]  [,3] 
    # ID    "p1"  "p2"  "p3" 
    # Gene1 "1.0" "5.0" "0.3"
    # Gene2 "10"  " 5"  " 4" 

Note that applying over the rows transposed the dataframe. It is often the case that you'll need to transpose the output of an apply() call:

.. code:: R
    t(apply(df, 1, function(row) row))
    # output:
    #      ID   Gene1 Gene2
    # [1,] "p1" "1.0" "10" 
    # [2,] "p2" "5.0" " 5" 
    # [3,] "p3" "0.3" " 4"

Also note that, in our original dataframe, the Gene1 and Gene2 columns are numeric, but the outputs of these apply statements are matrices where everything is a string. Consequently, you may find yourself coercing the outputs of apply calls back into dataframes a lot:

.. code:: R
    as.data.frame(t(apply(df, 1, function(row) row)))
    # output:
    #   ID Gene1 Gene2
    # 1 p1   1.0    10
    # 2 p2   5.0     5
    # 3 p3   0.3     4

Now let's actually apply a function that does something, like finding the highest expression level for each patient:

.. code:: R
    # we can't just apply max() to each row, because it will get confused by the ID column
    apply(df, 1, function(row) max(c(row[2], row[3])))
    # output: [1] "10"  "5.0" "0.3"

This does not produce the expected result because each row is represented as a vector and a vector can only have one type of data in it, so the numbers in the Gene1 and Gene2 columns were coerced to strings. Instead, we can try:

.. code:: R
    apply(df[,c(2,3)], 1, max)
    # output: [1] 10  5  4
    # and then reassemble an output dataframe (cbind takes vectors and returns a matrix with those vectors as columns)
    as.data.frame(cbind(df$ID, apply(df[,c(2,3)], 1, max)))
    # output:
    #   V1 V2
    # 1 p1 10
    # 2 p2  5
    # 3 p3  4
    # we could also use this to get the column of max expression levels
    apply(df, 1, function(row) max(c(as.numeric(row[2]), as.numeric(row[3]))))
    # output: [1] 10  5  4

At some point, your functions may get complicated enough that you don't want to define them inside the apply call:

.. code:: R
    part_max <- function(row) {
      max_exp <- max(as.numeric(row[2]), as.numeric(row[3]))
      names(max_exp) <- "max_exp"
      out <- c(row[1], max_exp)
      return(out)
    }
    as.data.frame(t(apply(df, 1, part_max)), stringsAsFactors = FALSE)
    # output:
    #   ID max_exp
    # 1 p1      10
    # 2 p2       5
    # 3 p3       4

Now that we've familiarized ourselves with the basics of apply functions, let's get back to the task at hand:

.. code:: R

    # 1 Run sapply for the first 1000 genes in `scaledcounts` using their names and the `ttestGene()` function.  Write the ouput to an object called `res`.

    # 2 Transpose the output with t().

***********************
Matrix operations
***********************

Loops are great and often necessary, but whenever possible utilizing matrix operations is a great way to speed up runtime.

.. code:: R

    X <- model.matrix(~ group, data = genedata)
    print(X)

The three basic matrix operations functions in R are:

1.  `t()`: Transpose matrix input.
2.  `solve()`: Take the inverse of matrix input.
3.  `%*%`: Multiply matrices on the left and right.

***********************
Loading data from R packages
***********************

This data set is also available in a package called "airway" in Bioconductor. 

.. tip::
   Bioconductor (www.bioconductor.org) is an R programming language open-source and open-development software project for the analysis and interpretation of genomic data. It is comparable to CRAN for packages that are oriented towards biological data analysis. Open development means that the community is made aware of the development plans for each of the tools and in some instances, encouraged to contribute additions and modifications to the software itself. 

The dataset is saved as something called an S4 object. The s4 object class is a somewhat complicated concept, but in this case, all you need to know is that there are named components of the object called "slots", which are accessed using the specialised subsetting operator @ (pronounced at). The set of slots, and their classes, forms an important part of the definition of an S4 class. In R analyses of experiment data, you will often come across s4 objects that contain matrices of gene expression count data, sample metadata, and other information important to the data in fields or slots in the object.

To load the airway data we can use the data("data_name") function and call airway to add the dataset to our workspace. You'll notice that the class is called RangedSummarizedExperiment (i.e. an S4 object), which is used to store matrices of experimental results such as the count data and meta data. This class is from the SummarizedExperiment package which is used often to store sequencing and microarray data. A descriptive and fairly concise tutorial of SummarizedExperiment objects is available `here <https://bioconductor.org/packages/release/bioc/vignettes/SummarizedExperiment/inst/doc/SummarizedExperiment.html>`_.

.. code:: R

   # Call airway data using data() and print airway data to save to workspace

   data("airway")
   airway


Since we imported the same data set twice, we can remove data from our workspace using the rm() function.

Let's remove the variables scaledcounts and metadata from our workspace. We'll keep the airway object since it will be easier to work with for downstream analysis.

.. code:: R

   # Remove scaledcounts and metadata variable
   rm(scaledcounts)
   rm(metadata)

**********************
Explore Airway Dataset
**********************

Let's first do some preliminary work with the airway dataset. The sample/metadata information is saved under the slot colData which can be extracted using airway@colData or colData(airway).

First check the data structure of the colData(airway) dataset.

Hint: Built in functions to check data structure

Let's set colData(airway) as a data frame.

Hint: We will use the as.data.frame() function to do this.

.. code:: R

   # Check mode of colData(airway) and make change the structure to a data frame.

The count data is saved under the slot assay. We can extract the count matrix by calling airway@assay or assay(airway). We can also use descriptive statistics to look at the expression acrosss samples. We will sum the expression of each column and scale by 1e6 to get scaled expression value. We will then use the summary() function to look at the range of expression between the samples.

Determine a way to sum the expression of each column.

Hint: You can use a for loop, apply function, or base functions such as colSums()

.. code:: R

   # 1 Sum the expression of each column, divide by 1e6
   # 2 Use summary function to see the range of values between each sample


*********************************************
Differential Expression Analysis using DESeq2
*********************************************

We will use DESeq2 package for differential expression analysis of the airway data set to find differentially expressed genes between untreated and treated samples. We will first load DESeq2 and set up the data to be compatible with DESeq by using the function DESeqDataSet().

We can use the help("function_name") or ?function_name to look up the function to get a description.

A description or help pages will show up under the Help tab in the bottom right corner.

.. code:: R

    # Look up DESeqDataSet() function description
    help("DESeqDataSet")
    ?DESeqDataSet

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

   # Use order() to order the results table based on the p-value

In DESeq2, the function plotMA generates an MA Plot commonly used to visualize the differential expression results. The plot shows the log2 fold changes attributable to a given variable over the mean of normalized counts for all the samples in the DESeqDataSet. Points represent genes and will be colored red if the adjusted p value is less than 0.1. Points which fall out of the window are plotted as open triangles pointing either up or down.

.. code:: R

  plotMA(res, ylim=c(-2,2))



*********************************
Manipulate and Visualize Results
*********************************

Let's add a column that tell us whether each gene is significant. Using the mutate() function from library dplyr, we can add a column showing whether the significance is TRUE or FALSE based on cutoff padj < 0.01.

.. code:: R

   # 1 Add column with gene names (using row names of matrix)

   # 2 Change res to a tibble format to work with dplyr

   # 3 Add sig column to show which genes are significant or not by using mutate() from dplyr

   # 4 We can use the symbol %>% from library magrittr to represent a pipe. Pipes take the output from one function and feed it to the first argument of the next function. You may have seen something similar in unix with |


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

   # Create Volcano plot using ggplot2

How would you generate the same MA plot above using ggplot2?
Hint: Use baseMean for x-axis, log2FoldChange for y-axis, sig for color.

Make sure to have points and to use a log10 scale for the x-axis (i.e. scale_x_log10() ).

Add the title "MA plot" to your plot as well.


.. code:: R

   # Create MA plot using ggplot2

*********************************************
Gene Set Enrichment using enrichR
*********************************************

Gene set enrichment analysis (GSEA) is a method to identify classes of genes that are over-represented in a large set of genes. This is performed by comparing the input gene set with annotated gene sets from online functional databases such as `Gene Ontology (GO) <http://geneontology.org>`_ and `KEGG <https://www.kegg.jp>`_. This is a common step in bioinformatics as it aids with the biological interpretation of results.

In this section of the workshop, we will perform GSEA on the set of differentially-expressed genes we identified earlier in this workshop using the `enrichR <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4987924/>`_ tool. Please note that this section will require a working internet connection.

Let's start by keeping only the set of genes that showed statistically-significant change in expression between conditions. Remember from the  previous section that our threshold is be a false discovery rate (FDR) of 0.1 (i.e. no more than 10% chance that the observed change in expression is due to chance). Not all the genes in the results from DESeq2 were assigned  p-values so we'll start by filtering out the genes without p-values followed by storing the significant genes separately.

.. code:: R

   # 1 Filter out  genes with no p-values

   # 2 Keep significant genes only

   # 3 How many significant genes did we get?

There's one more step before we carry out GSEA. The genes in this dataset use Ensembl indentifiers, while enrichR expects  gene symbols. We'll use the biomaRt package to map our Ensembl IDs to gene symbols.

.. code:: R

   # 1 Load package (remember to install it if you haven't)
   
   # 2 Load human reference genome

   # 3 Map Ensembl IDs  to gene symbols (might take a couple of minutes)

Now that we have our correctly-formatted gene symbols, we can perform GSEA. There are many different databases we can use for  this step; for this workshop we will  use the Gene Ontology (GO) databases: GO Biological Process, GO Molecular Function, and GO Cellular Component.

.. code:: R

   # 1 Find the list of all available databases from Enrichr

   # 2 Scroll through list of available databases

   # 3 Set up list with databases of interest

   # 4 Perform GSEA

   # 5 Check first few results for the biological process database

To conclude, we can look at our session information including the packages we loaded and worked with.

.. code:: R

   sessionInfo()
