#!/usr/bin/env python3

import os
import glob
import argparse
import pandas as pd
import matplotlib.pyplot as plt
from scipy.spatial.distance import pdist, squareform


def parse_args():
    parser = argparse.ArgumentParser(
        description="Calculate Bray-Curtis beta diversity."
    )

    parser.add_argument(
        "--input",
        required=True,
        help="Directory containing virus summary files."
    )

    parser.add_argument(
        "--table",
        required=True,
        help="Output beta diversity table."
    )

    parser.add_argument(
        "--plot",
        required=True,
        help="Output heatmap image."
    )

    return parser.parse_args()


def build_abundance_matrix(input_dir):

    files = glob.glob(os.path.join(input_dir, "*_virus_summary.tsv"))

    abundance = {}

    for file in files:

        sample = os.path.basename(file).replace("_virus_summary.tsv", "")

        df = pd.read_csv(file, sep="\t")

        abundance[sample] = dict(zip(df["Virus"], df["Contigs"]))

    abundance_df = pd.DataFrame(abundance).fillna(0)

    return abundance_df


def calculate_beta_diversity(abundance_df):

    distance_matrix = squareform(
        pdist(abundance_df.T, metric="braycurtis")
    )

    beta_df = pd.DataFrame(
        distance_matrix,
        index=abundance_df.columns,
        columns=abundance_df.columns
    )

    return beta_df


def save_heatmap(beta_df, output_file):

    plt.figure(figsize=(8, 6))

    plt.imshow(beta_df, aspect="auto")

    plt.colorbar(label="Bray-Curtis Distance")

    plt.xticks(
        range(len(beta_df.columns)),
        beta_df.columns,
        rotation=90
    )

    plt.yticks(
        range(len(beta_df.index)),
        beta_df.index
    )

    plt.title("Beta Diversity (Bray-Curtis)")

    plt.tight_layout()

    plt.savefig(output_file, dpi=300)

    plt.close()


def main():

    args = parse_args()

    abundance_df = build_abundance_matrix(args.input)

    beta_df = calculate_beta_diversity(abundance_df)

    beta_df.to_csv(args.table, sep="\t")

    save_heatmap(beta_df, args.plot)


if __name__ == "__main__":
    main()