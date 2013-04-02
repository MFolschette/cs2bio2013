#!/usr/bin/env bash
ph="../model.ph"
outputs="sre ap1 nfkb nfat"
mode=${1}

for i in 0 1; do
	for j in 0 1; do
		for k in 0 1; do
			init="cd45 $i, cd28 $j, tcrlig $k"
			echo "--- $init"
			for z in $outputs; do
				echo "# $z 1"
				./unitrun.sh $mode "$i$j$k" --no-debug --initial-state "$init" -i $ph $z 1
			done
		done
	done
done

