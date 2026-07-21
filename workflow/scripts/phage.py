#!/usr/bin/env python3

import argparse


def analyze_phages(summary_file, output_file):

    total_viruses = 0
    phage_count = 0
    phage_list = []

    with open(summary_file) as f:
        next(f)  # Skip header

        for line in f:
            cols = line.strip().split("\t")

            if len(cols) < 3:
                continue

            virus = cols[0]

            total_viruses += 1

            if "phage" in virus.lower():
                phage_count += 1
                phage_list.append(virus)

    percentage = 0

    if total_viruses > 0:
        percentage = (phage_count / total_viruses) * 100

    with open(output_file, "w") as out:

        out.write("Metric\tValue\n")
        out.write(f"Total_Viruses\t{total_viruses}\n")
        out.write(f"Phages\t{phage_count}\n")
        out.write(f"Phage_Percentage\t{percentage:.2f}\n\n")

        out.write("Detected_Phages\n")

        for phage in sorted(phage_list):
            out.write(f"{phage}\n")


def main():

    parser = argparse.ArgumentParser()

    parser.add_argument("--summary", required=True)

    parser.add_argument("--output", required=True)

    args = parser.parse_args()

    analyze_phages(args.summary, args.output)


if __name__ == "__main__":
    main()