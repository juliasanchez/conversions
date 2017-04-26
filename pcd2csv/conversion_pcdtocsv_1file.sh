FILE="$1"
awk '{if (NR>=12) {print}}' "$1" >"${FILE%%.*}"_temp.csv 
awk -F " " '{printf("%g,%g,%g\n",$1,$2,$3)}' "${FILE%%.*}"_temp.csv  > "${FILE%%.*}".csv 
rm "${FILE%%.*}"_temp.csv 

