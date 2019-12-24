#!/bin/sh
#@srm.vinay0005@gmail.com
###########################INPUT FILES #####################################
diamond_out_file="/home/ncim/rky/BSL01_VGs"  #set_diamond_output_file_location
database="/home/ncim/rky/VFDB_setA_pro.fas"  #set_database_file_location
############################################################################
dir=$PWD
Ids="$dir/IDS.txt"  
result_file="$dir/result.txt"
Final_Output="$dir/result.tsv"
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
###########################################################################

date
if [ -f "$database" ]; then
    echo "${green}Database file : $database ${reset}"
else 
    echo "${green}Database does not exist !!! CHECK_DATABASE_DIRECTORY!!!${reset}"
fi

#MAIN_BODY
echo "${green}Diamond Output File :$diamond_out_file${reset}"
echo "####################################################"
echo "${red}GREPING IDS FROM DATABASE FILE :$database........${reset}"
awk '{print $2}' "$diamond_out_file">$Ids
while read line;
do grep -wF "$line" $database ;
done <$Ids >$result_file
paste $Ids $result_file >$Final_Output
rm $result_file
rm $Ids
echo "${green}Final Output file : $Final_Output ${reset}"
echo "HAVE A GOOD DAY :)"

#############################################################################
