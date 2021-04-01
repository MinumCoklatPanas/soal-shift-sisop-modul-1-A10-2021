# lapres-sisop-modul-1-A10-2021

##Soal 1

####Solusi

####Screenshot

####Kendala
- Regex soosah
- Kalo arraynya masih kosong somehow gabisa di pass ke argumen trus jadinya bingung mau bikin fungsi
- Associative array ternyata gabisa ada spasi indexnya :(
- Kalo ngeprint key associative array trus diikutin sesuatu jadi kehapus sebagian :/ (ini masi belum keresolve)

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