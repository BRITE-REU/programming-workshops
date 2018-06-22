
BRITE REU Python Workshop
=========================

Instructor: Dakota Hawkins
~~~~~~~~~~~~~~~~~~~~~~~~~~

Overview
--------

Protein synthesis generally follows what has been termed "The Central
Dogma of Molecular Biology." That is that DNA codes RNA where RNA then
makes protein. Here is a useful source if you need a quick refresher
(https://www.nature.com/scitable/topicpage/translation-dna-to-mrna-to-protein-393).
In today's workshop we will be writing a small Python script to simulate
this process by reading a DNA sequence from a FASTA file, transcribing
the sequence to mRNA, translating the computed mRNA strand to amino
acids, and finally writing the protein sequence to another FASTA file.
This workshop is intended to synthesise the information we learned in
the Python Introduction notebook.

For this workshop you will be working with a partner in small teams. The
groups will be used as a means to facilitate discussion (e.g. "How can
we structure this function?"), while you and your partner will help each
other implement the code. Partners should choose a single computer to
write the code with. While a single person will be "driving" at a time,
both partners are expected to converse and contribute. Likewise, no one
person should be driving for the entire workshop: make sure to switch
semi-regularly to ensure each person is getting the same out of the
workshop. Please ensure each partner has a working copy of the completed
Jupyter Notebook after the workshop is complete.

This notebook includes skeleton methods for all of the different Python
functions we'll need: **``read_fasta()``**, **``write_fastsa()``**,
**``read_codon_table()``**, **``transcribe()``**, **``translate()``**,
and **``main()``**. While these functions *should* encompass all of the
functions we'll need, feel free to write your own helper functions if
you deem it necessary. Similarly, if you'd rather eskew the structure I
provided -- whether combining previously separated functions, changing
passed arguments, etc. -- feel free to do so. The only requirement is
both partners are onboard with the change and the final product produces
the same output. The skeleton code is mainly used to provide a starting
structure so the code is easier to jump into.

Helpful Tips and Files
----------------------

1. The provided file, 'codon\_table.csv', contains information on which
   codons produce which amino acids.

2. The **``re``** python module contains a **``sub``** method to perform
   regular expression substitution.

3. FASTA files are text files with standardized format for storing
   biological sequence. Generally, the first line in FASTA files is a
   description demarked by **``>``** (or less frequently **``;``**) as
   the first character. The next lines contain the actual biological
   sequence. Generally each line is either 60 or 70 characters long
   before a line break. An example FASTA file (``human_notch.fasta``)
   has been included. For more information:
   https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE\_TYPE=BlastDocs&DOC\_TYPE=BlastHelp

4. Helpful functions

+----------+-----------+--------------+---------------+
| Library  | Function  | Description  | Example Call  |
+==========+===========+==============+===============+
| base     | open()    | Access a     | ``read_file = |
|          |           | file in      |  open(file_na |
|          |           | Python       | me, 'r')``    |
+----------+-----------+--------------+---------------+
| base     | readline( | Read the     | ``read_file.r |
|          | )         | current line | eadline()``   |
|          |           | from a file  |               |
|          |           | object       |               |
+----------+-----------+--------------+---------------+
| base     | write()   | Write a      | ``write_file. |
|          |           | string to a  | write("Hi the |
|          |           | file         | re.")``       |
+----------+-----------+--------------+---------------+
| base     | strip()   | Remove       | ``"\n Hi ther |
|          |           | leading and  | e    ".strip( |
|          |           | trailing     | )``           |
|          |           | whitespace   |               |
|          |           | and          |               |
|          |           | formatting   |               |
|          |           | characters   |               |
+----------+-----------+--------------+---------------+
| base     | split()   | Separate a   | ``"1,2,3,4".s |
|          |           | string into  | plit(',')``   |
|          |           | disjoint     |               |
|          |           | sections     |               |
|          |           | given a      |               |
|          |           | specified    |               |
|          |           | delimiter    |               |
+----------+-----------+--------------+---------------+
| re       | sub()     | Substitute   | ``re.sub("F", |
|          |           | one given    |  "J", "Functi |
|          |           | pattern with | on")``        |
|          |           | another      |               |
+----------+-----------+--------------+---------------+

Read FASTA Files:
~~~~~~~~~~~~~~~~~

.. code:: ipython3

    def read_fasta(fasta_file):
        """
        Retrieve a DNA or protein sequence data from a FASTA file.
    
        Arguments:
            fasta_file (string): path to FASTA file.
        Returns:
            (string): DNA or protein sequence found in `fasta_file`.
        """
        return('')

Write FASTA Files:
~~~~~~~~~~~~~~~~~~

.. code:: ipython3

    def write_fasta(sequence, output_file, desc=''):
        """
        Write a DNA or protein sequence to a FASTA file.
    
        Arguments:
            sequence (string): sequence to write to file.
            output_file (string): path designating where to write the sequence.
            desc (string, optional): description of sequence. Default is empty.
        Returns:
            None.
        """
        return(None)

Read ``codon_table.csv``:
~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: ipython3

    def read_codon_table(codon_table='codon_table.csv'):
        """
        Create a dictionary that maps RNA codons to amino acids.
    
        Constructs dictionary by reading a .csv file containing codon to amino
        acid mappings.
    
        Arguments:
            codon_table (string, optional): path to the .csv file containing codon
                to amino acid mappings. Assumed column structure is 'Codon',
                'Amino Acid Abbreviation', 'Amino Acid Code', and 'Amino Acid Name'.
                Default is 'codon_table.csv'
        Returns:
            (dictionary, string:string): dictionary with codons as keys and amino acid codes
                as values.
        """
        return({'': ''})

Transcribe DNA to RNA:
~~~~~~~~~~~~~~~~~~~~~~

.. code:: ipython3

    def transcribe(dna_seq, direction='-'):
        """
        Transcribe a DNA sequence to an RNA sequence.
    
        Arguments:
            dna_seq (string): DNA sequence to transcribe to RNA.
            direction (string, optional): Direction of sequence. The symbol '+'
                denotes forward/template strand while '-' denotes reverse/coding strand.
                Default is '-'.
        Returns:
            (string): transcribed RNA sequence from `dna_seq`.
        """
    
        return('')

Translate RNA to Protein:
~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: ipython3

    def translate(rna_seq, codon_to_amino):
        """
        Translate an RNA sequence to an amino acid sequence.
    
        Arguments:
            rna_seq (string): RNA sequence to translate to amino acid sequence.
            codon_to_amino (dict string:string): mapping of three-nuceleotide-long codons to
                amino acid codes.
        Returns:
            (string): amino acid sequence of translated `rna_seq` codons.
        """
    
        return('')

Tie the Steps Together:
~~~~~~~~~~~~~~~~~~~~~~~

.. code:: ipython3

    def main(dna_seq, output_fasta):
        """
        Return the first protein synthesized by a DNA sequence.
    
        Arguments:
            dna_seq (string): DNA sequence to parse.
            output_fasta (string): fasta file to write translated amino acid sequence to.
        Returns:
            None.
        """
        
        return(None)

If You Finish Early
-------------------

If you finish early, here are some suggestions to extend the
functionality of your script:

-  **System Arguments**: Using the **``sys``** Python module it is
   possible to access command-line arguments passed by a user.
   Specifically, the **``sys.argv``** variable stores user-passed
   information. Implement command line functionality that takes a
   user-provided FASTA file, converts the DNA sequence to amino acids,
   and outputs to another user-provided FASTA file.

-  **Defensive Programming**: When you're creating a program, usually
   you have a pretty good idea of its use and how it works. However,
   sometimes we're not the only ones using our programs. Therefore, it's
   a good idea to protect against user and input error. For example,
   what happens if non-recoganized letters, whitespace, or special
   characters (**``*``**, **``-``**) are included in the input sequence?
   Ensure your program is able to handle these, but remember some
   characters may have special meanings.

-  **Calculating Statistics**: Higher GC content in genomic regions is
   related to many important biological functions such as protein
   coding. Discuss with your partner the best way to measure the GC
   content of a DNA sequence. Once you've agreed on the best way,
   implement a function that will calculate the percentage along a
   provided sequence. Using the Python module **``matplotlib``**, the
   output of this function to visualize how the measure changes along
   the sequence. In order to easily identify areas of high and low GC
   content, make sure to include a line that plots the mean level
   accross sequence.

-  **Simulating Single Nucleotide Polymorphisms**: Single nucleotide
   polymorphisms (SNPs) are single-point mutations that change the
   nucleotide of a single base in a strand of DNA. SNPs are incredibly
   important in genome-wide association studies (GWAS) that look to
   infer the relationship between specific genotypes and phenotypic
   outcomes such as disease status. Using a numerical library, such as
   **numpy/scipy**, create a function to randomly select a base for
   mutation. Apply some function that determines the identity of the
   newly mutated base. How biologically reasonable is your model? What
   biological phenomena should we consider to create an accurate
   simulation?

For some exercises, you will likely need to look for, and read, library
specific documentation in order to implement the functions. This alone
is a helpful exercise, as throughout your coding career you will
continually need to reference documentation.
