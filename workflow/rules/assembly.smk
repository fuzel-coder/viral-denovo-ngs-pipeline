rule spades:
    input:
        r1="results/trimmed/{sample}_R1.trim.fastq.gz",
        r2="results/trimmed/{sample}_R2.trim.fastq.gz"

    output:
        contigs="results/assembly/{sample}/contigs.fasta"

    threads:
        config["spades"]["threads"]

    conda:
       "../../envs/spades.yaml"
       
    shell:
        """
        mkdir -p results/assembly/{wildcards.sample}

        spades.py \
            -1 {input.r1} \
            -2 {input.r2} \
            -o results/assembly/{wildcards.sample} \
            -t {threads}
        """