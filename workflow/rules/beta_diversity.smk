rule beta_diversity:
    input:
        expand(
            "results/taxonomy/{sample}_virus_summary.tsv",
            sample=SAMPLES
        )

    output:
        table="results/diversity/beta_diversity.tsv",
        plot="results/diversity/beta_diversity.png"

    conda:
        "../../envs/diversity.yaml"

    shell:
        """
        mkdir -p results/diversity

        python workflow/scripts/beta_diversity.py \
            --input results/taxonomy \
            --table {output.table} \
            --plot {output.plot}
        """