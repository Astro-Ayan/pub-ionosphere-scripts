#!/bin/bash
rm fort.*
rm *Bin*.dat
rm *.out
ifort 4-Bin.f -o 4-Bin.out

input=01-04-sorted.dat
echo $input
date=`echo $input | cut -c '1-6'`
echo $date
outputbase="$date"Bin
#echo $outputbase "5" > fort.1
cp "$input" fort.1
line=`wc fort.1 | awk '{print $1}'`
echo $line > fort.2
./4-Bin.out
ls fort.1000* > list_binned
ii=`wc list_binned | awk '{print $1}'`
for i in `seq 1 "$ii"`
do
binfile=`sed -n ''$i','$i' p' 'list_binned'`
bin=`echo $binfile | cut -c '10-10'`
cp "$binfile" "$outputbase""$bin".dat
done
rm fort.1000*
