#! /bin/bash

for d in */; do
	for image in "$d"/*.jpg; do
		cwebp -q 100 "$image" -o "${image%.*}.webp"
	done
done
