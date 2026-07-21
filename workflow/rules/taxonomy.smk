rule taxonomy:
    input:
        blast="results/blast/{sample}.blast.tsv",
        fasta="blast_db/viral.1.1.genomic.fna"

    output:
        summary="results/taxonomy/{sample}_virus_summary.tsv"

    shell:
        """
        mkdir -p results/taxonomy

        python workflow/scripts/taxonomy.py \
            --blast {input.blast} \
            --fasta {input.fasta} \
            --output {output.summary}
        """