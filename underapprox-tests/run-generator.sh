#!/usr/bin/env bash

# Generator of .sh scripts for multiple reachability tests.
# 
# Usage:
#   sh run-generator.sh <filename> <inputs> <outputs>
# where <filename> is the name of the .ph file (without extension)
# and determines the name of the file created: run-<filename>.sh,
# and <input> and <output> are strings containing the input and output
# sort names separated by spaces.
# 
# Example:
#   sh run-generator.sh egfr104 'erbb1 erbb2 erbb3' 'elk1 creb ap1'
# creates a file named run-egfr104.sh that checks the reachability
# of process 1 of each output for all initial configuration fo the inputs.
# This file can be executed with:
#   sh run-egfr104.sh ph
# Separating program outputs and debug outputs can be achieved with:
#   (sh run-egfr104.sh ph) 1> run-egfr104.out 2> run-egfr104.debug.out



model="$1.ph"
runfile="run-$1.sh"
inputs=$2
outputs=$3



# Header
echo '#!/usr/bin/env bash' > $runfile
echo '' >> $runfile
echo -n "# Date: " >> $runfile
date >> $runfile
echo "# Generated by:" >> $runfile
echo "# sh $0 $1 '$2' '$3'" >> $runfile
echo '' >> $runfile
echo "# File: $model" >> $runfile
echo "# Inputs: $inputs" >> $runfile
echo "# Outputs: $outputs" >> $runfile
echo '' >> $runfile
echo "ph=\"${model}\"" >> $runfile
echo "outputs=\"${outputs}\"" >> $runfile
echo 'mode=${1}' >> $runfile
echo '' >> $runfile

echo "echo -n \"Start time: \" && date" >> $runfile
echo "echo 'Model: $model'" >> $runfile
echo "echo 'Inputs: $inputs'" >> $runfile
echo "echo 'Outputs: $outputs'" >> $runfile
echo '' >> $runfile
echo "(echo -n \"Start time: \" && date) >&2" >> $runfile
echo "(echo 'Model: $model') >&2" >> $runfile
echo "(echo 'Inputs: $inputs') >&2" >> $runfile
echo "(echo 'Outputs: $outputs') >&2" >> $runfile
echo '' >> $runfile

# For loops
for curinput in $inputs; do
  echo "for $curinput in 0 1; do" >> $runfile
done
lastinput=$curinput
echo '' >> $runfile

# Initial state
echo -n "init=\"" >> $runfile
for curinput in $inputs; do
  echo -n "$curinput \$$curinput" >> $runfile
  [ $curinput != $lastinput ] && (echo -n ", " >> $runfile);
done
echo "\"" >> $runfile

# Loop body
echo "echo \"--- \$init\"" >> $runfile
echo "for z in \$outputs; do" >> $runfile
echo "  echo \"# \$z 1\"" >> $runfile
echo -n "  ./unitrun.sh \$mode \"" >> $runfile

# Initial state name
for curinput in $inputs; do
  echo -n "\$$curinput" >> $runfile
done

echo "\" --no-debug --initial-state \"\$init\" -i \$ph \$z 1" >> $runfile
echo "  [ \$? -eq 137 ] && echo '*** Killed ***'" >> $runfile
echo "done" >> $runfile
echo '' >> $runfile

# Done statements
for curinput in $inputs; do
  echo "done" >> $runfile
done
echo '' >> $runfile

# Footer
echo "echo -n \"End time: \" && date" >> $runfile
echo "(echo -n \"End time: \" && date) >&2" >> $runfile
echo '' >> $runfile
