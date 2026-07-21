#!/usr/bin/env python3

import argparse
from collections import defaultdict


def load_fasta_headers(fasta_file):
    """
    Create a dictionary:
    accession -> virus description
    """
    accession_to_name = {}

    with open(fasta_file) as f:
        for line in f:
            if line.startswith(">"):
                header = line[1:].strip()

                parts = header.split(maxsplit=1)

                accession = parts[0]

                if len(parts) > 1:
                    virus_name = parts[1]
                else:
                    virus_name = "Unknown"

                accession_to_name[accession] = virus_name

    return accession_to_name


def summarize_blast(blast_file, accession_to_name):
    summary = defaultdict(lambda: {"count": 0, "best_identity": 0})

    with open(blast_file) as f:
        for line in f:
            cols = line.strip().split("\t")

            if len(cols) < 3:
                continue

            accession = cols[1]
            identity = float(cols[2])

            virus_name = accession_to_name.get(accession, "Unknown")

            summary[virus_name]["count"] += 1

            if identity > summary[virus_name]["best_identity"]:
                summary[virus_name]["best_identity"] = identity

    return summary


def write_output(summary, output_file):
    with open(output_file, "w") as out:

        out.write("Virus\tContigs\tBest_Identity\n")

        for virus, data in sorted(summary.items()):
            out.write(
                f"{virus}\t{data['count']}\t{data['best_identity']:.2f}\n"
            )


def main():

    parser = argparse.ArgumentParser()

    parser.add_argument("--blast", required=True)

    parser.add_argument("--fasta", required=True)

    parser.add_argument("--output", required=True)

    args = parser.parse_args()

    accession_map = load_fasta_headers(args.fasta)

    summary = summarize_blast(args.blast, accession_map)

    write_output(summary, args.output)


if __name__ == "__main__":
    main()