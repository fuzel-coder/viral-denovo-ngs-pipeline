rule report:
    input:
        contigs="results/assembly/{sample}/contigs.fasta",
        blast="results/blast/{sample}.blast.tsv",
        fasta="blast_db/viral.1.1.genomic.fna"

    output:
        report="results/reports/{sample}_final_report.txt"

    shell:
        """
        mkdir -p results/reports

        CONTIGS=$(grep -c "^>" {input.contigs})

        cat > {output.report} << EOF
====================================================
             De Novo Viral NGS Report
====================================================

Sample Name:
{wildcards.sample}

Pipeline Status:
SUCCESS

Assembly
--------
Assembly completed successfully.

Number of Contigs:
$CONTIGS

BLAST Analysis
--------------
Database:
NCBI Viral Database

Detected Viral Matches
----------------------

EOF

        if [ ! -s {input.blast} ]; then

            echo "No significant viral match found." >> {output.report}

        else

            cut -f2 {input.blast} | uniq | while read ACC
            do

                LINE=$(grep -m1 "$ACC" {input.blast})

                PID=$(echo "$LINE" | cut -f3)
                LEN=$(echo "$LINE" | cut -f4)
                EVALUE=$(echo "$LINE" | cut -f11)
                BITSCORE=$(echo "$LINE" | cut -f12)

                VIRUS=$(grep "^>$ACC" {input.fasta} | sed "s/^>$ACC //" )

                if [ -z "$VIRUS" ]; then
                    VIRUS="Unknown virus"
                fi

                echo "Virus Name      : $VIRUS" >> {output.report}
                echo "Accession       : $ACC" >> {output.report}
                echo "Percent Identity: $PID %" >> {output.report}
                echo "Alignment Length: $LEN bp" >> {output.report}
                echo "E-value         : $EVALUE" >> {output.report}
                echo "Bit Score       : $BITSCORE" >> {output.report}
                echo "--------------------------------------------" >> {output.report}

            done

        fi

        cat >> {output.report} << EOF

====================================================
Pipeline completed successfully.
====================================================
EOF
        """