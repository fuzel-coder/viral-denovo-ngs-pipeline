rule bwa_index:
    input:
        "results/assembly/{sample}/contigs.fasta"

    output:
        "results/assembly/{sample}/contigs.fasta.bwt"

    conda:
        "../../envs/bwa.yaml"

    shell:
        """
        bwa index {input}
        """

rule bwa_align:
    input:
        ref="results/assembly/{sample}/contigs.fasta",
        bwt="results/assembly/{sample}/contigs.fasta.bwt",
        r1="results/trimmed/{sample}_R1.trim.fastq.gz",
        r2="results/trimmed/{sample}_R2.trim.fastq.gz"

    output:
        bam="results/alignment/{sample}.sorted.bam"

    threads:
        config["bwa"]["threads"]

    conda:
        "../../envs/bwa.yaml"

    shell:
        """
        mkdir -p results/alignment

        bwa mem -t {threads} {input.ref} {input.r1} {input.r2} \
        | samtools view -Sb - \
        | samtools sort -o {output.bam}

        samtools index {output.bam}
        """