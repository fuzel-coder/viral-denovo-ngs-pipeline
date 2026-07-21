rule quast:
    input:
        contigs="results/assembly/{sample}/contigs.fasta"

    output:
        report="results/quast/{sample}/report.html"

    threads:
        config["quast"]["threads"]

    conda:
        "../../envs/quast.yaml"

    shell:
        """
        mkdir -p results/quast/{wildcards.sample}

        quast.py \
            {input.contigs} \
            -o results/quast/{wildcards.sample}
        """