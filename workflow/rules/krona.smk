rule krona:
    input:
        blast="results/blast/{sample}.blast.tsv"

    output:
        html="results/krona/{sample}_krona.html"

    conda:
        "../../envs/krona.yaml"

    shell:
        """
        mkdir -p results/krona

        # Extract TaxID column (3rd column after adding staxids)
        cut -f3 {input.blast} | sort | uniq -c | \
        awk '{{print $1"\t"$2}}' > results/krona/{wildcards.sample}.krona.txt
        
        ktImportTaxonomy \
            results/krona/{wildcards.sample}.krona.txt \
            -o {output.html}
        """