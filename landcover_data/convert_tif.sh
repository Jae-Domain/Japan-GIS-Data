#!/bin/bash

INPUT_DIR="JAXA_HRLULC_Japan_v23.12_250m"

OUTPUT_DIR="shapefile"

mkdir -p "$OUTPUT_DIR" #checks for output directory

for input_file in "$INPUT_DIR"/*.tif; do

	file_name=$(basename -- "$input_file")
	file_name="${file_name%.*}"
	echo "Processing: $file_name"
	output_file="$OUTPUT_DIR/${file_name}.shp"
	echo "Outputting: $output_file"
	#run function
	gdal_polygonize.py "$input_file" -b 1 -f "ESRI Shapefile" "$output_file" output DN

done

echo "Conversion complete."
