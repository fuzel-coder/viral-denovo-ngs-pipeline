![Python](https://img.shields.io/badge/Python-3.10+-blue.svg)
![Snakemake](https://img.shields.io/badge/Snakemake-Workflow-green.svg)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-orange.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

# Viral De Novo NGS Pipeline

A modular and reproducible **Snakemake-based workflow** for de novo viral genome analysis from Next-Generation Sequencing (NGS) data.

---

## Overview

This repository provides a modular, scalable, and reproducible Snakemake workflow for de novo viral genome analysis from paired-end Next-Generation Sequencing (NGS) data. The pipeline integrates quality control, adapter trimming, de novo assembly, genome quality assessment, read alignment, variant analysis, annotation, taxonomic classification, diversity analysis, and automated reporting into a single workflow.

---

## Features

- Automated quality control using FastQC
- Adapter trimming and quality filtering with FastP
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

## Pipeline Workflow

![Viral De Novo NGS Pipeline](docs/workflow.png)

---

## Workflow Steps

1. Input paired-end FASTQ files
2. Quality Control (FastQC)
3. Adapter & Quality Trimming (FastP)
4. MultiQC Summary Report
5. De Novo Genome Assembly (SPAdes)
6. Assembly Quality Assessment (QUAST)
7. Read Alignment (BWA)
8. Variant Calling
9. Variant Annotation (Ensembl VEP)
10. BLAST Search
11. Taxonomic Classification
12. Phage Identification
13. Alpha, Beta & Gamma Diversity Analysis
14. Krona Visualization
15. Final Analysis Report

---

## Repository Structure

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
├── docs/
│   └── workflow.png
├── config.yaml
├── Snakefile
├── README.md
└── LICENSE
```

---

## Requirements

- Ubuntu 22.04 LTS (or later)
- Python 3.10+
- Conda / Miniconda
- Snakemake
- Docker Desktop
- Git

---

## Installation

Clone the repository:

```bash
git clone https://github.com/fuzel-coder/viral-denovo-ngs-pipeline.git
cd viral-denovo-ngs-pipeline
```

Create all Conda environments automatically:

```bash
snakemake --use-conda
```

---

## Usage

Run the complete workflow:

```bash
snakemake --cores 4 --use-conda
```

Dry run:

```bash
snakemake -n
```

Generate the workflow DAG:

```bash
snakemake --dag | dot -Tpng > dag.png
```

---

## Tools Used

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

## Expected Outputs

The pipeline generates:

- FastQC quality reports
- MultiQC summary report
- Trimmed FASTQ files
- Assembled contigs
- QUAST assembly statistics
- BAM alignment files
- VCF variant files
- Annotated variants
- BLAST search results
- Taxonomic classification reports
- Diversity analysis reports
- Krona interactive visualization
- Final analysis report

---

## Future Improvements

- Support additional assemblers
- Automated reference/database downloads
- Nextflow implementation
- Cloud execution support
- Interactive HTML reports
- CI/CD integration with GitHub Actions

---

## Citation

If you use this pipeline in your research or projects, please cite this GitHub repository.

---

## Author

**Shaik Fuzel Akther**

Bioinformatics Graduate | Python | Bioinformatics | NGS | Snakemake | Linux | Docker

- GitHub: https://github.com/fuzel-coder
- LinkedIn: https://www.linkedin.com/in/shaik-fuzelakther
- Email: shaikfuzel636@gmail.com

---

## License

This project is released under the MIT License.
