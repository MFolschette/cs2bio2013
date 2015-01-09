#!/usr/bin/env bash

# sh run-generator.sh egfr104 'erbb1 erbb2 erbb3 erbb4 ar bir btc egf epr hbegf nrg1a nrg1b nrg2a nrg2b nrg3 nrg4 tgfa' 'elk1 creb ap1 hsp27 actin_reorg cmyc pro_apoptotic p70s6_2 pkc stat1 stat3 stat5'

ph="egfr104.ph"
outputs="elk1 creb ap1 hsp27 actin_reorg cmyc pro_apoptotic p70s6_2 pkc stat1 stat3 stat5"
mode=${1}

ulimit -t 4

for erbb1 in 0 1; do
for erbb2 in 0 1; do
for erbb3 in 0 1; do
for erbb4 in 0 1; do
for ar in 0 1; do
for bir in 0 1; do
for btc in 0 1; do
for egf in 0 1; do
for epr in 0 1; do
for hbegf in 0 1; do
for nrg1a in 0 1; do
for nrg1b in 0 1; do
for nrg2a in 0 1; do
for nrg2b in 0 1; do
for nrg3 in 0 1; do
for nrg4 in 0 1; do
for tgfa in 0 1; do

init="erbb1 $erbb1, erbb2 $erbb2, erbb3 $erbb3, erbb4 $erbb4, ar $ar, bir $bir, btc $btc, egf $egf, epr $epr, hbegf $hbegf, nrg1a $nrg1a, nrg1b $nrg1b, nrg2a $nrg2a, nrg2b $nrg2b, nrg3 $nrg3, nrg4 $nrg4, tgfa $tgfa"
echo "--- $init"
for z in $outputs; do
  echo "# $z 1"
  ./unitrun.sh $mode "x" --no-debug --initial-state "$init" -i $ph $z 1
  [ $? -eq 137 ] && echo '*** Killed ***';
done

done
done
done
done
done
done
done
done
done
done
done
done
done
done
done
done
done
