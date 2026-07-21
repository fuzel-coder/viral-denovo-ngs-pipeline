rule diversity:
    input:
        summary="results/taxonomy/{sample}_virus_summary.tsv"

    output:
        diversity="results/diversity/{sample}_diversity.tsv"

    shell:
        """
        mkdir -p results/diversity

        python workflow/scripts/diversity.py \
            --summary {input.summary} \
            --output {output.diversity}
        """