#!/bin/bash

rm fort.*
rm *grid*.dat
rm *.out

ls *Bin*.dat > binfiles
ifort 6-Datapick.f -o 6-Datapick.out


ii=`wc binfiles | awk '{print $1}'`
for i in `seq 1 "$ii"`
do
input=`sed -n ''$i','$i' p' 'binfiles'`
echo $input

outputbase=`echo "$input" | cut -c '1-10'`

jj=`wc grid_limits | awk '{print $1}'`
for j in `seq 1 "$jj"`
do
el1=`sed -n ''$j','$j' p' 'grid_limits' | awk '{print $1}'`
el2=`sed -n ''$j','$j' p' 'grid_limits' | awk '{print $2}'`
alpha1=`sed -n ''$j','$j' p' 'grid_limits' | awk '{print $3}'`
alpha2=`sed -n ''$j','$j' p' 'grid_limits' | awk '{print $4}'`
grid=`sed -n ''$j','$j' p' 'grid_limits' | awk '{print $5}'`

cp "$input" fort.1
line=`wc fort.1 | awk '{print $1}'`
echo $line $el1 $el2 $alpha1 $alpha2 > fort.2
echo $line $el1 $el2 $alpha1 $alpha2 $grid

./6-Datapick.out 

cp fort.22222 "$outputbase"-"$grid".dat
#mv "$outputbase"-"$grid".dat DATAFILES/.
rm fort.22222
done


done
