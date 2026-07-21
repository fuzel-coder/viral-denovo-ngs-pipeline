rule fastqc:
    input:
        r1="samples/{sample}_R1_001.fastq.gz",
        r2="samples/{sample}_R2_001.fastq.gz"
    output:
        html1="results/fastqc/{sample}_R1_fastqc.html",
        zip1="results/fastqc/{sample}_R1_fastqc.zip",
        html2="results/fastqc/{sample}_R2_fastqc.html",
        zip2="results/fastqc/{sample}_R2_fastqc.zip"

    threads:
        config["fastqc"]["threads"]

    conda:
        "../../envs/fastqc.yaml"

    shell:
        """
        mkdir -p results/fastqc

        fastqc \
            {input.r1} \
            {input.r2} \
            -o results/fastqc \
            -t {threads}
        """