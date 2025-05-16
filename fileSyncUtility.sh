#!/bin/bash

# File Sync Utility
# This script synchronizes files between two directories.
# It copies files from folderA to folderB and vice versa, ensuring that
# the most recent version of each file is kept in both folders.

# Usage: ./fileSyncUtility.sh <folderA> <folderB>
# Two-way sync: updates newer files in both directions

# Function to show usage
showUsage() {
  echo "Usage: $0 <folderA> <folderB>"
  exit 1
}

# Check arguments
if [ "$#" -ne 2 ]; then
  showUsage
fi

folderA="$1"
folderB="$2"

# Check if both arguments are directories
if [ ! -d "$folderA" ] || [ ! -d "$folderB" ]; then
  echo "Both arguments must be valid directories."
  exit 1
fi

# Sync from A to B
find "$folderA" -maxdepth 1 -type f -print0 | while IFS= read -r -d '' file; do
  filename=$(basename "$file")
  fileInB="$folderB/$filename"

  if [ ! -e "$fileInB" ] || [ "$file" -nt "$fileInB" ]; then
    cp -u "$file" "$fileInB"
    echo "Synced $filename from A to B"
  fi
done

# Sync from B to A
find "$folderB" -maxdepth 1 -type f -print0 | while IFS= read -r -d '' file; do
  filename=$(basename "$file")
  fileInA="$folderA/$filename"

  if [ ! -e "$fileInA" ] || [ "$file" -nt "$fileInA" ]; then
    cp -u "$file" "$fileInA"
    echo "Synced $filename from B to A"
  fi
done

echo "Synchronization complete."