parent="/home/pan/sisop/soal-shift-sisop-modul-1-A10-2021"

list=$(find $parent \( -name "Kelinci_*" -o -name "Kucing*" \) -type d)
pass=$(date +%m%d%y)
zip -P $pass -r $parent/Koleksi.zip $list