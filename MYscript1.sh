#!/bin/bash
input_dir="$1"
output_dir="$2"
find "$input_dir" -type f | while read -r file; do
    filename=$(basename "$file")
    target_file="$output_dir/$filename"
    cnt=1
    
    while [ -f "$target_file" ]; do
        target_file="${output_dir}/${filename%.*}_$cnt.${filename##*.}"
        let cnt+=1
    done
    
    cp "$file" "$target_file"
done
echo "Done"
