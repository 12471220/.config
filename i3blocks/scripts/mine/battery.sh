battery=`acpi|awk '{gsub(" ","")};{gsub(",|:"," ");print $3}'`;
statue=`acpi|awk '{gsub(",","")};{print $3}'`;

if [[ $statue == "Discharging" ]]; then
    statue="disc"
elif [[ $statue == "Charging" ]]; then
    statue="chr"
elif [[ $statue == "Full" ]]; then
    statue="F"
elif [[ $statue == 'Not' ]];then
    statue='notc'
else
    statue="unknown"
fi
echo $battery"("$statue")"
# echo `acpi|awk '{gsub(",|%","");print $4"("$3")"}'`