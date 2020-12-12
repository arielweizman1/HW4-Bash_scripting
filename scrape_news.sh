#!/bin/bash
wget https://www.ynetnews.com/category/3082
list=`grep -Eo "https://www.ynetnews.com/article/\b[[:alnum:]]{9}\b" 3082 | sort -u`
arr=($list)

grep -Eo "https://www.ynetnews.com/article/\b[[:alnum:]]{9}\b" 3082 | sort -u | wc -l > results.csv

for i in "${arr[@]}"; do
	wget "$i"
	beni=`grep -Eo  "Gantz" "${i: -9}" | wc -l`
	bibi=`grep -Eo "Netanyahu" "${i: -9}" | wc -l`
	rm -f "${i: -9}"
	if (( Gantz==0 )) && (( bibi==0 )); then
	echo "$i", - >> results.csv
	else
	echo "$i, Netanyahu, $bibi, Gantz, $beni" >> results.csv
fi
done
rm -f 3082