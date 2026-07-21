rule variant_calling:
    input:
        bam="results/alignment/{sample}.sorted.bam",
        ref="results/assembly/{sample}/contigs.fasta"

    output:
        vcf="results/variants/{sample}.vcf"

    conda:
        "../../envs/variant.yaml"

    shell:
        """
        mkdir -p results/variants

        bcftools mpileup \
            -f {input.ref} \
            {input.bam} \
        | bcftools call \
            -mv \
            -Ov \
            -o {output.vcf}
        """