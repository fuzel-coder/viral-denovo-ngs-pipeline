rule blast:
    input:
        contigs="results/assembly/{sample}/contigs.fasta"

    output:
        blast="results/blast/{sample}.blast.tsv"

    conda:
        "../../envs/blast.yaml"

    threads: 4

    shell:
        """
        mkdir -p results/blast

        blastn \
            -query {input.contigs} \
            -db blast_db/viral_db \
            -out {output.blast} \
            -outfmt "6 qseqid saccver staxids pident length mismatch gapopen qstart qend sstart send evalue bitscore" \
            -evalue 1e-5 \
            -max_target_seqs 1 \
            -num_threads {threads}
        """