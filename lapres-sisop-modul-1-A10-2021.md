# lapres-sisop-modul-1-A10-2021

## Soal 1

“Ryujin baru saja diterima sebagai IT support di perusahaan Bukapedia. Dia diberikan tugas untuk membuat laporan harian untuk aplikasi internal perusahaan, ticky. Terdapat 2 laporan yang harus dia buat, yaitu laporan daftar peringkat pesan error terbanyak yang dibuat oleh ticky dan laporan penggunaan user pada aplikasi ticky.”
Mengolah data dari file syslog.log dan melakukan analisis kemudian hasilnya disimpan kedalam file berformat .csv

![syslog](https://user-images.githubusercontent.com/55073331/113462774-d06a8800-944c-11eb-8b88-2fd6f8b83e6a.jpg)

####Solusi

##### a. Regex untuk mengidentifikasi ERROR atau INFO

Menggunakan regex untuk mengidentifikasi apakah line terebut termasuk INFO atau ERROR.

![sourcecode-a](https://user-images.githubusercontent.com/55073331/113462791-dceee080-944c-11eb-915d-20f8f58896d3.jpg)

Telah diinisialisasi variable baru bernama ```filename_log``` untuk memanggil isi dari ```syslog.log```

```grep``` dengan parameter ```-E``` (extended) untuk mengidentidikasi baris yang mengandung string INFO dan ERROR , masing-masing hitungan disimpan dalam variable ```countinfo``` dan ```counterror```.

##### b. Pesan Error

Menggunakan regex untuk merekam pesan error dan menghitung jumlah pesan yang sama.

![sourcecode-bc](https://user-images.githubusercontent.com/55073331/113462792-dd877700-944c-11eb-9819-348ea88acc15.jpg)

```grep``` ERROR pada poin a kemudian menggunakan ```grep``` dengan parameter ```-P``` perl dan ```-o``` untuk output yang sesuai dengan ERROR. Baris ini merekam string dimulai setelah string ERROR sampai sebelum ada karakter ```(``` untuk merekam baris pesan error. Kemudian ```sort```untuk mengurutkan pesan error . kemudian ```uniq -c``` untuk menghitung berapa pesan error yang sama. Yang terakhir ```sort -nr``` untuk mengurutkan lagi sesuai dengan jumlah hitungan line yang sama dari yang terbesar.
##### c. Jumlah kemunculan log ERROR dan INFO setiap user

Menggunakan regex untuk mengidentifikasi line dengan string INFO dan ERROR
[screenshot ada pada poin b]

```grep``` INFO pada poin a kemudian ```grep``` dengan parameter ```-P``` perl dan ```-o``` untuk merekam string dari setelah karakter ```(``` sampai sebelum karakter ```)``` sebagai username (```Uname_input```) . kemudian diurutkan dan dihitung jumlah kemunculan username yang sama dengan ```sort | uniq```

##### d. Menyimpan informasi b ke dalam file error_message.csv

![sourcecode-d](https://user-images.githubusercontent.com/55073331/113462794-de200d80-944c-11eb-852e-3cd099dc44d7.jpg)

Membuat  ```filename_error``` untuk menyimpan ke file ```error_message.csv``` kemudian print ```Error, Count``` pada line pertama sebagai header dari file tersebut. Selanjutnya ```cut ‘  ‘``` untuk menukar angka jumlah pesan error ke belakang.

##### e. Menyimpan informasi c ke dalam user_statistic.csv
![sourcecode-e](https://user-images.githubusercontent.com/55073331/113462796-deb8a400-944c-11eb-9274-263b3c56c3db.jpg)


Setiap line pada informasi poin c di proses lagi dengan ```grep``` untuk mengidentifikasi dan ```wc -l``` untuk menghitung jumlah tiap line nya.

####Screenshot
![output](https://user-images.githubusercontent.com/55073331/113462801-e415ee80-944c-11eb-857f-41d22f30843d.jpg)



####Kendala
- Regex soosah
- Kalo arraynya masih kosong somehow gabisa di pass ke argumen trus jadinya bingung mau bikin fungsi
- Associative array ternyata gabisa ada spasi indexnya :(
- Kalo ngeprint key associative array trus diikutin sesuatu jadi kehapus sebagian :/ , setelah dicoba pakai compiler lain ternyata baru bisa. Untuk sebabnya, belum tahu

##Soal 2

####Solusi

##### A
- Set nilai awal max profit jadi 0
- Hitung percentage masing-masing row sesuai rumus yang dikasih
- Setiap kali ada yang percentagenya >= max profit, update jawaban

##### B
- Ubah formatting dari tabel jadi `nama-tanggal-bulan-tahun`
- Parsing tabel yang baru menggunakan awk
- Simpan di associative array agar elemen jadi unik

##### C
- Simpan variabel untuk counter masing-masing tipe
- Setiap kali looping, increment counter tipe yang didapat
- Print tipe dengan counter terkecil

##### D
- Bikin associative array untuk counter tipe
- Tiap looping increment isi array dengan jumlah profit
- Di akhir cari isi array paling minimal.

####Screenshot

####Kendala
- Strict banget formattingnya ._. Kalo kutip akhir awk sama nama file ga dipisah pake spasi jadi ga kebaca.

##Soal 3

####Solusi

##### A
- Pertama bikin folder sementara namanya 'kucing'
- Download gambar pakai command `wget`, simpan lognya di `tmp.log` dengan parameter -o, simpan gambarnya di folder tadi
- Ambil nama file dari log. Caranya pakai regex di log buat cari nama file aslinya. Polanya pasti diawali dengan angka trus ujungnya jpg
- Karna file yang terdownload namanya masih 'kitten', ganti namanya sama nama file aslinya pakai command `mv`. Ini sekalian ngehapus kalo ada file yang sama.
- Append isi tmp.log ke foto.log biar nyatu semua lognya.
- Setelah itu iterasi semua file di folder 'kucing' trus ubah namanya pakai command `mv`

##### B
###### Bash
- Simpan tanggal sesuai format dengan command `$(date +%d-%m-%Y)`
- Bikin foldernya pakai command `mkdir`
- Sisanya sama kayak soal a ._.

###### Crontab
- Cronnya `0 8 1/7,2/4 * *`
- `0 8` Biar tiap tepat jam 8 dieksekusi
- `1/7,2/4` Pakai `/` biar bisa loncat-loncat.

##### C
- Buat dapet tanggalnya pake command `date`
- Buat bedain kapan harus kucing kapan harus kelinci bisa manfaatin paritas dari tanggal. Misal : kalo genap kucing, kalo ganjil kelinci
- Sisanya sama kayak soal a ._. tinggal tambahin bagian kelinci

##### D
- Pakai command `find -d` + regex buat nyari folder yang mau di zip
- Pakai comman `zip -P` buat ngasih password

##### E
- Cron buat ngezipnya : `0 7 * * mon-fri` . Jalanin bash 3d setiap hari senin-jumat jam 7 pagi
- Cront buat unzip : `1 18 * * mon-fri`. Buat unzip setiap jam 6 sore lewat 1 menit

####Screenshot

####Kendala
- regex soosah
- awalnya mau make sed. Trus bingung caranya. Trus jadi sad :(
- trus nyadar bisa make grep. trus gajadi sad :D
- step di crontabnya ga bisa :(
