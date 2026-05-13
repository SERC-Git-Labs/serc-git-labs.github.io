#! /bin/bash
# This script is used to generate powerpoint files from markdown files with `slides` attribute.
#
# Usage:
#   .github/scripts/convert_to_pptx.sh

cwd=$(pwd)
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# set value for ARTIFACTS_DIR if not set
if [ -z "$ARTIFACTS_DIR" ]; then
  ARTIFACTS_DIR="./artifacts"
fi

MERMAID_CONVERT_DIR="./mmdc"

# create artifacts directory if not exist
mkdir -p "$ARTIFACTS_DIR"
mkdir -p "$MERMAID_CONVERT_DIR"

# find all markdown files with `slides` attribute
files=$(find ./docs -name "*.md" -type f -exec grep -l 'slides:' {} \;)
# echo number of files found
echo "Found $(echo "$files" | wc -l) files"

# generate powerpoint files
for file in $files
do
  echo ""
  echo "Generating powerpoint for $file"
  filename=$(basename "$file")
  new_file="${file#./docs/}"      # remove ./docs/ from the beginning
  new_file="${new_file//\//-}"    # replace / with -
  pptx_file="${new_file%.md}.pptx" # change extension to pptx

  # convert mermaid diagrams to images (png)
  echo "Converting mermaid diagrams to images"
  mmdc --puppeteerConfigFile "$script_dir/.puppeteerrc.json" -i "$file" -o "$MERMAID_CONVERT_DIR/$new_file" -b transparent -e png -t default

  echo "Saving to $ARTIFACTS_DIR/$pptx_file"
  # generate powerpoint file
  (
    cd $MERMAID_CONVERT_DIR # mermaid images are relative to this directory
    pandoc "$new_file" -o "$cwd/$ARTIFACTS_DIR/$pptx_file" --slide-level=2 --reference-doc="$cwd"/additional-files/reference.pptx
  )
done
