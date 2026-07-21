#!/usr/bin/env python3

import argparse
import math


def calculate_diversity(summary_file):
    counts = []

    with open(summary_file) as f:
        next(f)

        for line in f:
            cols = line.strip().split("\t")

            if len(cols) < 3:
                continue

            counts.append(int(cols[1]))

    total = sum(counts)
    richness = len(counts)

    shannon = 0
    simpson = 0

    if total > 0:
        for c in counts:
            p = c / total
            shannon -= p * math.log(p)
            simpson += p * p

    simpson = 1 - simpson

    return total, richness, shannon, simpson


def main():

    parser = argparse.ArgumentParser()

    parser.add_argument("--summary", required=True)
    parser.add_argument("--output", required=True)

    args = parser.parse_args()

    total, richness, shannon, simpson = calculate_diversity(args.summary)

    with open(args.output, "w") as out:

        out.write("Metric\tValue\n")
        out.write(f"Total_Contigs\t{total}\n")
        out.write(f"Unique_Viruses\t{richness}\n")
        out.write(f"Shannon_Index\t{shannon:.4f}\n")
        out.write(f"Simpson_Index\t{simpson:.4f}\n")


if __name__ == "__main__":
    main()