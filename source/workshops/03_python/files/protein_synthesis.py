"""
Script to convert DNA sequences to protein sequence.

Used in the Python Workshop for first year bioinformatic PhD students at
Boston University.

@author Dakota Hawkins (write your name here)
@date August 9, 2018 (write todays date here)
"""


def read_codon_table(codon_table='codon_table.csv'):
    """
    Create a dictionary that maps RNA codons to amino acids.

    Constructs dictionary by reading a .csv file containing codon to amino
    acid mappings.

    Arguments:
        codon_table (string, optional): path to the .csv file containing codon
            to amino acid mappings. Assumed column structure is 'Codon',
            'Amino Acid Name', 'Amino Acid Code'. Default is 'codon_table.csv'
    Returns:
        (dictionary): dictionary with codons as keys and amino acid codes
            as values.
    """

    return(0)


def transcribe(dna_seq, direction='+'):
    """
    Transcribe a DNA sequence to an RNA sequence.

    Arguments:
        dna_seq (string): DNA sequence to transcribe to RNA.
        strand (string, optional): which strand of DNA the sequence is
            derived from. The symbol '+' denotes forward/template strand
            while '-' denotes reverse/coding strand. Default is '+'.
            Regardless of strand, the sequence is assumed to oriented
            5' to 3'.
    Returns:
        (string): transcribed RNA sequence from `dna_seq`.
    """

    return(0)


def translate(rna_seq):
    """
    Translate an RNA sequence to an amino acid sequence.

    Arguments:
        rna_seq (string): RNA sequence to translate to amino acid sequence.
    """
    start_codon = 'AUG'
    stop_codons = ['UAA', 'UAG', 'UGA']
    return(0)


def read_fasta(fasta_file):
    """
    Retrieve a DNA or protein sequence data from a FASTA file.

    Arguments:
        fasta_file (string): path to FASTA file.
    Returns:
        (string): DNA or protein sequence found in `fasta_file`.
    """

    return(0)


def write_fasta(sequence, output_file, desc=''):
    """
    Write a DNA or protein sequence to a FASTA file.

    Arguments:
        sequence (string): sequence to write to file.
        output_file (string): path designating where to write the sequence.
        desc (string, optional): description of sequence. Default is empty.
    """

    return(0)


def main():
    """Return the first protein synthesized by a DNA sequence."""

    return(0)

if __name__ == "__main__":
    pass
    # this is were you'll execute the commands necessary to A. read in a
    # DNA sequence from a fasta file, B. Find the first amino acid
    # sequence it codes for, and C. write the final sequence to an
    # output fasta file
