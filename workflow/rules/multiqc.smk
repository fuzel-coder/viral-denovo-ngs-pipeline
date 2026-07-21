rule multiqc:
    input:
        expand("results/fastqc/{sample}_R1_fastqc.zip", sample=SAMPLES),
        expand("results/fastqc/{sample}_R2_fastqc.zip", sample=SAMPLES)

    output:
        "results/multiqc/multiqc_report.html"

    conda:
       "../../envs/multiqc.yaml"

    shell:
        """
        mkdir -p results/multiqc
        multiqc results/fastqc -o results/multiqc
        """