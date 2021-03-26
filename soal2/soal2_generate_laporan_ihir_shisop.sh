#2a

awk -F '\t' 'BEGIN{
    max_profit = 0.0;
    id = 1;
} 
{
    profit = $21
    cost_price = $18-profit
    percentage = (profit/cost_price) * 100
    if (percentage > max_profit)
    {
        max_profit = percentage
        id = $1
    }
}
END{
    printf "Transaksi terakhir dengan profit percentage terbesar yaitu %d\n",id
    printf "dengan presentase %f%%\n\n",max_profit;
}
' Laporan-TokoShiSop.tsv

#2b
awk -F '\t' '
{
    if ($10 == "Albuquerque")
        print $7"-"$3
}
' Laporan-TokoShiSop.tsv | awk -F '-' 'BEGIN{
    printf "Daftar nama customer di Albuquerque pada tahun 2017 antara lain:\n"
}
$4 >= 17 {print $1}'

#2c
awk -F '\t' 'BEGIN{
    cnt_home = 0;
    cnt_cust = 0;
    cnt_corp = 0;
}
{
    if ($8 == "Home Office")
        cnt_home++;
    else if ($8 == "Consumer")
        cnt_cust++;
    else if ($8 == "Corporate")
        cnt_corp++;
}
END{
    printf "\nTipe segmen customer yang penjualannya paling sedikit adalah Home Office dengan %d total transaksi.\n\n",cnt_home
}
' Laporan-TokoShiSop.tsv

awk -F '\t' 'BEGIN{
    cnt["Central"] = 0;
    cnt["South"] = 0;
    cnt["East"] = 0;
    cnt["West"] = 0;
}
{
    cnt[$13]++;
}
END{
    mn = 100000
    name = "Central"
    for (key in cnt)
    {
        if (cnt[key] < mn && key != "Region")
        {
            mn = cnt[key];
            name = key;
        }
    }
    printf "Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d\n",name,cnt[name];
}
' Laporan-TokoShiSop.tsv