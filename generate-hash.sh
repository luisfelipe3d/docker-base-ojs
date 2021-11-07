#!/bin/bash

# Generate SHA-512 hashes of all versions (or any other extension) files from https://pkp.sfu.ca/ojs/ojs_download/
for f in *.tar.gz
do
    hash=`sha512sum $f`
    echo "$f  :  $hash"
    sha512sum $f >> "ojs-hashes.txt"
done
