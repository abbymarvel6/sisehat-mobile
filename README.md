# SiSehat _Mobile_

#### Anggota Kelompok (A06):
1. Abby Marvel Immanuel Parasian Pribadi (<NPM>)
2. Adly Renadi Raksanagara (<NPM>)
3. Bryan Raihan 'Ilman (<NPM>)
4. Nadya Hoesin (<NPM>)
5. Rayhan Putra Randi (2106705644)

## Latar Belakang
Aplikasi **SiSehat** ini dibuat untuk membantu masyarakat menyimpan riwayat perawatannya yang bisa diakses oleh berbagai rumah sakit yang terafiliasi oleh aplikasi untuk memudahkan proses registrasi dan berbagai hal yang dapat menjadi penghambat pasien dalam mendapat perawatan. Kini, aplikasi SiSehat juga hadir dalam bentuk _mobile app_ untuk mengakomodasi masyarakat yang masih belum memiliki akses cepat ke komputer. Dengan adanya _mobile app_ ini, diharapkan penggunaan SiSehat dapat menjadi lebih efektif dan tersebar mengingat aksesibilitas _mobile app_ yang lebih terjangkau dibanding _web app_, sehingga seluruh kalangan masyarakat bisa dengan lebih mudah mengakses dan memanfaatkan aplikasi ini.

## Daftar Modul
#### 0. Accounts
- Models: User (atribut: nomor_induk_kependudukan, nama_pengguna, adalah_pasien, adalah_dokter)<br>
Modul ini sebagai kerangka dari akun yang akan dibuat oleh pengguna untuk menggunakan aplikasi yang dimana terdapat 2 tipe pengguna, yaitu Dokter dan Pasien yang dibedakan restriksi serta autorisasinya, serta juga fitur-fitur yang tersedia.

#### 1. Halaman Utama - [Adly](https://github.com/adlyrndi)
- Models: Feedback (atribut: nama, pesan)<br>
Halaman utama ini menampilkan secara general deskripsi dari aplikasi SiSehat, dan juga terdapat tombol-tombol yang di route ke modul lainnya. Terdapat juga kolom feedback yang dapat diisi oleh pengguna, yang akan berguna untuk mengumpulkan masukan yang idenya dapat dimanfaatkan untuk mengembangkan lebih lanjut aplikasi SiSehat.

#### 2. Registrasi & Forum - [Abby](https://github.com/abbymarvel6)
- Models: Pasien (atribut: user), Dokter (atribut: user, nama_rumah_sakit)<br>
Modul Registrasi akan digunakan untuk autorisasi dan autentikasi 2 tipe user yang ada agar pengguna dapat mengakses fitur-fitur dan halaman yang sesuai dengan jenis usernya.

#### 3. Pasien - [Bryan](https://github.com/bryan-ilman)
- Models: Keluhan (atribut: pasien, dokter, tanggal, tema, deskripsi), Penyakit, Obat, Pasien, Dokter <br>
Modul Pasien merupakan sebuah fitur yang diimplementasikan bagi user tipe Pasien agar pengguna dapat mengisi form keluhan yang dapat disampaikan ke user Dokter.

#### 4. Dokter - [Randi](https://github.com/rayhanrandi)
Modul Dokter merupakan sebuah fitur yang diimplementasikan bagi user tipe Dokter agar Dokter dapat mendiagnosa secara umum berdasarkan keluhan yang telah disampaikan oleh user Pasien. Alur penggunaannya dilakukan dengan pertama login atau membuat akun dengan tipe user Dokter terlebih dahulu menggunakan `request.login`, lalu melihat dari pasien-pasien yang terdaftar, apakah terdapat keluhan yang dapat di diagnosa lebih lanjut oleh pengguna. Jika ada, maka setelah diagnosa user Dokter dapat membuat sebuah objek penyakit dengen `POST` yang di-assign ke pasien dengan keluhan tersebut yang dilengkapi dengan pesan dari user Dokter terkait penyakit yang dimiliki Pasien. Penyakit-penyakit yang dimiliki pasien juga akan ditampilkan pada halaman utama modul ini menggunakan `GET`. Terdapat juga routing yang dapat mengarahkan pengguna ke halaman utama jika ingin tahu lebih lanjut mengenai aplikasi serta juga keluar dari akun dengan routing ke view logout untuk keluar dari akun.

#### 5. Obat - [Nadya](https://github.com/nadyahoesin)
- Models:  Obat (atribut: pasien (FK), dokter (FK), tanggal, nama_obat, deskripsi), Pasien, Dokter <br>
Modul Obat merupakan sebuah fitur yang diimplementasikan bagi user tipe Dokter dan Pasien, dimana user Dokter dapat memberikan rekomendasi obat untuk menangani keluhan dan diagnosa yang telah dilakukan, dan daftar rekomendasi obat tersebut lalu dapat dilihat oleh Pasien.

## Tipe User
### 1. Non-Login
Bagi pengguna yang tidak memiliki akun atau belum melakukan login, maka pengguna hanya akan terbatas dalam halaman utama aplikasi saja tanpa bisa mengakses fitur-fitur lain yang disediakan.

### 2. Logged-in
- **Pasien**<br>
Tipe pengguna Pasien dapat menambahkan objek Keluhan yang berisikan apa keluhan yang dirasakan sekarang serta deskripsinya yang lebih jelas agar tipe pengguna Dokter dapat melakukan diagnosa dan menentukan penyakit yang mungkin dimiliki Pasien. Kedua hal tersebut diimplementasikan menggunakan `POST` dan `GET` yang disambungkan ke views Django web-app yang telah dibuat.
- **Dokter**<br>
Tipe pengguna Dokter dapat menambahkan objek Penyakit yang akan di-assign ke Pasien tertentu sesuai dari diagnosa pengguna Dokter terkait Keluhan yang telah dibuat oleh pengguna tipe Pasien. Selain itu, user Dokter juga dapat menyetel status dari Penyakit seorang Pasien untuk menentukan apakah Pasien sudah sembuh atau belum. Kedua hal tersebut juga diimplementasikan menggunakan `POST` dan `GET` yang disambungkan ke views Django web-app yang telah dibuat.

## Pengintegrasian dengan Web Server
1. Mengimplementasikan library `http` serta `pbp_django_auth` untuk menghandle `GET`, `POST`, serta login dan logout untuk aplikasi.
2. Membuat model sesuai dengan respons dari data yang berasal dari layanan web menggunakan Quicktype, lalu mengkonversi data JSON yang didapat menjadi bentuk yang dapat diolah dan disimpan dalam sebuah List untuk implementasi pengambilan data asinkronus.
3. Melakukan pemanggilan `POST` untuk menambahkan data dalam database web-app dengan menyimpan data dalam Map, baru memanggil `POST`.
5. Menampilkan data yang telah berhasil dikonversi ke aplikasi dengan FutureBuilder secara asinkronus




###### PROYEK AKHIR SEMESTER | A06
