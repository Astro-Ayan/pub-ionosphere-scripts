#!/bin/bash

rm fort.*
rm *grid*.dat
rm *.out
rm grid_limits

ls *Bin*.dat | sed '/-proc/d' > binfiles
ifort 6-Datapick.f -o 6-Datapick.out
ifort proc_grids.f -o proc_grids.out


ii=`wc binfiles | awk '{print $1}'`
for i in `seq 1 "$ii"`
do
input=`sed -n ''$i','$i' p' 'binfiles'`
echo $input

outputbase=`echo "$input" | cut -c '1-10'`
sed -n '1,$ p' ''$outputbase'-proc.dat' | sed '/^$/d' |  awk '{print $1,$2}' > fort.1111

#cp "$outputbase"-proc.dat fort.1111
lineproc=`wc fort.1111 | awk '{print $1}'`
echo $lineproc > fort.2222

./proc_grids.out

./textgrid.sh

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
