# Viral De Novo NGS Pipeline

A modular and reproducible Snakemake-based pipeline for de novo viral genome analysis from Next-Generation Sequencing (NGS) data.

---

## Overview

This pipeline automates the analysis of paired-end sequencing data using Snakemake. It performs quality control, trimming, de novo assembly, alignment, variant analysis, taxonomy classification, phage identification, diversity analysis, and report generation.

The workflow is designed to be reproducible, scalable, and easy to extend for viral metagenomics studies.

---

## Pipeline Workflow

```
Raw FASTQ
     │
     ▼
FastQC
     │
     ▼
FastP
     │
     ▼
MultiQC
     │
     ▼
SPAdes Assembly
     │
     ├────────► QUAST
     │
     ▼
BWA Alignment
     │
     ▼
Variant Calling
     │
     ▼
VEP Annotation
     │
     ▼
BLAST Search
     │
     ▼
Taxonomy Classification
     │
     ▼
Phage Identification
     │
     ▼
Krona Visualization
     │
     ▼
Alpha Diversity
     │
     ▼
Beta Diversity
     │
     ▼
Gamma Diversity
     │
     ▼
Final Report
```

---

## Features

- Quality Control using FastQC
- Adapter Trimming using FastP
- MultiQC Summary Report
- De Novo Assembly with SPAdes
- Assembly Quality Assessment using QUAST
- BWA Alignment
- Variant Calling
- Variant Annotation using Ensembl VEP
- BLAST-based Sequence Identification
- Taxonomic Classification
- Phage Detection
- Krona Interactive Visualization
- Alpha Diversity Analysis
- Beta Diversity Analysis
- Gamma Diversity Analysis
- Modular Snakemake Workflow
- Conda Environment Support

---

## Project Structure

```text
viral-denovo-ngs-pipeline/
│
├── Snakefile
├── config.yaml
├── envs/
├── workflow/
│   ├── rules/
│   └── scripts/
├── docs/
├── example_output/
├── README.md
├── LICENSE
└── .gitignore
```

---

## Requirements

- Linux / WSL
- Snakemake
- Conda
- Python 3.10+
- Docker (for VEP)

---

## Running the Pipeline

```bash
snakemake --use-conda --cores 4
```

---

## Tools Used

- Snakemake
- Python
- FastQC
- FastP
- MultiQC
- SPAdes
- QUAST
- BWA
- SAMtools
- BCFtools
- Ensembl VEP
- BLAST+
- Krona

---

## Future Improvements

- Nextflow implementation
- Containerized execution
- Automatic report generation
- Cloud execution support
- Interactive dashboards

---

## Author

**Shaik Fuzel**

Bioinformatics Graduate

GitHub: https://github.com/fuzel-coder

---

## License

This project is licensed under the MIT License.
