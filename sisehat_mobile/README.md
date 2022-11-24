# SiSehat _Mobile_

#### Anggota Kelompok:
1. Abby Marvel Immanuel Parasian Pribadi
2. Adly Renadi Raksanagara
3. Bryan Raihan 'Ilman
4. Nadya Hoesin
5. Rayhan Putra Randi

## Deskripsi Aplikasi dan Manfaatnya
Aplikasi **SiSehat** ini dibuat untuk membantu masyarakat menyimpan riwayat perawatannya yang bisa diakses oleh berbagai rumah sakit yang terafiliasi oleh aplikasi untuk memudahkan proses registrasi dan berbagai hal yang dapat menjadi penghambat pasien dalam mendapat perawatan. Kini, aplikasi SiSehat juga hadir dalam bentuk _mobile app_ untuk mengakomodasi masyarakat yang masih belum memiliki akses cepat ke komputer. Dengan adanya _mobile app_ ini, diharapkan penggunaan SiSehat dapat menjadi lebih efektif dan tersebar mengingat aksesibilitas _mobile app_ yang lebih terjangkau dibanding _web app_, sehingga seluruh kalangan masyarakat bisa dengan lebih mudah mengakses dan memanfaatkan aplikasi ini.

#### [Color Palette](https://coolors.co/palette/f0ead2-e7e8c4-dde5b6-c5d397-b9ca88-adc178-a98467-95755e-806755-6c584c)

## Daftar modul yang akan diimplementasikan
#### 0. Accounts
- Models: User (atribut: nomor_induk_kependudukan, nama_pengguna, adalah_pasien, adalah_dokter)<br>
Modul ini sebagai kerangka dari akun yang akan dibuat oleh pengguna untuk menggunakan aplikasi yang dimana terdapat 2 tipe pengguna, yaitu Dokter dan Pasien yang dibedakan restriksi serta autorisasinya, serta juga fitur-fitur yang tersedia.

#### 1. Halaman Utama (Adly)
- Models: Feedback (atribut: nama, pesan)<br>
Halaman utama ini menampilkan secara general deskripsi dari aplikasi SiSehat, dan juga terdapat tombol-tombol yang di route ke modul lainnya. Terdapat juga kolom feedback yang dapat diisi oleh pengguna, yang akan berguna untuk mengumpulkan masukan yang idenya dapat dimanfaatkan untuk mengembangkan lebih lanjut aplikasi SiSehat.

#### 2. Registrasi (Abby)
- Models: Pasien (atribut: user), Dokter (atribut: user, nama_rumah_sakit)<br>
Modul Registrasi akan digunakan untuk autorisasi dan autentikasi 2 tipe user yang ada agar pengguna dapat mengakses fitur-fitur dan halaman yang sesuai dengan jenis usernya.

#### 3. Pasien (Bryan)
- Models: Keluhan (atribut: pasien, dokter, tanggal, tema, deskripsi), Penyakit, Obat, Pasien, Dokter <br>
Modul Pasien merupakan sebuah fitur yang diimplementasikan bagi user tipe Pasien agar pengguna dapat mengisi form keluhan yang dapat disampaikan ke user Dokter.

#### 4. Dokter (Randi)
- Models: Penyakit (atribut: pasien (FK), dokter (FK), tanggal, nama_penyakit, deskripsi), Obat, Pasien, Dokter <br>
Modul Dokter merupakan sebuah fitur yang diimplementasikan bagi user tipe Dokter agar Dokter dapat mendiagnosa secara umum berdasarkan keluhan yang telah disampaikan oleh user Pasien.

#### 5. Obat (Nadya)
- Models:  Obat (atribut: pasien (FK), dokter (FK), tanggal, nama_obat, deskripsi), Pasien, Dokter <br>
Modul Obat merupakan sebuah fitur yang diimplementasikan bagi user tipe Dokter dan Pasien, dimana user Dokter dapat memberikan rekomendasi obat untuk menangani keluhan dan diagnosa yang telah dilakukan, dan daftar rekomendasi obat tersebut lalu dapat dilihat oleh Pasien.
