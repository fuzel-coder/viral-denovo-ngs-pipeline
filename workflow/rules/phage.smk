rule phage:
    input:
        summary="results/taxonomy/{sample}_virus_summary.tsv"

    output:
        phage="results/phage/{sample}_phage_summary.tsv"

    shell:
        """
        mkdir -p results/phage

        python workflow/scripts/phage.py \
            --summary {input.summary} \
            --output {output.phage}
        """