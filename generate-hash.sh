!/usr/bin/env bash

# ===============================================================================
#          FILE:  generate-hash.sh
#
#         USAGE:  gerente-hash
#
#   DESCRIPTION:  A script to download all versions of OJS and take checksum.
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
#       UPDATED:  11/07/2021 16:11:45 CEST
#      REVISION:  0.1
#===============================================================================

fileVersions='ojs-versions.txt'
if [ -f "$fileVersions" ]; then
    echo "Downloading all versions of ojs from https://pkp.sfu.ca/ojs/ojs_download/"
    while read p
    do
        wget https://pkp.sfu.ca/ojs/download/ojs-$p.tar.gz -P versions/
    done < "$fileVersions"

fi

# Generate SHA-512 hashes of all versions (or any other extension) files from https://pkp.sfu.ca/ojs/ojs_download/
for f in ojs-*.tar.gz
do
    hash=`sha512sum $f`
    echo "$hash"
    sha512sum $f >> "CHECKSUMSHA512.txt"
done
