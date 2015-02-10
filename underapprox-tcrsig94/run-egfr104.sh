#!/usr/bin/env bash

# Date: mardi 10 février 2015, 11:25:48 (UTC+0100)
# Generated by:
# sh run-generator.sh egfr104 'erbb1 erbb2 erbb3 erbb4 bir btc egf epr nrg1a nrg1b nrg2b nrg4 tgfa' 'elk1 creb ap1 hsp27 actin_reorg cmyc pro_apoptotic p70s6_2 pkc stat1 stat3 stat5'

# File: egfr104.ph
# Inputs: erbb1 erbb2 erbb3 erbb4 bir btc egf epr nrg1a nrg1b nrg2b nrg4 tgfa
# Outputs: elk1 creb ap1 hsp27 actin_reorg cmyc pro_apoptotic p70s6_2 pkc stat1 stat3 stat5

ph="egfr104.ph"
outputs="elk1 creb ap1 hsp27 actin_reorg cmyc pro_apoptotic p70s6_2 pkc stat1 stat3 stat5"
mode=${1}

echo -n "Start time: " && date
echo 'Model: egfr104.ph'
echo 'Inputs: erbb1 erbb2 erbb3 erbb4 bir btc egf epr nrg1a nrg1b nrg2b nrg4 tgfa'
echo 'Outputs: elk1 creb ap1 hsp27 actin_reorg cmyc pro_apoptotic p70s6_2 pkc stat1 stat3 stat5'

(echo -n "Start time: " && date) >&2
(echo 'Model: egfr104.ph') >&2
(echo 'Inputs: erbb1 erbb2 erbb3 erbb4 bir btc egf epr nrg1a nrg1b nrg2b nrg4 tgfa') >&2
(echo 'Outputs: elk1 creb ap1 hsp27 actin_reorg cmyc pro_apoptotic p70s6_2 pkc stat1 stat3 stat5') >&2

for erbb1 in 0 1; do
for erbb2 in 0 1; do
for erbb3 in 0 1; do
for erbb4 in 0 1; do
for bir in 0 1; do
for btc in 0 1; do
for egf in 0 1; do
for epr in 0 1; do
for nrg1a in 0 1; do
for nrg1b in 0 1; do
for nrg2b in 0 1; do
for nrg4 in 0 1; do
for tgfa in 0 1; do

init="erbb1 $erbb1, erbb2 $erbb2, erbb3 $erbb3, erbb4 $erbb4, bir $bir, btc $btc, egf $egf, epr $epr, nrg1a $nrg1a, nrg1b $nrg1b, nrg2b $nrg2b, nrg4 $nrg4, tgfa $tgfa"
echo "--- $init"
for z in $outputs; do
  echo "# $z 1"
  ./unitrun.sh $mode "x" --no-debug --initial-state "$init" -i $ph $z 1
  [ $? -eq 137 ] && echo '*** Killed ***'
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

echo -n "End time: " && date
(echo -n "End time: " && date) >&2

