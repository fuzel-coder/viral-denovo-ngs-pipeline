![Python](https://img.shields.io/badge/Python-3.10+-blue.svg)
![Snakemake](https://img.shields.io/badge/Snakemake-Workflow-green.svg)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-orange.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

# Viral De Novo NGS Pipeline

A modular and reproducible **Snakemake-based workflow** for de novo viral genome analysis from Next-Generation Sequencing (NGS) data.

---

# Overview

This pipeline automates the complete analysis of paired-end viral NGS data using Snakemake. It integrates quality control, adapter trimming, de novo assembly, genome quality assessment, alignment, variant calling, annotation, taxonomic classification, phage identification, diversity analysis, and visualization into a reproducible workflow.

---

# Features

- Automated quality control using FastQC
- Adapter and quality trimming with FastP
- MultiQC report generation
- De novo genome assembly using SPAdes
- Assembly quality assessment using QUAST
- Read alignment using BWA
- Variant calling
- Variant annotation using Ensembl VEP
- BLAST sequence similarity search
- Taxonomic classification
- Phage identification
- Alpha, Beta and Gamma diversity analysis
- Krona interactive visualization
- Automated final report generation

---

# Pipeline Workflow

![Viral De Novo NGS Pipeline](docs/workflow.png)

---

# Workflow Steps

1. Input FASTQ Files
2. FastQC (Quality Control)
3. FastP (Adapter & Quality Trimming)
4. MultiQC Summary Report
5. SPAdes De Novo Assembly
6. QUAST Assembly Evaluation
7. BWA Read Alignment
8. Variant Calling
9. Variant Annotation (VEP)
10. BLAST Search
11. Taxonomic Classification
12. Phage Identification
13. Alpha, Beta & Gamma Diversity Analysis
14. Krona Visualization
15. Final Analysis Report

---

# Repository Structure

```text
viral-denovo-ngs-pipeline/
│
├── workflow/
│   ├── qc.smk
│   ├── trim.smk
│   ├── assembly.smk
│   ├── alignment.smk
│   ├── annotation.smk
│   ├── blast.smk
│   ├── taxonomy.smk
│   ├── diversity.smk
│   └── report.smk
│
├── envs/
│
├── docs/
│   └── workflow.png
│
├── config.yaml
├── Snakefile
├── README.md
└── LICENSE
```

---

# Installation

Clone the repository:

```bash
git clone https://github.com/fuzel-coder/viral-denovo-ngs-pipeline.git
cd viral-denovo-ngs-pipeline
```

Create the required Conda environments automatically:

```bash
snakemake --use-conda
```

---

# Usage

Run the complete workflow:

```bash
snakemake --cores 4 --use-conda
```

Dry run:

```bash
snakemake -n
```

Generate workflow DAG:

```bash
snakemake --dag | dot -Tpng > dag.png
```

---

# Tools Used

- Snakemake
- Python
- Linux (Ubuntu)
- Conda
- Docker
- FastQC
- FastP
- MultiQC
- SPAdes
- QUAST
- BWA
- Samtools
- Ensembl VEP
- BLAST+
- Krona Tools

---

# Expected Outputs

The pipeline generates:

- FastQC reports
- MultiQC summary report
- Trimmed FASTQ files
- Assembled contigs
- QUAST assembly statistics
- Alignment files (BAM)
- Variant files (VCF)
- Annotated variants
- BLAST results
- Taxonomy reports
- Diversity analysis
- Krona visualization
- Final report

---

# Future Improvements

- Support additional assemblers
- Automated database downloads
- Nextflow implementation
- Cloud execution support
- Containerized workflow improvements
- Interactive HTML reports

---

# Author

**Shaik Fuzel Akther**

Bioinformatics Graduate | Python | NGS | Snakemake | Linux | Docker

GitHub: https://github.com/fuzel-coder

---

# License

This project is released under the MIT License.
