#! /bin/bash

for d in */; do
	for image in "$d"/*.png; do
		avifenc "$image" "${image%.*}.avif"
	done
done
