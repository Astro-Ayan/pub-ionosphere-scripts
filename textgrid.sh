#!/bin/bash
#For writing the 'grid' numbers into the grid_limits file
rm grid_limits
i=`wc 'fort.33333' | awk '{print $1}'`
echo $i
for ii in `seq 1 "$i"`
do
c1=`sed -n ''$ii', '$ii' p' 'fort.33333' | awk '{print $1}'`
c2=`sed -n ''$ii', '$ii' p' 'fort.33333' | awk '{print $2}'`
c3=`sed -n ''$ii', '$ii' p' 'fort.33333' | awk '{print $3}'`
c4=`sed -n ''$ii', '$ii' p' 'fort.33333' | awk '{print $4}'`
c5=`sed -n ''$ii', '$ii' p' 'fort.33333' | awk '{print $5}'`
c6=`sed -n ''$ii', '$ii' p' 'fort.33333' | awk '{print $6}'`

if [ "$c6" == 0 ]
then
echo $c1 $c2 $c3 $c4 "grid"$c5 >> grid_limits
else
echo $c1 $c2 $c3 $c4 "grid"$c5"-"$c6 >> grid_limits
fi
done
