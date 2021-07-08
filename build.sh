#!/bin/bash
BLAST_DB_DIR=/panfs/pan1/gpipe/ThirdParty/ExternalData/Contamination/production/CommonContaminants

# only wordy outputs (-outfmt 0 or 1):
# $NCBI/c++.stable/Release64MT/bin/vecscreen
# VECSCREEN=/netopt/ncbi_tools64/c++.stable/Release64MT/bin/vecscreen

#PARENT_OF_BIN=/netopt/ncbi_tools64/c++.stable/Release64MT <-- executables there need extra libraries not present on awspet
#BLASTN=bin/blastn
BLAST_TAR_FILE=ncbi-blast-2.12.0+-x64-linux.tar.gz

# regr-fscr-split_test regr-fscr-test8 regr-fscr-test11 regr-fscr-test7
SAMPLES=samples/GCA_000173135.1_reduced.1.fna
#OUT=vecscreen.out
OUT=vecscreen_x.tgz

set -o xtrace

#$VECSCREEN -db $BLAST_DB_DIR/gcontam1 -query $SAMPLES -outfmt 7 -out vecscreen.out
# -lcase_masking
#$BLASTN -db $BLAST_DB_DIR/gcontam1 -query $SAMPLES -perc_identity 90.0 -outfmt 6 -out $OUT

mkdir bin; true
# rm -f $BLAST_TAR_FILE
# wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/$BLAST_TAR_FILE
# tar -Ozxf $BLAST_TAR_FILE --wildcards "*/bin/blastn" >bin/blastn
# chmod a+x bin/blastn

cp /home/sapojnik/genomebuild/bin/{ExtractAccession.pm,MegaBlastFilter} bin

#tar -zcf $OUT samples/* $BLASTN -C "$(dirname "$BLAST_DB_DIR")" "$(basename "$BLAST_DB_DIR")"
rm -f $OUT
tar -zcf $OUT --exclude="*BAK*" --exclude="*/NoMask*" samples/* bin/* progs/* CommonContaminants/* -C "$(dirname "$BLAST_DB_DIR")" "$(basename "$BLAST_DB_DIR")"
