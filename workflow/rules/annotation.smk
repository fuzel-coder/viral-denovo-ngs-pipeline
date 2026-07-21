rule vep:
    input:
        vcf="results/variants/{sample}.vcf"

    output:
        "results/annotation/{sample}.vep.vcf"

    shell:
        """
        mkdir -p results/annotation

        docker run --rm \
            -u $(id -u):$(id -g) \
            -v ~/denovo_pipeline:/work \
            -v /mnt/d:/cache \
            -v /mnt/d/homo_sapiens:/fasta \
            -w /work \
            ensemblorg/ensembl-vep:release_115.0 \
            vep \
            -i /work/{input.vcf} \
            -o /work/{output} \
            --vcf \
            --cache \
            --dir_cache /cache \
            --offline \
            --fasta /fasta/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
            --no_stats \
            --force_overwrite
        """