#!/usr/local/bin/bash
# Script to run our Explorer on different maps

rm -rf scripts/results/full_logs/*
rm -rf scripts/results/reports/*

# Island contracts, each corresponds to one week
mapfile -t contracts < scripts/data/contracts.txt

# Different spawn points
mapfile -t pos < scripts/data/positions.txt

i=0

# Runs all the configurations on all maps
for f in scripts/maps/*.json; do
	for j in "${pos[@]}"; do
		bash scripts/subscripts/exec_map.sh $f $j ${contracts[i]}
	done
	((i++))
done;