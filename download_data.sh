#!/bin/bash

# Declare a dictionary with the Google Drive file IDs
declare -A dictionary
dictionary["data_6bands_noGrid"]="1AdhEch5lpR1WoYJlwgdUoYYgd9l_vnO-"

# Check if the file name was provided as a parameter
if [ -z "${dictionary[$1]}" ]; then
  echo "File not found: $1"
  exit 1
fi

FILEID=${dictionary[$1]}
OUTFILE="$1.zip"  # Ensure the extension is correct for your file

# Download the file using gdown
gdown "https://drive.google.com/uc?id=$FILEID" -O "$OUTFILE"
echo "Downloaded: $OUTFILE"

# Unzip the file
if unzip "$OUTFILE"; then
  echo "Unzipped: $OUTFILE"
  # Remove the zip file after unzipping
  rm "$OUTFILE"
  echo "Zip file removed."
else
  echo "Failed to unzip $OUTFILE"
fi