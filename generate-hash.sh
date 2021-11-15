#!/bin/bash

# ===============================================================================
#          FILE:  generate-hash.sh
#
#         USAGE:  gerente-hash
#
#   DESCRIPTION:  A script to download all versions of OJS/OMP/OPS and take checksum.
#
#    PARAMETERS:
#
#  REQUIREMENTS:  
#     TODO/BUGS:  ---
#         NOTES:  ---
#       AUTHORS:  Luis Leal.
#  ORGANIZATION:  ---
#       LICENSE:  GPL 3
#       CREATED:  11/07/2021 16:11:45 CEST
#       UPDATED:  11/14/2021 19:12:06 CEST
#      REVISION:  0.2
#===============================================================================

fileVersionsOJS='ojs-versions.txt'
fileVersionsOPS='ops-versions.txt'
fileVersionsOMP='omp-versions.txt'

if [ -f "$fileVersionsOJS" ]; then
    echo "Downloading all versions of OJS from https://pkp.sfu.ca/ojs/ojs_download/"
    while read p
    do
        if [ -f "ojs-$p.tar.gz" ]; then
            wget https://pkp.sfu.ca/ojs/download/ojs-$p.tar.gz -P versions/ojs/
        fi
    done < "$fileVersionsOJS"

fi

if [ -f "$fileVersionsOPS"]; then
    echo "Downloading all versions of OPS from https://pkp.sfu.ca/ops/"
    while read p
    do
        if [ -f "ops-$p.tar.gz" ]; then
            wget https://pkp.sfu.ca/ops/download/ops-$p.tar.gz -P versions/ops/
        fi
    done < "$fileVersionsOPS"
fi

if [ -f "$fileVersionsOMP"]; then
    echo "Downloading all versions of OMP from https://pkp.sfu.ca/omp/"
    while read p
    do
        if [ -f "omp-$p.tar.gz" ]; then
            wget https://pkp.sfu.ca/omp/omp_download/omp-$p.tar.gz -P versions/omp/

# Generate SHA-512 hashes of all versions (or any other extension) files from https://pkp.sfu.ca/ojs/ojs_download/
for f in *.tar.gz
do
    hash=`sha512sum $f`
    echo "$hash"
    sha512sum $f > "CHECKSUMSHA512.txt"
done
