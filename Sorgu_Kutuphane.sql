CREATE DATABASE DBKutuphane
go
use  DBKutuphane

CREATE TABLE ADRESLER ( -- +
    ADRES_NO INT IDENTITY(1,1),
    CADDE VARCHAR(20),
    MAHALLE VARCHAR(20),
    BINA_NO VARCHAR(10),
    SEHIR VARCHAR(20),
    POSTA_KODU INT,
    ULKE VARCHAR(20),
    PRIMARY KEY (ADRES_NO)
);

CREATE TABLE KUTUPHANE ( -- +
    KUTUPHANE_NO INT IDENTITY(1,1),
    KUTUPHANE_ISMI VARCHAR(20),
    ACIKLAMA VARCHAR(20),
    ADRES_NO INT,
    PRIMARY KEY (KUTUPHANE_NO),
    FOREIGN KEY (ADRES_NO) REFERENCES ADRESLER (ADRES_NO)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE UYELER ( --- ++++
    UYE_NO INT IDENTITY(1,1),
    UYE_ADI VARCHAR(20),
    UYE_SOYADI VARCHAR(20),
    CINSIYET VARCHAR(5),
    TELEFON VARCHAR(15),
    E_POSTA VARCHAR(40),
    ADRES_NO INT,
    PRIMARY KEY (UYE_NO),
    FOREIGN KEY (ADRES_NO) REFERENCES ADRESLER (ADRES_NO)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


CREATE TABLE KITAPLAR ( ---- +
    ISBN VARCHAR(20),
    KITAP_ADI VARCHAR(20),
    YAYIN_TARIHI VARCHAR(20),
    S_SAYISI INT,
    PRIMARY KEY (ISBN)
);


CREATE TABLE KATEGORILER ( --------- +
    KATEGORI_NO INT IDENTITY(1,1),
    KATEGORI_ADI VARCHAR(20),
    PRIMARY KEY (KATEGORI_NO)
);

CREATE TABLE YAZARLAR ( ----- +
    YAZAR_NO INT IDENTITY(1,1),
    YAZAR_ADI VARCHAR(20),
    YAZAR_SOYADI VARCHAR(20),
    PRIMARY KEY (YAZAR_NO)
);

CREATE TABLE KITAP_KATEGORI ( ---- + 
    ISBN VARCHAR(20) NOT NULL,
    KATEGORI_NO INT NOT NULL,
    PRIMARY KEY (ISBN, KATEGORI_NO),
    FOREIGN KEY (ISBN) REFERENCES KITAPLAR (ISBN)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (KATEGORI_NO) REFERENCES KATEGORILER (KATEGORI_NO)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



CREATE TABLE KITAP_YAZAR ( ------- +
    ISBN VARCHAR(20) NOT NULL,
    YAZAR_NO INT NOT NULL,
    PRIMARY KEY (ISBN, YAZAR_NO),
    FOREIGN KEY (ISBN) REFERENCES KITAPLAR (ISBN)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (YAZAR_NO) REFERENCES YAZARLAR (YAZAR_NO)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE KITAP_KUTUPHANE ( ------------+
    KUTUPHANE_NO INT NOT NULL,
    ISBN VARCHAR(20) NOT NULL,
    MIKTAR INT,
    PRIMARY KEY (KUTUPHANE_NO, ISBN),
    FOREIGN KEY (KUTUPHANE_NO) REFERENCES KUTUPHANE (KUTUPHANE_NO)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES KITAPLAR (ISBN)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE EMANET (
    EMANET_NO INT IDENTITY(1,1),
    ISBN VARCHAR(20) NOT NULL,
    UYE_NO INT NOT NULL,
    KUTUPHANE_NO INT NOT NULL,
    EMANET_TARIHI DATETIME,
    TESLIM_TARIHI DATETIME,
    PRIMARY KEY (EMANET_NO),
    FOREIGN KEY (ISBN) REFERENCES KITAPLAR (ISBN),
    FOREIGN KEY (UYE_NO) REFERENCES UYELER (UYE_NO),
    FOREIGN KEY (KUTUPHANE_NO) REFERENCES KUTUPHANE (KUTUPHANE_NO)
);

-- deðer girme


INSERT INTO ADRESLER (CADDE, MAHALLE, BINA_NO, SEHIR, POSTA_KODU, ULKE)
VALUES 
('Barýþ Caddesi', 'Çiçek Mahallesi', '10A', 'Ankara', 06520, 'Türkiye'),
('Gül Sokak', 'Deniz Mahallesi', '22B', 'Ýstanbul', 34000, 'Türkiye'),
('Atatürk Bulvarý', 'Yýldýz Mahallesi', '5', 'Ýzmir', 35250, 'Türkiye'),
('Kýrlangýç Caddesi', 'Orman Mahallesi', '35C', 'Bursa', 16010, 'Türkiye'),
('Lale Sokak', 'Papatya Mahallesi', '17D', 'Antalya', 07040, 'Türkiye'),
('Sahil Caddesi', 'Merkez Mahallesi', '12A', 'Mersin', 33010, 'Türkiye'),
('Çamlýk Yolu', 'Çam Mahallesi', '8B', 'Trabzon', 61000, 'Türkiye'),
('Demokrasi Caddesi', 'Yeni Mahalle', '20C', 'Adana', 01010, 'Türkiye'),
('Hürriyet Bulvarý', 'Özgürlük Mahallesi', '25D', 'Gaziantep', 27010, 'Türkiye'),
('Gazi Sokak', 'Kurtuluþ Mahallesi', '18A', 'Samsun', 55040, 'Türkiye'),
('Deniz Caddesi', 'Karadeniz Mahallesi', '9', 'Ordu', 52000, 'Türkiye'),
('Bahar Sokak', 'Yeþil Mahallesi', '14B', 'Kocaeli', 41050, 'Türkiye'),
('Mavi Caddesi', 'Ýstiklal Mahallesi', '19A', 'Eskiþehir', 26010, 'Türkiye'),
('Serin Sokak', 'Yayla Mahallesi', '23B', 'Kayseri', 38000, 'Türkiye'),
('Fidan Yolu', 'Meþe Mahallesi', '27D', 'Konya', 42020, 'Türkiye'),
('Selvi Sokak', 'Çýnar Mahallesi', '3A', 'Malatya', 44000, 'Türkiye'),
('Köy Yolu', 'Yayla Mahallesi', '5C', 'Þanlýurfa', 63050, 'Türkiye'),
('Esen Sokak', 'Güneþ Mahallesi', '7D', 'Erzurum', 25040, 'Türkiye'),
('Altýn Caddesi', 'Sarý Mahallesi', '11B', 'Van', 65000, 'Türkiye'),
('Vadi Sokak', 'Dere Mahallesi', '2A', 'Denizli', 20010, 'Türkiye');

INSERT INTO ADRESLER (CADDE, MAHALLE, BINA_NO, SEHIR, POSTA_KODU, ULKE)
VALUES 
('Baraj Caddesi', 'Sahil Mahallesi', '30D', 'Antalya', 07050, 'Türkiye'),
('Yeþil Sokak', 'Bahar Mahallesi', '44C', 'Muðla', 48000, 'Türkiye'),
('Kumluk Yolu', 'Kumsal Mahallesi', '8A', 'Balýkesir', 10040, 'Türkiye'),
('Çiçekli Bulvar', 'Gül Mahallesi', '16D', 'Aydýn', 09020, 'Türkiye'),
('Iþýk Caddesi', 'Parlak Mahallesi', '13B', 'Kýrþehir', 40010, 'Türkiye'),
('Çamlý Bulvar', 'Aðaç Mahallesi', '22A', 'Nevþehir', 50020, 'Türkiye'),
('Gökkuþaðý Sokak', 'Gök Mahallesi', '3C', 'Niðde', 51010, 'Türkiye'),
('Dere Yolu', 'Su Mahallesi', '45D', 'Kars', 36050, 'Türkiye'),
('Bahar Yolu', 'Serin Mahallesi', '9B', 'Artvin', 08020, 'Türkiye'),
('Rüzgar Caddesi', 'Hava Mahallesi', '12A', 'Edirne', 22010, 'Türkiye'),
('Taþ Sokak', 'Kaya Mahallesi', '19D', 'Tekirdað', 59030, 'Türkiye'),
('Deniz Yolu', 'Mavi Mahallesi', '15B', 'Sinop', 57020, 'Türkiye'),
('Ayýþýðý Caddesi', 'Geceler Mahallesi', '23C', 'Isparta', 32010, 'Türkiye'),
('Kar Yolu', 'Buz Mahallesi', '7D', 'Kars', 36020, 'Türkiye'),
('Kýþ Sokak', 'Soðuk Mahallesi', '9A', 'Ardahan', 75000, 'Türkiye'),
('Dere Bulvarý', 'Su Mahallesi', '14C', 'Tunceli', 62000, 'Türkiye'),
('Yaz Sokak', 'Güneþ Mahallesi', '20D', 'Amasya', 05010, 'Türkiye'),
('Umut Caddesi', 'Hayal Mahallesi', '13A', 'Bartýn', 74010, 'Türkiye'),
('Köþk Sokak', 'Saray Mahallesi', '21B', 'Bolu', 14000, 'Türkiye'),
('Zeytin Yolu', 'Zeytinlik Mahallesi', '11A', 'Hatay', 31010, 'Türkiye'),
('Arý Sokak', 'Bal Mahallesi', '8C', 'Mardin', 47010, 'Türkiye'),
('Güneþ Caddesi', 'Parlak Mahallesi', '7A', 'Hakkari', 30010, 'Türkiye'),
('Altýn Yolu', 'Zengin Mahallesi', '9B', 'Batman', 72010, 'Türkiye'),
('Okyanus Caddesi', 'Deniz Mahallesi', '5D', 'Kýrklareli', 39020, 'Türkiye'),
('Ay Caddesi', 'Yýldýz Mahallesi', '11C', 'Afyonkarahisar', 03020, 'Türkiye'),
('Serin Bulvar', 'Esinti Mahallesi', '8A', 'Çanakkale', 17010, 'Türkiye'),
('Buz Sokak', 'Kar Mahallesi', '4B', 'Kastamonu', 37020, 'Türkiye'),
('Neþeli Caddesi', 'Gülen Mahallesi', '6D', 'Bilecik', 11010, 'Türkiye'),
('Kelebek Sokak', 'Uçan Mahallesi', '13A', 'Gümüþhane', 29010, 'Türkiye');

select * from ADRESLER


truncate table ADRESLER

------ adresler tablosuna 49 tane deðer girildi


--------------------------------------------------,

--Kitaplar tablosuna deðer giriþi açýldý.

select * from KITAPLAR

INSERT INTO KITAPLAR (ISBN, KITAP_ADI, YAYIN_TARIHI, S_SAYISI)
VALUES
('978-3-16-148410-1', 'Bir Gün', '2010-07-15', 368),
('978-1-86197-876-8', 'Körlük', '1995-05-15', 312),
('978-0-7432-7356-6', 'Hayvan Çiftliði', '1945-08-17', 112),
('978-0-316-76948-9', 'Bülbülü Öldürmek', '1960-07-11', 281),
('978-0-553-21311-8', '1984', '1949-06-08', 328),
('978-0-452-28423-5', 'Fahrenheit 451', '1953-10-19', 194),
('978-0-140-11825-7', 'Dönüþüm', '1915-01-01', 96),
('978-0-06-112008-5', 'Yüzyýllýk Yalnýzlýk', '1967-05-30', 417),
('978-0-7434-9731-0', 'Savaþ ve Barýþ', '1869-01-01', 1225),
('978-0-14-118280-4', 'Suç ve Ceza', '1866-01-01', 671),
('978-0-375-71344-9', 'Anna Karenina', '1878-01-01', 964),
('978-0-14-044926-7', 'Ýlyada', '800 BC', 704),
('978-0-19-953557-0', 'Odysseia', '800 BC', 560),
('978-0-7434-9726-6', 'Uðultulu Tepeler', '1847-12-01', 352),
('978-0-19-953558-1', 'Jane Eyre', '1847-10-16', 500),
('978-1-5011-3474-7', 'Küçük Kadýnlar', '1868-01-01', 759),
('978-0-19-953559-2', 'Don Kiþot', '1615-01-16', 1072),
('978-0-7432-7356-7', 'Beyaz Zambaklar Ülkesinde', '1923-01-01', 228),
('978-0-14-118529-4', 'Martin Eden', '1909-01-01', 464),
('978-0-06-073401-6', 'Denizler Altýnda 20.000 Fersah', '1870-06-20', 420),
('978-1-250-16152-8', 'Dünyanýn Merkezine Yolculuk', '1864-01-01', 183),
('978-0-316-76948-0', 'Robinson Crusoe', '1719-04-25', 320),
('978-0-452-28423-6', 'Sherlock Holmes: Kýzýl Dosya', '1887-11-01', 108),
('978-0-7432-7356-8', 'Dracula', '1897-05-26', 418),
('978-0-553-21311-9', 'Frankenstein', '1818-01-01', 280),
('978-0-452-28423-7', 'Kuyruklu Yýldýz Altýnda Bir Ýzdivaç', '1912-03-01', 156),
('978-0-06-112008-6', 'Çalýkuþu', '1922-01-01', 411),
('978-0-375-71344-0', 'Kuyucaklý Yusuf', '1937-01-01', 200),
('978-0-14-118529-5', 'Yaban', '1932-01-01', 285),
('978-0-7434-9726-7', 'Sineklerin Tanrýsý', '1954-09-17', 224),
('978-1-5011-3474-8', 'Satranç', '1943-01-01', 80),
('978-1-86197-876-7', 'Kürk Mantolu Madonna', '1943-01-01', 160),
('978-0-452-28423-8', 'Eylül', '1900-01-01', 200),
('978-0-7432-7356-9', 'Aþk-ý Memnu', '1899-01-01', 288),
('978-0-553-21312-0', 'Tehlikeli Oyunlar', '1973-01-01', 416),
('978-0-7432-7357-0', 'Ýnce Memed', '1955-01-01', 452),
('978-0-375-71344-1', 'Serenad', '2011-01-01', 481),
('978-0-452-28423-9', 'Beyaz Kale', '1985-01-01', 200),
('978-0-7434-9726-8', 'Kafamda Bir Tuhaflýk', '2014-01-01', 480),
('978-0-14-118529-6', 'Masumiyet Müzesi', '2008-01-01', 592),
('978-1-250-16152-9', 'Çocuk Kalbi', '1886-01-01', 288),
('978-0-7434-9726-9', 'Ölü Canlar', '1842-01-01', 456),
('978-0-06-073401-7', 'Yeraltýndan Notlar', '1864-01-01', 128),
('978-0-14-118529-7', 'Babalar ve Oðullar', '1862-01-01', 244),
('978-1-86197-877-0', 'Karamazov Kardeþler', '1880-01-01', 824),
('978-0-7432-7357-1', 'Budala', '1869-01-01', 768),
('978-1-250-16153-0', 'Ecinniler', '1872-01-01', 768);


select ISBN,KITAP_ADI from KITAPLAR -- 47 tane kitap bulunmaktadýr.
select ISBN from KITAPLAR 

-----Kitaplar bölümüne giirþ yapýldý.

--------- Þimdi ise karegoriler giriþ yapýalcak.

INSERT INTO KATEGORILER (KATEGORI_ADI)
VALUES
('Roman'),
('Bilim Kurgu'),
('Fantastik'),
('Tarih'),
('Biyografi'),
('Çocuk'),
('Klasik'),
('Polisiye'),
('Psikoloji'),
('Felsefe'),
('Sanat'),
('Edebiyat'),
('Bilim'),
('Din'),
('Siyaset'),
('Ekonomi'),
('Kiþisel Geliþim'),
('Mizah'),
('Gezi'),
('Saðlýk');

select * from KATEGORILER

-- 20 tane kategori giriþi yapýldý.


--------
------- yazarlar kategorisineyazar ve isimleri eklendi.

INSERT INTO YAZARLAR (YAZAR_ADI, YAZAR_SOYADI)
VALUES
-- Verilen Kitaplarýn Yazarlarý
('David', 'Nicholls'), -- Bir Gün
('Jose', 'Saramago'), -- Körlük
('George', 'Orwell'), -- Hayvan Çiftliði
('Harper', 'Lee'), -- Bülbülü Öldürmek
('George', 'Orwell'), -- 1984
('Ray', 'Bradbury'), -- Fahrenheit 451
('Franz', 'Kafka'), -- Dönüþüm
('Gabriel Garcia', 'Marquez'), -- Yüzyýllýk Yalnýzlýk
('Leo', 'Tolstoy'), -- Savaþ ve Barýþ
('Fyodor', 'Dostoyevsky'), -- Suç ve Ceza
('Leo', 'Tolstoy'), -- Anna Karenina
('Homer', ''), -- Ýlyada
('Homer', ''), -- Odysseia
('Emily', 'Bronte'), -- Uðultulu Tepeler
('Charlotte', 'Bronte'), -- Jane Eyre
('Louisa May', 'Alcott'), -- Küçük Kadýnlar
('Miguel', 'de Cervantes'), -- Don Kiþot
('Grigory', 'Petrov'), -- Beyaz Zambaklar Ülkesinde
('Jack', 'London'), -- Martin Eden
('Jules', 'Verne'), -- Denizler Altýnda 20.000 Fersah
('Jules', 'Verne'), -- Dünyanýn Merkezine Yolculuk
('Daniel', 'Defoe'), -- Robinson Crusoe
('Arthur Conan', 'Doyle'), -- Sherlock Holmes: Kýzýl Dosya
('Bram', 'Stoker'), -- Dracula
('Mary', 'Shelley'), -- Frankenstein
('Halide Edib', 'Adývar'), -- Çalýkuþu
('Sabahattin', 'Ali'), -- Kürk Mantolu Madonna
('Ahmet Hamdi', 'Tanpýnar'), -- Huzur
('Orhan', 'Pamuk'), -- Masumiyet Müzesi

-- Eklenen 10 Yeni Yazar
('Ernest', 'Hemingway'),
('Virginia', 'Woolf'),
('Hermann', 'Hesse'),
('Stefan', 'Zweig'),
('Albert', 'Camus'),
('Mark', 'Twain'),
('Victor', 'Hugo'),
('Charles', 'Dickens'),
('Jane', 'Austen'),
('J.R.R.', 'Tolkien');

select * from YAZARLAR

-- 39 tane yazar eklendi.
-------- Kitap_kategori kýsmýna kitapalrýn kategorilerini ekleyeceðiz ve  veri giriþi yapalým.

INSERT INTO KITAP_KATEGORI (ISBN, KATEGORI_NO)
VALUES
('978-3-16-148410-1', 1), -- Bir Gün (Roman)
('978-1-86197-876-8', 1), -- Körlük (Roman)
('978-0-7432-7356-6', 1), -- Hayvan Çiftliði (Roman)
('978-0-316-76948-9', 1), -- Bülbülü Öldürmek (Roman)
('978-0-553-21311-8', 1), -- 1984 (Roman)
('978-0-452-28423-5', 2), -- Fahrenheit 451 (Bilim Kurgu)
('978-0-140-11825-7', 2), -- Dönüþüm (Bilim Kurgu)
('978-0-06-112008-5', 1), -- Yüzyýllýk Yalnýzlýk (Roman)
('978-0-7434-9731-0', 7), -- Savaþ ve Barýþ (Klasik)
('978-0-14-118280-4', 7), -- Suç ve Ceza (Klasik)
('978-0-375-71344-9', 7), -- Anna Karenina (Klasik)
('978-0-14-044926-7', 7), -- Ýlyada (Klasik)
('978-0-19-953557-0', 7), -- Odysseia (Klasik)
('978-0-7434-9726-6', 7), -- Uðultulu Tepeler (Klasik)
('978-0-19-953558-1', 7), -- Jane Eyre (Klasik)
('978-1-5011-3474-7', 6), -- Küçük Kadýnlar (Çocuk)
('978-0-19-953559-2', 7), -- Don Kiþot (Klasik)
('978-0-7432-7356-7', 4), -- Beyaz Zambaklar Ülkesinde (Tarih)
('978-0-14-118529-4', 1), -- Martin Eden (Roman)
('978-0-06-073401-6', 2), -- Denizler Altýnda 20.000 Fersah (Bilim Kurgu)
('978-1-250-16152-8', 2), -- Dünyanýn Merkezine Yolculuk (Bilim Kurgu)
('978-0-316-76948-0', 7), -- Robinson Crusoe (Klasik)
('978-0-452-28423-6', 8), -- Sherlock Holmes: Kýzýl Dosya (Polisiye)
('978-0-7432-7356-8', 8), -- Dracula (Polisiye)
('978-0-553-21311-9', 8), -- Frankenstein (Polisiye)
('978-0-452-28423-7', 6), -- Kuyruklu Yýldýz Altýnda Bir Ýzdivaç (Çocuk)
('978-0-06-112008-6', 1), -- Çalýkuþu (Roman)
('978-0-375-71344-0', 1), -- Kuyucaklý Yusuf (Roman)
('978-0-14-118529-5', 1), -- Yaban (Roman)
('978-0-7434-9726-7', 6), -- Sineklerin Tanrýsý (Çocuk)
('978-1-5011-3474-8', 10), -- Satranç (Felsefe)
('978-1-86197-876-7', 5), -- Kürk Mantolu Madonna (Biyografi)
('978-0-452-28423-8', 10), -- Eylül (Felsefe)
('978-0-7432-7356-9', 10), -- Aþk-ý Memnu (Felsefe)
('978-0-553-21312-0', 10), -- Tehlikeli Oyunlar (Felsefe)
('978-0-7432-7357-0', 1), -- Ýnce Memed (Roman)
('978-0-375-71344-1', 1), -- Serenad (Roman)
('978-0-452-28423-9', 1), -- Beyaz Kale (Roman)
('978-0-7434-9726-8', 1), -- Kafamda Bir Tuhaflýk (Roman)
('978-0-14-118529-6', 1), -- Masumiyet Müzesi (Roman)
('978-1-250-16152-9', 6), -- Çocuk Kalbi (Çocuk)
('978-0-7434-9726-9', 7), -- Ölü Canlar (Klasik)
('978-0-06-073401-7', 10), -- Yeraltýndan Notlar (Felsefe)
('978-0-14-118529-7', 1), -- Babalar ve Oðullar (Roman)
('978-1-86197-877-0', 7), -- Karamazov Kardeþler (Klasik)
('978-0-7432-7357-1', 7), -- Budala (Klasik)
('978-1-250-16153-0', 7); -- Ecinniler (Klasik)

select COUNT(*) from KITAP_KATEGORI --- buradaki kitaplar karegorisinde ISBN olan her eþþiz deðer dýþýnda girilirse komut kabul etmez.

------ Kitap kategorisine eklendi.

-----Þimdi ise Kitap yazar tablosuna veri ekleme yapalým.

INSERT INTO KITAP_YAZAR (ISBN, YAZAR_NO)
VALUES
('978-0-06-073401-6', 20), -- Denizler Altýnda 20.000 Fersah - Jules Verne
('978-0-06-073401-7', 10), -- Yeraltýndan Notlar - Fyodor Dostoyevsky
('978-0-06-112008-5', 8), -- Yüzyýllýk Yalnýzlýk - Gabriel Garcia Marquez
('978-0-06-112008-6', 26), -- Çalýkuþu - Halide Edib Adývar
('978-0-140-11825-7', 7), -- Dönüþüm - Franz Kafka
('978-0-14-044926-7', 12), -- Ýlyada - Homer
('978-0-14-118280-4', 10), -- Suç ve Ceza - Fyodor Dostoyevsky
('978-0-14-118529-4', 19), -- Martin Eden - Jack London
('978-0-14-118529-5', 27), -- Yaban - Sabahattin Ali
('978-0-14-118529-6', 29), -- Masumiyet Müzesi - Orhan Pamuk
('978-0-14-118529-7', 10), -- Babalar ve Oðullar - Fyodor Dostoyevsky
('978-0-19-953557-0', 13), -- Odysseia - Homer
('978-0-19-953558-1', 15), -- Jane Eyre - Charlotte Bronte
('978-0-19-953559-2', 17), -- Don Kiþot - Miguel de Cervantes
('978-0-316-76948-0', 22), -- Robinson Crusoe - Daniel Defoe
('978-0-316-76948-9', 4), -- Bülbülü Öldürmek - Harper Lee
('978-0-375-71344-0', 27), -- Kuyucaklý Yusuf - Sabahattin Ali
('978-0-375-71344-1', 29), -- Serenad - Orhan Pamuk
('978-0-375-71344-9', 9), -- Anna Karenina - Leo Tolstoy
('978-0-452-28423-5', 6), -- Fahrenheit 451 - Ray Bradbury
('978-0-452-28423-6', 23), -- Sherlock Holmes: Kýzýl Dosya - Arthur Conan Doyle
('978-0-452-28423-7', 28), -- Kuyruklu Yýldýz Altýnda Bir Ýzdivaç - Ahmet Hamdi Tanpýnar
('978-0-452-28423-8', 28), -- Eylül - Ahmet Hamdi Tanpýnar
('978-0-452-28423-9', 29), -- Beyaz Kale - Orhan Pamuk
('978-0-553-21311-8', 3), -- 1984 - George Orwell
('978-0-553-21311-9', 25), -- Frankenstein - Mary Shelley
('978-0-553-21312-0', 27), -- Tehlikeli Oyunlar - Sabahattin Ali
('978-0-7432-7356-6', 3), -- Hayvan Çiftliði - George Orwell
('978-0-7432-7356-7', 18), -- Beyaz Zambaklar Ülkesinde - Grigory Petrov
('978-0-7432-7356-8', 24), -- Dracula - Bram Stoker
('978-0-7432-7356-9', 27), -- Aþk-ý Memnu - Sabahattin Ali
('978-0-7432-7357-0', 27), -- Ýnce Memed - Sabahattin Ali
('978-0-7432-7357-1', 10), -- Budala - Fyodor Dostoyevsky
('978-0-7434-9726-6', 14), -- Uðultulu Tepeler - Emily Bronte
('978-0-7434-9726-7', 22), -- Sineklerin Tanrýsý - William Golding
('978-0-7434-9726-8', 29), -- Kafamda Bir Tuhaflýk - Orhan Pamuk
('978-0-7434-9726-9', 9), -- Ölü Canlar - Nikolai Gogol
('978-0-7434-9731-0', 9), -- Savaþ ve Barýþ - Leo Tolstoy
('978-1-250-16152-8', 20), -- Dünyanýn Merkezine Yolculuk - Jules Verne
('978-1-250-16152-9', 34), -- Çocuk Kalbi - Edmondo De Amicis
('978-1-250-16153-0', 10), -- Ecinniler - Fyodor Dostoyevsky
('978-1-5011-3474-7', 16), -- Küçük Kadýnlar - Louisa May Alcott
('978-1-5011-3474-8', 33), -- Satranç - Stefan Zweig
('978-1-86197-876-7', 27), -- Kürk Mantolu Madonna - Sabahattin Ali
('978-1-86197-876-8', 2), -- Körlük - Jose Saramago
('978-1-86197-877-0', 10), -- Karamazov Kardeþler - Fyodor Dostoyevsky
('978-3-16-148410-1', 1); -- Bir Gün - David Nicholls


select COUNT(*) from KITAP_YAZAR -- 47 kitaba yazar eklenmiþtir.
----KÝTAP_YAZAR tablosuna deðer eklenmiþtir.


------KÜTÜPHANE tablosuna deðer eklenmiþtir.

INSERT INTO KUTUPHANE (KUTUPHANE_ISMI, ACIKLAMA, ADRES_NO)
VALUES
('Merkez Kütüphane', 'Ana Þube', 1),
('Çiçek Kütüphanesi', 'Gençlik Þubesi', 3),
('Deniz Kütüphanesi', 'Sahil Þubesi', 6),
('Çamlýk Kütüphanesi', 'Doða Þubesi', 7),
('Gökkuþaðý Kütüphanesi', 'Renkli Kitaplar', 27),
('Iþýk Kütüphanesi', 'Edebiyat Aðýrlýklý', 25),
('Altýn Kütüphanesi', 'Tarih Þubesi', 19),
('Selvi Kütüphanesi', 'Çocuk Kitaplarý', 16),
('Bahar Kütüphanesi', 'Popüler Kitaplar', 12),
('Serin Kütüphanesi', 'Sessiz Ortam', 46),
('Yaz Kütüphanesi', 'Açýk Alan', 37),
('Arý Kütüphanesi', 'Bilimsel Çalýþmalar', 41),
('Güneþ Kütüphanesi', 'Yeni Çýkanlar', 42),
('Kelebek Kütüphanesi', 'Sanat Koleksiyonu', 49),
('Mavi Kütüphanesi', 'Denizle Bütünleþmiþ', 13),
('Hürriyet Kütüphanesi', 'Özgür Okuma', 9),
('Barýþ Kütüphanesi', 'Tarih Þubesi', 1),
('Demokrasi Kütüphanesi', 'Sosyal Kitaplar', 8),
('Lale Kütüphanesi', 'Klasik Kitaplar', 5),
('Vadi Kütüphanesi', 'Doða Koleksiyonu', 20),
('Kýþ Kütüphanesi', 'Tarih ve Sanat', 35),
('Rüzgar Kütüphanesi', 'Þehir Kitaplarý', 30),
('Taþ Kütüphanesi', 'Mimari ve Tarih', 31),
('Yeþil Kütüphanesi', 'Doða ve Çocuk', 22),
('Kar Kütüphanesi', 'Soðuk Þubesi', 34),
('Buz Kütüphanesi', 'Klasikler Þubesi', 47),
('Altýn Yolu Kütüphanesi', 'Genel Kitaplar', 43),
('Okyanus Kütüphanesi', 'Deniz Þubesi', 44),
('Ayýþýðý Kütüphanesi', 'Hikaye Kitaplarý', 33),
('Baraj Kütüphanesi', 'Sahil Bölümü', 21),
('Zeytin Kütüphanesi', 'Tarih ve Doða', 40),
('Köþk Kütüphanesi', 'Klasik Kitaplar', 39),
('Esen Kütüphanesi', 'Bilimsel Kitaplar', 18),
('Dere Kütüphanesi', 'Akademik Çalýþmalar', 36),
('Umut Kütüphanesi', 'Psikoloji Kitaplarý', 38),
('Neþeli Kütüphane', 'Çocuk Þubesi', 48),
('Serin Bulvar Kütüphanesi', 'Rahat Ortam', 46);

select * from KUTUPHANE
select COUNT(*) from KUTUPHANE --- 37 tane kütüphane deðeri eklenmiþtir.
select KUTUPHANE_NO from KUTUPHANE

----- 

-----------Uyeler tablosuna veri ekleyelim ve girelim.

INSERT INTO UYELER (UYE_ADI, UYE_SOYADI, CINSIYET, TELEFON, E_POSTA, ADRES_NO)
VALUES
('Ahmet', 'Yýlmaz', 'E', '5551234567', 'ahmet.yilmaz@example.com', 1),
('Mehmet', 'Kaya', 'E', '5541234567', 'mehmet.kaya@example.com', 3),
('Ayþe', 'Demir', 'K', '5531234567', 'ayse.demir@example.com', 5),
('Fatma', 'Çelik', 'K', '5521234567', 'fatma.celik@example.com', 7),
('Ali', 'Þahin', 'E', '5511234567', 'ali.sahin@example.com', 9),
('Zeynep', 'Yýldýrým', 'K', '5501234567', 'zeynep.yildirim@example.com', 2),
('Hüseyin', 'Aydýn', 'E', '5491234567', 'huseyin.aydin@example.com', 4),
('Emine', 'Keskin', 'K', '5481234567', 'emine.keskin@example.com', 6),
('Hasan', 'Öztürk', 'E', '5471234567', 'hasan.ozturk@example.com', 8),
('Elif', 'Aslan', 'K', '5461234567', 'elif.aslan@example.com', 10),
('Murat', 'Doðan', 'E', '5451234567', 'murat.dogan@example.com', 11),
('Hatice', 'Koç', 'K', '5441234567', 'hatice.koc@example.com', 12),
('Ýbrahim', 'Erdem', 'E', '5431234567', 'ibrahim.erdem@example.com', 13),
('Rabia', 'Güneþ', 'K', '5421234567', 'rabia.gunes@example.com', 14),
('Mustafa', 'Gök', 'E', '5411234567', 'mustafa.gok@example.com', 15),
('Selin', 'Yalçýn', 'K', '5401234567', 'selin.yalcin@example.com', 16),
('Kerem', 'Bulut', 'E', '5391234567', 'kerem.bulut@example.com', 17),
('Sevgi', 'Duran', 'K', '5381234567', 'sevgi.duran@example.com', 18),
('Veli', 'Kara', 'E', '5371234567', 'veli.kara@example.com', 19),
('Leyla', 'Özkan', 'K', '5361234567', 'leyla.ozkan@example.com', 20),
('Büþra', 'Karaca', 'K', '5351234567', 'busra.karaca@example.com', 21),
('Furkan', 'Demirtaþ', 'E', '5341234567', 'furkan.demirtas@example.com', 22),
('Ebru', 'Tuna', 'K', '5331234567', 'ebru.tuna@example.com', 23),
('Hakan', 'Çetin', 'E', '5321234567', 'hakan.cetin@example.com', 24),
('Sevim', 'Altýn', 'K', '5311234567', 'sevim.altin@example.com', 25),
('Cem', 'Kýlýç', 'E', '5301234567', 'cem.kilic@example.com', 26),
('Melike', 'Akar', 'K', '5291234567', 'melike.akar@example.com', 27),
('Arda', 'Çakýr', 'E', '5281234567', 'arda.cakir@example.com', 28),
('Yasemin', 'Gül', 'K', '5271234567', 'yasemin.gul@example.com', 29),
('Okan', 'Karaman', 'E', '5261234567', 'okan.karaman@example.com', 30),
('Nur', 'Þentürk', 'K', '5251234567', 'nur.senturk@example.com', 31),
('Uður', 'Iþýk', 'E', '5241234567', 'ugur.isik@example.com', 32),
('Bahar', 'Pektaþ', 'K', '5231234567', 'bahar.pektas@example.com', 33),
('Can', 'Tekin', 'E', '5221234567', 'can.tekin@example.com', 34),
('Gamze', 'Arslan', 'K', '5211234567', 'gamze.arslan@example.com', 35),
('Serkan', 'Eroðlu', 'E', '5201234567', 'serkan.eroglu@example.com', 36),
('Seda', 'Demirci', 'K', '5191234567', 'seda.demirci@example.com', 37),
('Burak', 'Kavak', 'E', '5181234567', 'burak.kavak@example.com', 38),
('Derya', 'Akyüz', 'K', '5171234567', 'derya.akyuz@example.com', 39),
('Tolga', 'Korkmaz', 'E', '5161234567', 'tolga.korkmaz@example.com', 40),
('Gizem', 'Aktaþ', 'K', '5151234567', 'gizem.aktas@example.com', 41),
('Eren', 'Özgün', 'E', '5141234567', 'eren.ozgun@example.com', 42),
('Cansu', 'Özdemir', 'K', '5131234567', 'cansu.ozdemir@example.com', 43),
('Çaðrý', 'Turan', 'E', '5121234567', 'cagri.turan@example.com', 44),
('Damla', 'Bozkurt', 'K', '5111234567', 'damla.bozkurt@example.com', 45),
('Barýþ', 'Dikmen', 'E', '5101234567', 'baris.dikmen@example.com', 46),
('Þule', 'Köroðlu', 'K', '5091234567', 'sule.koroglu@example.com', 47),
('Mert', 'Çýnar', 'E', '5081234567', 'mert.cinar@example.com', 48),
('Ezgi', 'Ünal', 'K', '5071234567', 'ezgi.unal@example.com', 49);


select * from UYELER

--- 49 tane üye eklenmiþtir ve bunlar tamamdýr.

-----Emanet ilk 39 üye ve son 10 üye kitap almamýþtýr.

INSERT INTO EMANET (ISBN, UYE_NO, KUTUPHANE_NO, EMANET_TARIHI, TESLIM_TARIHI)
VALUES
-- Üye 1
('978-0-06-073401-6', 1, 1, '2024-01-01', '2024-01-15'),
('978-0-06-073401-7', 1, 2, '2024-01-01', '2024-01-15'),

-- Üye 2
('978-0-06-112008-5', 2, 3, '2024-01-03', '2024-01-17'),

-- Üye 3
('978-0-06-112008-6', 3, 4, '2024-01-05', '2024-01-19'),

-- Üye 4
('978-0-140-11825-7', 4, 5, '2024-01-07', '2024-01-21'),
('978-0-14-044926-7', 4, 6, '2024-01-07', '2024-01-21'),

-- Üye 5
('978-0-14-118280-4', 5, 7, '2024-01-09', '2024-01-23'),
('978-0-14-118529-4', 5, 8, '2024-01-09', '2024-01-23'),

-- Üye 6
('978-0-14-118529-5', 6, 9, '2024-01-11', '2024-01-25'),
('978-0-14-118529-6', 6, 10, '2024-01-11', '2024-01-25'),

-- Üye 7
('978-0-14-118529-7', 7, 11, '2024-01-13', '2024-01-27'),
('978-0-19-953557-0', 7, 12, '2024-01-13', '2024-01-27'),

-- Üye 8
('978-0-19-953558-1', 8, 13, '2024-01-15', '2024-01-29'),

-- Üye 9
('978-0-19-953559-2', 9, 14, '2024-01-17', '2024-01-31'),

-- Üye 10
('978-0-316-76948-0', 10, 15, '2024-01-19', '2024-02-02'),

-- Üye 11
('978-0-316-76948-9', 11, 16, '2024-01-21', '2024-02-04'),
('978-0-375-71344-0', 11, 17, '2024-01-21', '2024-02-04'),

-- Üye 12
('978-0-375-71344-1', 12, 18, '2024-01-23', '2024-02-06'),
('978-0-375-71344-9', 12, 19, '2024-01-23', '2024-02-06'),

-- Üye 13
('978-0-452-28423-5', 13, 20, '2024-01-25', '2024-02-08'),

-- Üye 14
('978-0-452-28423-6', 14, 21, '2024-01-27', '2024-02-10'),
('978-0-452-28423-7', 14, 22, '2024-01-27', '2024-02-10'),

-- Üye 15
('978-0-452-28423-8', 15, 23, '2024-01-29', '2024-02-12'),
('978-0-452-28423-9', 15, 24, '2024-01-29', '2024-02-12'),

-- Üye 16
('978-0-553-21311-8', 16, 25, '2024-01-31', '2024-02-14'),

-- Üye 17
('978-0-553-21311-9', 17, 26, '2024-02-01', '2024-02-15'),

-- Üye 18
('978-0-553-21312-0', 18, 27, '2024-02-03', '2024-02-17'),

-- Üye 19
('978-0-7432-7356-6', 19, 28, '2024-02-05', '2024-02-19'),

-- Üye 20
('978-0-7432-7356-7', 20, 29, '2024-02-07', '2024-02-21'),
('978-0-7432-7356-8', 20, 30, '2024-02-07', '2024-02-21'),

-- Üye 21
('978-0-7432-7356-9', 21, 31, '2024-02-09', '2024-02-23'),

-- Üye 22
('978-0-7432-7357-0', 22, 32, '2024-02-11', '2024-02-25'),

-- Üye 23
('978-0-7432-7357-1', 23, 33, '2024-02-13', '2024-02-27'),

-- Üye 24
('978-0-7434-9726-6', 24, 34, '2024-02-15', '2024-02-29'),

-- Üye 25
('978-0-7434-9726-7', 25, 35, '2024-02-17', '2024-03-02'),

-- Üye 26
('978-0-7434-9726-8', 26, 36, '2024-02-19', '2024-03-04'),

-- Üye 27
('978-0-7434-9726-9', 27, 37, '2024-02-21', '2024-03-06'),

-- Üye 28
('978-0-7434-9731-0', 28, 1, '2024-02-23', '2024-03-08'),

-- Üye 29
('978-1-250-16152-8', 29, 2, '2024-02-25', '2024-03-10'),

-- Üye 30
('978-1-250-16152-9', 30, 3, '2024-02-27', '2024-03-12'),

-- Üye 31
('978-1-250-16153-0', 31, 4, '2024-02-29', '2024-03-14'),

-- Üye 32
('978-1-5011-3474-7', 32, 5, '2024-03-01', '2024-03-15'),

-- Üye 33
('978-1-5011-3474-8', 33, 6, '2024-03-03', '2024-03-17'),

-- Üye 34
('978-1-86197-876-7', 34, 7, '2024-03-05', '2024-03-19'),

-- Üye 35
('978-1-86197-876-8', 35, 8, '2024-03-07', '2024-03-21'),

-- Üye 36
('978-1-86197-877-0', 36, 9, '2024-03-09', '2024-03-23'),

-- Üye 37
('978-3-16-148410-1', 37, 10, '2024-03-11', '2024-03-25'),

-- Üye 38
('978-0-06-073401-6', 38, 11, '2024-03-13', '2024-03-27'),

-- Üye 39
('978-0-06-073401-7', 39, 12, '2024-03-15', '2024-03-29');


select * from EMANET

select count(*) from EMANET

--- 49 tane emanet kayýtý girilmiþtir.

---- þimdi ise kütüphanelere kitaplarý daðýtacaz ve miktarlarý rastgele seçiçez.

INSERT INTO KITAP_KUTUPHANE (KUTUPHANE_NO, ISBN, MIKTAR)
VALUES
-- Kütüphane 1-10
(1, '978-0-06-073401-6', 10),
(1, '978-0-06-073401-7', 8),
(2, '978-0-06-112008-5', 12),
(2, '978-0-06-112008-6', 6),
(3, '978-0-140-11825-7', 7),
(3, '978-0-14-044926-7', 9),
(4, '978-0-14-118280-4', 11),
(4, '978-0-14-118529-4', 10),
(5, '978-0-14-118529-5', 8),
(5, '978-0-14-118529-6', 15),
(6, '978-0-14-118529-7', 12),
(6, '978-0-19-953557-0', 9),
(7, '978-0-19-953558-1', 6),
(7, '978-0-19-953559-2', 8),
(8, '978-0-316-76948-0', 11),
(8, '978-0-316-76948-9', 13),
(9, '978-0-375-71344-0', 5),
(9, '978-0-375-71344-1', 9),
(10, '978-0-375-71344-9', 7),
(10, '978-0-452-28423-5', 14),

-- Kütüphane 11-20
(11, '978-0-452-28423-6', 10),
(11, '978-0-452-28423-7', 6),
(12, '978-0-452-28423-8', 8),
(12, '978-0-452-28423-9', 9),
(13, '978-0-553-21311-8', 12),
(13, '978-0-553-21311-9', 15),
(14, '978-0-553-21312-0', 7),
(14, '978-0-7432-7356-6', 11),
(15, '978-0-7432-7356-7', 10),
(15, '978-0-7432-7356-8', 9),
(16, '978-0-7432-7356-9', 6),
(16, '978-0-7432-7357-0', 13),
(17, '978-0-7432-7357-1', 12),
(17, '978-0-7434-9726-6', 5),
(18, '978-0-7434-9726-7', 8),
(18, '978-0-7434-9726-8', 10),
(19, '978-0-7434-9726-9', 15),
(19, '978-0-7434-9731-0', 14),
(20, '978-1-250-16152-8', 6),
(20, '978-1-250-16152-9', 9),

-- Kütüphane 21-30
(21, '978-1-250-16153-0', 7),
(21, '978-1-5011-3474-7', 12),
(22, '978-1-5011-3474-8', 10),
(22, '978-1-86197-876-7', 8),
(23, '978-1-86197-876-8', 9),
(23, '978-1-86197-877-0', 13),
(24, '978-3-16-148410-1', 14),
(24, '978-0-06-073401-6', 10),
(25, '978-0-06-073401-7', 7),
(25, '978-0-06-112008-5', 11),
(26, '978-0-06-112008-6', 12),
(26, '978-0-140-11825-7', 5),
(27, '978-0-14-044926-7', 8),
(27, '978-0-14-118280-4', 10),
(28, '978-0-14-118529-4', 15),
(28, '978-0-14-118529-5', 12),
(29, '978-0-14-118529-6', 9),
(29, '978-0-14-118529-7', 14),
(30, '978-0-19-953557-0', 6),
(30, '978-0-19-953558-1', 8),

-- Kütüphane 31-37
(31, '978-0-19-953559-2', 10),
(31, '978-0-316-76948-0', 11),
(32, '978-0-316-76948-9', 7),
(32, '978-0-375-71344-0', 12),
(33, '978-0-375-71344-1', 10),
(33, '978-0-375-71344-9', 8),
(34, '978-0-452-28423-5', 13),
(34, '978-0-452-28423-6', 11),
(35, '978-0-452-28423-7', 9),
(35, '978-0-452-28423-8', 10),
(36, '978-0-452-28423-9', 15),
(36, '978-0-553-21311-8', 6),
(37, '978-0-553-21311-9', 9),
(37, '978-0-553-21312-0', 8);

select * from KITAP_KUTUPHANE
select COUNT(*) from KITAP_KUTUPHANE

