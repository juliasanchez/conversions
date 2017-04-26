FILE="$1"
awk -F "," '{printf("%g,%g,%g\n",$1,$2,$3)}' "${FILE%%.*}".txt  > "${FILE%%.*}"_convert.txt

