#!/bin/sh
#@srm.vinay0005@gmail.com
###########################INPUT FILES & VARIABLE_SETTING#####################################
############################################################################
dir=$PWD
nanoARG_file="$dir/NanoARG_data_.txt"  
temp1_category="$dir/category.txt"
type="ARG"
category_wise_file="$dir/All_samples_ARG.txt"
samples_list="$dir/list.txt"
temp1="$dir/Sample_"$line"_ARG.txt"
temp2="$dir/temp"
temp3="$dir/newfile"
Final_Output="$dir/result.tsv"
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
###########################################################################
echo "Deleting previous files";
rm $temp1_category
rm $category_wise_file
rm $samples_list
rm $Final_Output
rm *_out *_grep

grep -w "$type" $nanoARG_file > $category_wise_file
awk '{print $3}' $category_wise_file |sort -u > $temp1_category
awk '{print $1}' $category_wise_file |sort -u > $samples_list

	for line in $(cat list.txt);
	do
	grep -w "$line" $category_wise_file >"$line"_out
	done


	for file in *out
	do
		while read LINE; 
		do
		
		grep "$LINE" "$file" |wc -l >>"$file"_grep
		done <$temp1_category
	done
echo "category" > $temp3
cat "$temp1_category" >> $temp3
mv "$temp3" "$temp1_category"


for file in *_grep
do
echo "$file" >$temp2 
cat "$file" >>"$temp2"
mv "$temp2" "$file"
done


paste $temp1_category *_grep >$Final_Output
echo "Final Output file : $Final_Output ";


