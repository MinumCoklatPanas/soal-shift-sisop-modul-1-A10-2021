#!/bin/bash

awk -F "\t" 'BEGIN{max=0;id=0;profit=0}
        #2a
        pp = (($21/($18-$21))*100);

        {if(pp > max)
        {max=pp; id=$1}
        }
        #2b
        {if($3 ~/17/ && $10 == "Albuquerque" && x>=0)
        {nama[x]=$7;x++}
        }
        #2c
        {if($8 == "Home Office")
                count1++;
        else if($8 == "Consumer")
                count2++;
        else if($8 == "Corporate")
                count3++;
        }

        {if(count1<count2 && count1<count3)
                {count=count1; segment="Home Office"}
        else if(count2<count1 && count2<count3)
                {count=count2; segment="Consumer"}
        else if(count3<count1 && count3<count2)
                {count=count3; segment="Corporate"}
        }
#2d
        {if($13 == "South")
                {profit1+=$21}
        else if($13 == "East")
                {profit2+=$21}
        else if($13 == "West")
                {profit3+=$21}
        else if($13 == "North")
                {profit4+=$21}
        }

        {if(profit1<profit2 && profit1<profit3 && profit1<profit4)
                {totalprofit=profit1; region="South"}
        else if(profit2<profit1 && profit2<profit3 && profit2<profit4)
                {totalprofit=profit2; region="East"}
        else if(profit3<profit1 && profit3<profit2 && profit3<profit4)
                {totalprofit=profit3; region="West"}
        else if(profit4<profit1 && profit4<profit2 && profit4<profit3)
                {totalprofit=profit4; region="North"}
        } 
END {{printf "Transaksi terakhir dengan profit percentage terbesar yaitu ID %d dengan persentase %.2f%%\n",id,max}
{printf "Daftar nama customer di Albuquerque pada tahun 2017 antara lain: \n"
while(x--)
        {if(nama[x] != nama[x+1])
               printf "%s\n",nama[x]

}}
{printf "Tipe segment customer yang penjualannya paling sedikit adalah %s dengan %d transaksi\n",segment,count}
{printf "Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %.f\n",region,totalprofit}
}
' Laporan-TokoShiSop.tsv > hasil2.txt
