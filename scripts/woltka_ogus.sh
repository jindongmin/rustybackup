#!/bin/sh
#SBATCH -p ccb
#SBATCH --exclusive

cd /mnt/home/djin/ceph/scripts

#WOL=/mnt/home/djin/ceph/databases/wol
WOL=/mnt/home/jmorton/ceph/wol2/wol2

# argument: path to read 1.
file=../Lloyd_Price2019/align_wol
echo `which basename`
echo `basename --version`
echo "File: ${file}"
#fname=$(basename $file .sam)
echo "Folder: ${fname}"
mkdir ../Lloyd_Price2019/genome_mappings
mkdir ../Lloyd_Price2019/bioms
woltka classify \
    --input $file \
    --map $WOL/taxonomy/taxid.map \
    --nodes $WOL/taxonomy/nodes.dmp \
    --names $WOL/taxonomy/names.dmp \
    --outmap ../Lloyd_Price2019/genome_mappings \
    -o ../Lloyd_Price2019/bioms/ogus.biom


woltka classify \
  -i $file \
  --coords $WOL/proteins/coords.txt.xz \
  --map $WOL/function/uniref/uniref.map.xz \
  --map $WOL/function/kegg/ko.map.xz \
  --map-as-rank \
  --rank ko \
  --stratify ../Lloyd_Price2019/genome_mappings \
  -o ../Lloyd_Price2019/bioms/ogus_func.biom
