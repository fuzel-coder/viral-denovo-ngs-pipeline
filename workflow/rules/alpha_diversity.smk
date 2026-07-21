rule alpha_diversity:
    input:
        summary="results/taxonomy/{sample}_virus_summary.tsv"

    output:
        diversity="results/diversity/{sample}_alpha_diversity.tsv"

    conda:
        "../../envs/diversity.yaml"

    shell:
        """
        mkdir -p results/diversity

        python workflow/scripts/alpha_diversity.py \
            --summary {input.summary} \
            --output {output.diversity}
        """