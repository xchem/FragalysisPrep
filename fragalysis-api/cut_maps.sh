#!/bin/bash
source /ccp4/bin/ccp4.setup-sh
folders=$(ls $1/aligned/)
for i in $folders
do
echo $i
str=$(echo $1/aligned/$i/)
maps=$(find $str -name *.map)
ccp4s=$(find $str -name *.ccp4)
for j in $maps
do
echo $j
mapmask mapin $j mapout $j xyzin $1/aligned/$i/$i.pdb << eof
border 12
end
eof
done
for j in $ccp4s
do
echo $j
mapmask mapin $j mapout $j xyzin $1/aligned/$i/$i.pdb << eof
border 12
end
eof
done
done