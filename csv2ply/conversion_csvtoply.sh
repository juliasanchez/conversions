FILE="$1"
awk '{if (NR!=1) {print}}' "$1" >"${FILE%%.*}"_temp.csv 
awk 'END{printf("ply\nVERSION 0.7\nformat ascii 1.0\nelement vertex %d\nproperty float x\nproperty float y\nproperty float z\nend_header\n",NR)}' "${FILE%%.*}"_temp.csv >entete.txt
awk -F"," '{printf("%g %g %g\n",$2,$3,$4)}' "${FILE%%.*}"_temp.csv  > "${FILE%%.*}"_temp1.csv 
cat entete.txt >"${FILE%%.*}".ply
cat "${FILE%%.*}"_temp1.csv >>"${FILE%%.*}".ply
rm "${FILE%%.*}"_temp1.csv 
rm "${FILE%%.*}"_temp.csv 

