# mkdir kucing

curDate=$(date +%d-%m-%Y)

parent="/home/pan/sisop/soal-shift-sisop-modul-1-A10-2021"

mkdir $parent/$curDate

dir=$parent/kucing

# echo $dir

cnt=1

for ((i=1; i<=23; i=i+1))
do
    wget https://loremflickr.com/320/240/kitten -o tmp.log -P $dir
    filename=`grep -m 1 -o [0-9].*jpg tmp.log`
    echo $filename
    mv $parent/kucing/kitten $parent/kucing/$filename
    cat $parent/tmp.log >> $parent/$curDate/foto.log
done

tmp=`ls $parent/kucing/*.jpg`

for img in $tmp ;
do
    # echo $img
    name=Koleksi_
    if [ $cnt -lt 10 ] ; then
        name+=0
    fi
    name+=$cnt
    # echo $name
    mv -v $img $parent/$curDate/$name.jpg
    cnt=$((cnt+1))
done