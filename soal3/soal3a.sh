# mkdir kucing

dir=`pwd`/kucing

# echo $dir

cnt=1

for ((i=1; i<=23; i=i+1))
do
    wget https://loremflickr.com/320/240/kitten -o tmp.log -P $dir
    filename=`grep -m 1 -o [0-9].*jpg tmp.log`
    echo $filename
    mv kucing/kitten kucing/$filename
    cat tmp.log >> foto.log
# done

tmp=`ls kucing/*.jpg`

for img in $tmp ;
do
    # echo $img
    name=Koleksi_
    if [ $cnt -lt 10 ] ; then
        name+=0
    fi
    name+=$cnt
    # echo $name
    mv -v $img kucing_lagi/$name.jpg
    cnt=$((cnt+1))
done