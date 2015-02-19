#!/bin/bash

ulimit -t 10

#ph-reach -i egfr104.ph --initial-state "erbb1 1, erbb2 0, erbb3 0, erbb4 1, ar 0, bir 0, btc 0, egf 0, epr 1, hbegf 0" elk1 1 --coop-priority ; echo $?

outputs="elk1 creb ap1 hsp27 actin_reorg cmyc pro_apoptotic p70s6_2 pkc stat1 stat3 stat5"
init="erbb1 1, erbb2 0, erbb3 0, erbb4 1, ar 0, bir 0, btc 0, egf 0, epr 1, hbegf 0"
echo "--- $init"
for z in $outputs; do
  echo "# $z 1"
  ./unitrun.sh $1 "x" --no-debug --initial-state "$init" -i "egfr104.ph" $z 1
  [ $? -eq 137 ] && echo '*** Killed ***';
done

