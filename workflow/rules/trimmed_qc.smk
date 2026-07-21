rule fastqc_trimmed:
    input:
        r1="results/trimmed/{sample}_R1.trim.fastq.gz",
        r2="results/trimmed/{sample}_R2.trim.fastq.gz"

    output:
        html1="results/fastqc_trimmed/{sample}_R1_fastqc.html",
        zip1="results/fastqc_trimmed/{sample}_R1_fastqc.zip",
        html2="results/fastqc_trimmed/{sample}_R2_fastqc.html",
        zip2="results/fastqc_trimmed/{sample}_R2_fastqc.zip"

    threads:
        config["fastqc"]["threads"]

    conda:
        "../../envs/fastqc.yaml"

    shell:
        """
        mkdir -p results/fastqc_trimmed

        fastqc \
            {input.r1} \
            {input.r2} \
            -o results/fastqc_trimmed \
            -t {threads}
        """