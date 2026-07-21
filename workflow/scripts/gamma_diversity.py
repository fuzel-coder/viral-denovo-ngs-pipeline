import os
import argparse
import pandas as pd

parser = argparse.ArgumentParser()
parser.add_argument("--input", required=True, help="Taxonomy results folder")
parser.add_argument("--output", required=True, help="Output TSV file")
args = parser.parse_args()

total_species = set()

for file in os.listdir(args.input):
    if file.endswith("_virus_summary.tsv"):
        df = pd.read_csv(os.path.join(args.input, file), sep="\t")

        if "Virus" in df.columns:
            total_species.update(df["Virus"].dropna().tolist())

gamma = len(total_species)

with open(args.output, "w") as out:
    out.write("Metric\tValue\n")
    out.write(f"Gamma_Diversity\t{gamma}\n")

print(f"Gamma diversity: {gamma}")