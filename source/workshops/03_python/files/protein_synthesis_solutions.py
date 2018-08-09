"""
Script to convert DNA sequences to protein sequence.

Used in the Python Workshop for the 2017 BRITE REU at Boston University.

@author Dakota Hawkins
@data June 19, 2017

Last edited: June 21, 2017
"""

from re import sub


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
        (dictionary, string:string): dictionary with codons as keys and amino
            acid codes as values.
    """
    codon_dict = {}
    with open(codon_table) as read_file:
        read_file.readline()  # skip the first line
        for line in read_file:
            split_line = line.strip().split(',')
            if split_line[2] != 'Stop':
                codon_dict[split_line[0]] = split_line[2]
    return(codon_dict)


def transcribe(dna_seq, direction='-'):
    """
    Transcribe a DNA sequence to an RNA sequence.

    Arguments:
        dna_seq (string): DNA sequence to transcribe to RNA.
        strand (string, optional): which strand of DNA the sequence is
            derived from. The symbol '+' denotes forward/template strand
            while '-' denotes reverse/coding strand. Default is '-'.
            Regardless of strand, the sequence is assumed to oriented
            5' to 3'.
    Returns:
        (string): transcribed RNA sequence from `dna_seq`.
    """
    rna_seq = ''
    # template strand
    if direction == '+':
        # match amino acids to compliments
        compliment = {'A': 'U', 'T': 'A', 'C': 'G', 'G': 'C'}
        for base in dna_seq:
            rna_seq += compliment[base]
    # coding strand
    elif direction == '-':
        # change T's to U's
        rna_seq = sub('T', 'U', dna_seq)
    else:
        raise ValueError("`direction` must be either '+' or '-'.")

    return(rna_seq)


def translate(rna_seq, codon_to_amino):
    """
    Translate an RNA sequence to an amino acid sequence.

    Arguments:
        rna_seq (string): RNA sequence to translate to amino acid sequence.
        codon_to_amino (dict string:string): mapping of three-nuceleotide-long
            codons to amino acid codes.
    Returns:
        (string): amino acid sequence of translated `rna_seq` codons.
    """
    start_codon = 'AUG'
    stop_codons = ['UAA', 'UAG', 'UGA']
    aa_seq = ''
    pos = 0
    codon = rna_seq[pos:pos + 3]
    seq_length = len(rna_seq)

    while codon != start_codon and pos != seq_length - 3:
        pos += 1
        codon = rna_seq[pos:pos + 3]

    while pos < seq_length - 3 and codon not in stop_codons:
        codon = rna_seq[pos:pos + 3]
        aa_seq += codon_to_amino[codon]
        pos += 3

    if len(aa_seq) == 0:
        print('No translateable sequence found.')

    return(aa_seq)


def read_fasta(fasta_file):
    """
    Retrieve a DNA or protein sequence data from a FASTA file.

    Arguments:
        fasta_file (string): path to FASTA file.
    Returns:
        (string): DNA or protein sequence found in `fasta_file`.
    """
    sequence = ''
    with open(fasta_file) as read_file:
        for line in read_file:
            if line[0] not in ['>', ';']:
                sequence += line.strip()
    return(sequence)


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
    write_file = open(output_file, 'w')
    write_file.write('>' + desc + '\n')
    seq_length = len(sequence)

    for i in range(0, seq_length, 80):
        write_file.write(sequence[i:i + 80] + '\n')
    write_file.write(sequence[i:seq_length])
    write_file.close()


def main(dna_seq, output_fasta):
    """
    Return the first protein synthesized by a DNA sequence.

    Arguments:
        dna_seq (string): DNA sequence to parse.
        output_fasta (string): fasta file to write translated amino acid
        sequence to.
    Returns:
        None.
    """
    rna_seq = transcribe(dna_seq, '-')
    codon_to_amino = read_codon_table()
    aa_seq = translate(rna_seq, codon_to_amino)
    write_fasta(aa_seq, output_fasta)


if __name__ == '__main__':
    dna_seq = read_fasta('human_notch.fasta')
    main(dna_seq, 'notch_aa.fasta')
