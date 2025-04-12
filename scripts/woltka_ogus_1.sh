#!/bin/sh
#SBATCH -p ccb
#SBATCH --exclusive

cd /mnt/home/djin/ceph/scripts

#WOL=/mnt/home/djin/ceph/databases/wol
WOL=/mnt/home/jmorton/ceph/wol2/wol2

# argument: path to read 1.
file=../Lloyd_Price2019/align_wol_1
echo `which basename`
echo `basename --version`
echo "File: ${file}"
#fname=$(basename $file .sam)
echo "Folder: ${fname}"
mkdir ../Lloyd_Price2019/genome_mappings_1
#mkdir ../Lloyd_Price2019/bioms
woltka classify \
    --input $file \
    --outmap ../Lloyd_Price2019/genome_mappings_1 \
    -o ../Lloyd_Price2019/bioms/ogus_1.biom
