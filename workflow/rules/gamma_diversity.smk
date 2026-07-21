rule gamma_diversity:
    input:
        expand(
            "results/taxonomy/{sample}_virus_summary.tsv",
            sample=SAMPLES
        )

    output:
        "results/diversity/gamma_diversity.tsv"

    conda:
        "../../envs/diversity.yaml"

    shell:
        """
        mkdir -p results/diversity

        python workflow/scripts/gamma_diversity.py \
            --input results/taxonomy \
            --output {output}
        """