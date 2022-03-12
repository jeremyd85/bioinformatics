#!/bin/bash

temp_dir=$(mktemp -d -t gen-XXXXXXXXXX);

input_name=$1;
filter_filename=$2;
output_name=$3;

convertf_out="$temp_dir/convertf_out";
filtered_out="$temp_dir/filtered_out";

parameter_path="$temp_dir/par.txt";
{
  echo "something1: $input_name.geno";
  echo "something2: $input_name.snp";
  echo "something3: $input_name.ind";
  echo "something4: something";
  echo "something5: $convertf_out.bed";
  echo "something6: $convertf_out.bim";
  echo "something7: $convertf_out.fam";
} >> "$parameter_path";

convertf -p "$parameter_path"

plink1 {options1}

plink1 {options2}

rm -rf "$temp_dir";