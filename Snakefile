configfile: "config.yaml"

SAMPLES = glob_wildcards("samples/{sample}_R1_001.fastq.gz").sample

include: "workflow/rules/qc.smk"
include: "workflow/rules/multiqc.smk"
include: "workflow/rules/trim.smk"
include: "workflow/rules/trimmed_qc.smk"
include: "workflow/rules/assembly.smk"
include: "workflow/rules/quast.smk"
include: "workflow/rules/alignment.smk"
include: "workflow/rules/blast.smk"
include: "workflow/rules/variant.smk"
include: "workflow/rules/taxonomy.smk"
include: "workflow/rules/report.smk"
# include: "workflow/rules/diversity.smk"
include: "workflow/rules/alpha_diversity.smk"
include: "workflow/rules/beta_diversity.smk"
include: "workflow/rules/gamma_diversity.smk"
include: "workflow/rules/phage.smk"
include: "workflow/rules/krona.smk"

rule all:
    input:
        expand(
            "results/reports/{sample}_final_report.txt",
            sample=SAMPLES
        ),
        expand(
            "results/taxonomy/{sample}_virus_summary.tsv",
            sample=SAMPLES
        ),
        expand(
            "results/diversity/{sample}_alpha_diversity.tsv",
            sample=SAMPLES
        ),

        "results/diversity/beta_diversity.tsv",
        "results/diversity/beta_diversity.png",
        "results/diversity/gamma_diversity.tsv",

        expand(
            "results/phage/{sample}_phage_summary.tsv",
            sample=SAMPLES
        ),
        expand(
            "results/krona/{sample}_krona.html",
            sample=SAMPLES
        )