rule fastp:
    input:
        r1="samples/{sample}_R1_001.fastq.gz",
        r2="samples/{sample}_R2_001.fastq.gz"

    output:
        r1="results/trimmed/{sample}_R1.trim.fastq.gz",
        r2="results/trimmed/{sample}_R2.trim.fastq.gz",
        html="results/trimmed/{sample}_fastp.html",
        json="results/trimmed/{sample}_fastp.json"

    threads:
        config["fastp"]["threads"]

    conda:
        "../../envs/fastp.yaml"

    shell:
        """
        mkdir -p results/trimmed

        fastp \
            -i {input.r1} \
            -I {input.r2} \
            -o {output.r1} \
            -O {output.r2} \
            -h {output.html} \
            -j {output.json} \
            -w {threads}
        """