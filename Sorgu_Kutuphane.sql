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

-- de�er girme


INSERT INTO ADRESLER (CADDE, MAHALLE, BINA_NO, SEHIR, POSTA_KODU, ULKE)
VALUES 
('Bar�� Caddesi', '�i�ek Mahallesi', '10A', 'Ankara', 06520, 'T�rkiye'),
('G�l Sokak', 'Deniz Mahallesi', '22B', '�stanbul', 34000, 'T�rkiye'),
('Atat�rk Bulvar�', 'Y�ld�z Mahallesi', '5', '�zmir', 35250, 'T�rkiye'),
('K�rlang�� Caddesi', 'Orman Mahallesi', '35C', 'Bursa', 16010, 'T�rkiye'),
('Lale Sokak', 'Papatya Mahallesi', '17D', 'Antalya', 07040, 'T�rkiye'),
('Sahil Caddesi', 'Merkez Mahallesi', '12A', 'Mersin', 33010, 'T�rkiye'),
('�aml�k Yolu', '�am Mahallesi', '8B', 'Trabzon', 61000, 'T�rkiye'),
('Demokrasi Caddesi', 'Yeni Mahalle', '20C', 'Adana', 01010, 'T�rkiye'),
('H�rriyet Bulvar�', '�zg�rl�k Mahallesi', '25D', 'Gaziantep', 27010, 'T�rkiye'),
('Gazi Sokak', 'Kurtulu� Mahallesi', '18A', 'Samsun', 55040, 'T�rkiye'),
('Deniz Caddesi', 'Karadeniz Mahallesi', '9', 'Ordu', 52000, 'T�rkiye'),
('Bahar Sokak', 'Ye�il Mahallesi', '14B', 'Kocaeli', 41050, 'T�rkiye'),
('Mavi Caddesi', '�stiklal Mahallesi', '19A', 'Eski�ehir', 26010, 'T�rkiye'),
('Serin Sokak', 'Yayla Mahallesi', '23B', 'Kayseri', 38000, 'T�rkiye'),
('Fidan Yolu', 'Me�e Mahallesi', '27D', 'Konya', 42020, 'T�rkiye'),
('Selvi Sokak', '��nar Mahallesi', '3A', 'Malatya', 44000, 'T�rkiye'),
('K�y Yolu', 'Yayla Mahallesi', '5C', '�anl�urfa', 63050, 'T�rkiye'),
('Esen Sokak', 'G�ne� Mahallesi', '7D', 'Erzurum', 25040, 'T�rkiye'),
('Alt�n Caddesi', 'Sar� Mahallesi', '11B', 'Van', 65000, 'T�rkiye'),
('Vadi Sokak', 'Dere Mahallesi', '2A', 'Denizli', 20010, 'T�rkiye');

INSERT INTO ADRESLER (CADDE, MAHALLE, BINA_NO, SEHIR, POSTA_KODU, ULKE)
VALUES 
('Baraj Caddesi', 'Sahil Mahallesi', '30D', 'Antalya', 07050, 'T�rkiye'),
('Ye�il Sokak', 'Bahar Mahallesi', '44C', 'Mu�la', 48000, 'T�rkiye'),
('Kumluk Yolu', 'Kumsal Mahallesi', '8A', 'Bal�kesir', 10040, 'T�rkiye'),
('�i�ekli Bulvar', 'G�l Mahallesi', '16D', 'Ayd�n', 09020, 'T�rkiye'),
('I��k Caddesi', 'Parlak Mahallesi', '13B', 'K�r�ehir', 40010, 'T�rkiye'),
('�aml� Bulvar', 'A�a� Mahallesi', '22A', 'Nev�ehir', 50020, 'T�rkiye'),
('G�kku�a�� Sokak', 'G�k Mahallesi', '3C', 'Ni�de', 51010, 'T�rkiye'),
('Dere Yolu', 'Su Mahallesi', '45D', 'Kars', 36050, 'T�rkiye'),
('Bahar Yolu', 'Serin Mahallesi', '9B', 'Artvin', 08020, 'T�rkiye'),
('R�zgar Caddesi', 'Hava Mahallesi', '12A', 'Edirne', 22010, 'T�rkiye'),
('Ta� Sokak', 'Kaya Mahallesi', '19D', 'Tekirda�', 59030, 'T�rkiye'),
('Deniz Yolu', 'Mavi Mahallesi', '15B', 'Sinop', 57020, 'T�rkiye'),
('Ay����� Caddesi', 'Geceler Mahallesi', '23C', 'Isparta', 32010, 'T�rkiye'),
('Kar Yolu', 'Buz Mahallesi', '7D', 'Kars', 36020, 'T�rkiye'),
('K�� Sokak', 'So�uk Mahallesi', '9A', 'Ardahan', 75000, 'T�rkiye'),
('Dere Bulvar�', 'Su Mahallesi', '14C', 'Tunceli', 62000, 'T�rkiye'),
('Yaz Sokak', 'G�ne� Mahallesi', '20D', 'Amasya', 05010, 'T�rkiye'),
('Umut Caddesi', 'Hayal Mahallesi', '13A', 'Bart�n', 74010, 'T�rkiye'),
('K��k Sokak', 'Saray Mahallesi', '21B', 'Bolu', 14000, 'T�rkiye'),
('Zeytin Yolu', 'Zeytinlik Mahallesi', '11A', 'Hatay', 31010, 'T�rkiye'),
('Ar� Sokak', 'Bal Mahallesi', '8C', 'Mardin', 47010, 'T�rkiye'),
('G�ne� Caddesi', 'Parlak Mahallesi', '7A', 'Hakkari', 30010, 'T�rkiye'),
('Alt�n Yolu', 'Zengin Mahallesi', '9B', 'Batman', 72010, 'T�rkiye'),
('Okyanus Caddesi', 'Deniz Mahallesi', '5D', 'K�rklareli', 39020, 'T�rkiye'),
('Ay Caddesi', 'Y�ld�z Mahallesi', '11C', 'Afyonkarahisar', 03020, 'T�rkiye'),
('Serin Bulvar', 'Esinti Mahallesi', '8A', '�anakkale', 17010, 'T�rkiye'),
('Buz Sokak', 'Kar Mahallesi', '4B', 'Kastamonu', 37020, 'T�rkiye'),
('Ne�eli Caddesi', 'G�len Mahallesi', '6D', 'Bilecik', 11010, 'T�rkiye'),
('Kelebek Sokak', 'U�an Mahallesi', '13A', 'G�m��hane', 29010, 'T�rkiye');

select * from ADRESLER


truncate table ADRESLER

------ adresler tablosuna 49 tane de�er girildi


--------------------------------------------------,

--Kitaplar tablosuna de�er giri�i a��ld�.

select * from KITAPLAR

INSERT INTO KITAPLAR (ISBN, KITAP_ADI, YAYIN_TARIHI, S_SAYISI)
VALUES
('978-3-16-148410-1', 'Bir G�n', '2010-07-15', 368),
('978-1-86197-876-8', 'K�rl�k', '1995-05-15', 312),
('978-0-7432-7356-6', 'Hayvan �iftli�i', '1945-08-17', 112),
('978-0-316-76948-9', 'B�lb�l� �ld�rmek', '1960-07-11', 281),
('978-0-553-21311-8', '1984', '1949-06-08', 328),
('978-0-452-28423-5', 'Fahrenheit 451', '1953-10-19', 194),
('978-0-140-11825-7', 'D�n���m', '1915-01-01', 96),
('978-0-06-112008-5', 'Y�zy�ll�k Yaln�zl�k', '1967-05-30', 417),
('978-0-7434-9731-0', 'Sava� ve Bar��', '1869-01-01', 1225),
('978-0-14-118280-4', 'Su� ve Ceza', '1866-01-01', 671),
('978-0-375-71344-9', 'Anna Karenina', '1878-01-01', 964),
('978-0-14-044926-7', '�lyada', '800 BC', 704),
('978-0-19-953557-0', 'Odysseia', '800 BC', 560),
('978-0-7434-9726-6', 'U�ultulu Tepeler', '1847-12-01', 352),
('978-0-19-953558-1', 'Jane Eyre', '1847-10-16', 500),
('978-1-5011-3474-7', 'K���k Kad�nlar', '1868-01-01', 759),
('978-0-19-953559-2', 'Don Ki�ot', '1615-01-16', 1072),
('978-0-7432-7356-7', 'Beyaz Zambaklar �lkesinde', '1923-01-01', 228),
('978-0-14-118529-4', 'Martin Eden', '1909-01-01', 464),
('978-0-06-073401-6', 'Denizler Alt�nda 20.000 Fersah', '1870-06-20', 420),
('978-1-250-16152-8', 'D�nyan�n Merkezine Yolculuk', '1864-01-01', 183),
('978-0-316-76948-0', 'Robinson Crusoe', '1719-04-25', 320),
('978-0-452-28423-6', 'Sherlock Holmes: K�z�l Dosya', '1887-11-01', 108),
('978-0-7432-7356-8', 'Dracula', '1897-05-26', 418),
('978-0-553-21311-9', 'Frankenstein', '1818-01-01', 280),
('978-0-452-28423-7', 'Kuyruklu Y�ld�z Alt�nda Bir �zdiva�', '1912-03-01', 156),
('978-0-06-112008-6', '�al�ku�u', '1922-01-01', 411),
('978-0-375-71344-0', 'Kuyucakl� Yusuf', '1937-01-01', 200),
('978-0-14-118529-5', 'Yaban', '1932-01-01', 285),
('978-0-7434-9726-7', 'Sineklerin Tanr�s�', '1954-09-17', 224),
('978-1-5011-3474-8', 'Satran�', '1943-01-01', 80),
('978-1-86197-876-7', 'K�rk Mantolu Madonna', '1943-01-01', 160),
('978-0-452-28423-8', 'Eyl�l', '1900-01-01', 200),
('978-0-7432-7356-9', 'A�k-� Memnu', '1899-01-01', 288),
('978-0-553-21312-0', 'Tehlikeli Oyunlar', '1973-01-01', 416),
('978-0-7432-7357-0', '�nce Memed', '1955-01-01', 452),
('978-0-375-71344-1', 'Serenad', '2011-01-01', 481),
('978-0-452-28423-9', 'Beyaz Kale', '1985-01-01', 200),
('978-0-7434-9726-8', 'Kafamda Bir Tuhafl�k', '2014-01-01', 480),
('978-0-14-118529-6', 'Masumiyet M�zesi', '2008-01-01', 592),
('978-1-250-16152-9', '�ocuk Kalbi', '1886-01-01', 288),
('978-0-7434-9726-9', '�l� Canlar', '1842-01-01', 456),
('978-0-06-073401-7', 'Yeralt�ndan Notlar', '1864-01-01', 128),
('978-0-14-118529-7', 'Babalar ve O�ullar', '1862-01-01', 244),
('978-1-86197-877-0', 'Karamazov Karde�ler', '1880-01-01', 824),
('978-0-7432-7357-1', 'Budala', '1869-01-01', 768),
('978-1-250-16153-0', 'Ecinniler', '1872-01-01', 768);


select ISBN,KITAP_ADI from KITAPLAR -- 47 tane kitap bulunmaktad�r.
select ISBN from KITAPLAR 

-----Kitaplar b�l�m�ne giir� yap�ld�.

--------- �imdi ise karegoriler giri� yap�alcak.

INSERT INTO KATEGORILER (KATEGORI_ADI)
VALUES
('Roman'),
('Bilim Kurgu'),
('Fantastik'),
('Tarih'),
('Biyografi'),
('�ocuk'),
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
('Ki�isel Geli�im'),
('Mizah'),
('Gezi'),
('Sa�l�k');

select * from KATEGORILER

-- 20 tane kategori giri�i yap�ld�.


--------
------- yazarlar kategorisineyazar ve isimleri eklendi.

INSERT INTO YAZARLAR (YAZAR_ADI, YAZAR_SOYADI)
VALUES
-- Verilen Kitaplar�n Yazarlar�
('David', 'Nicholls'), -- Bir G�n
('Jose', 'Saramago'), -- K�rl�k
('George', 'Orwell'), -- Hayvan �iftli�i
('Harper', 'Lee'), -- B�lb�l� �ld�rmek
('George', 'Orwell'), -- 1984
('Ray', 'Bradbury'), -- Fahrenheit 451
('Franz', 'Kafka'), -- D�n���m
('Gabriel Garcia', 'Marquez'), -- Y�zy�ll�k Yaln�zl�k
('Leo', 'Tolstoy'), -- Sava� ve Bar��
('Fyodor', 'Dostoyevsky'), -- Su� ve Ceza
('Leo', 'Tolstoy'), -- Anna Karenina
('Homer', ''), -- �lyada
('Homer', ''), -- Odysseia
('Emily', 'Bronte'), -- U�ultulu Tepeler
('Charlotte', 'Bronte'), -- Jane Eyre
('Louisa May', 'Alcott'), -- K���k Kad�nlar
('Miguel', 'de Cervantes'), -- Don Ki�ot
('Grigory', 'Petrov'), -- Beyaz Zambaklar �lkesinde
('Jack', 'London'), -- Martin Eden
('Jules', 'Verne'), -- Denizler Alt�nda 20.000 Fersah
('Jules', 'Verne'), -- D�nyan�n Merkezine Yolculuk
('Daniel', 'Defoe'), -- Robinson Crusoe
('Arthur Conan', 'Doyle'), -- Sherlock Holmes: K�z�l Dosya
('Bram', 'Stoker'), -- Dracula
('Mary', 'Shelley'), -- Frankenstein
('Halide Edib', 'Ad�var'), -- �al�ku�u
('Sabahattin', 'Ali'), -- K�rk Mantolu Madonna
('Ahmet Hamdi', 'Tanp�nar'), -- Huzur
('Orhan', 'Pamuk'), -- Masumiyet M�zesi

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
-------- Kitap_kategori k�sm�na kitapalr�n kategorilerini ekleyece�iz ve  veri giri�i yapal�m.

INSERT INTO KITAP_KATEGORI (ISBN, KATEGORI_NO)
VALUES
('978-3-16-148410-1', 1), -- Bir G�n (Roman)
('978-1-86197-876-8', 1), -- K�rl�k (Roman)
('978-0-7432-7356-6', 1), -- Hayvan �iftli�i (Roman)
('978-0-316-76948-9', 1), -- B�lb�l� �ld�rmek (Roman)
('978-0-553-21311-8', 1), -- 1984 (Roman)
('978-0-452-28423-5', 2), -- Fahrenheit 451 (Bilim Kurgu)
('978-0-140-11825-7', 2), -- D�n���m (Bilim Kurgu)
('978-0-06-112008-5', 1), -- Y�zy�ll�k Yaln�zl�k (Roman)
('978-0-7434-9731-0', 7), -- Sava� ve Bar�� (Klasik)
('978-0-14-118280-4', 7), -- Su� ve Ceza (Klasik)
('978-0-375-71344-9', 7), -- Anna Karenina (Klasik)
('978-0-14-044926-7', 7), -- �lyada (Klasik)
('978-0-19-953557-0', 7), -- Odysseia (Klasik)
('978-0-7434-9726-6', 7), -- U�ultulu Tepeler (Klasik)
('978-0-19-953558-1', 7), -- Jane Eyre (Klasik)
('978-1-5011-3474-7', 6), -- K���k Kad�nlar (�ocuk)
('978-0-19-953559-2', 7), -- Don Ki�ot (Klasik)
('978-0-7432-7356-7', 4), -- Beyaz Zambaklar �lkesinde (Tarih)
('978-0-14-118529-4', 1), -- Martin Eden (Roman)
('978-0-06-073401-6', 2), -- Denizler Alt�nda 20.000 Fersah (Bilim Kurgu)
('978-1-250-16152-8', 2), -- D�nyan�n Merkezine Yolculuk (Bilim Kurgu)
('978-0-316-76948-0', 7), -- Robinson Crusoe (Klasik)
('978-0-452-28423-6', 8), -- Sherlock Holmes: K�z�l Dosya (Polisiye)
('978-0-7432-7356-8', 8), -- Dracula (Polisiye)
('978-0-553-21311-9', 8), -- Frankenstein (Polisiye)
('978-0-452-28423-7', 6), -- Kuyruklu Y�ld�z Alt�nda Bir �zdiva� (�ocuk)
('978-0-06-112008-6', 1), -- �al�ku�u (Roman)
('978-0-375-71344-0', 1), -- Kuyucakl� Yusuf (Roman)
('978-0-14-118529-5', 1), -- Yaban (Roman)
('978-0-7434-9726-7', 6), -- Sineklerin Tanr�s� (�ocuk)
('978-1-5011-3474-8', 10), -- Satran� (Felsefe)
('978-1-86197-876-7', 5), -- K�rk Mantolu Madonna (Biyografi)
('978-0-452-28423-8', 10), -- Eyl�l (Felsefe)
('978-0-7432-7356-9', 10), -- A�k-� Memnu (Felsefe)
('978-0-553-21312-0', 10), -- Tehlikeli Oyunlar (Felsefe)
('978-0-7432-7357-0', 1), -- �nce Memed (Roman)
('978-0-375-71344-1', 1), -- Serenad (Roman)
('978-0-452-28423-9', 1), -- Beyaz Kale (Roman)
('978-0-7434-9726-8', 1), -- Kafamda Bir Tuhafl�k (Roman)
('978-0-14-118529-6', 1), -- Masumiyet M�zesi (Roman)
('978-1-250-16152-9', 6), -- �ocuk Kalbi (�ocuk)
('978-0-7434-9726-9', 7), -- �l� Canlar (Klasik)
('978-0-06-073401-7', 10), -- Yeralt�ndan Notlar (Felsefe)
('978-0-14-118529-7', 1), -- Babalar ve O�ullar (Roman)
('978-1-86197-877-0', 7), -- Karamazov Karde�ler (Klasik)
('978-0-7432-7357-1', 7), -- Budala (Klasik)
('978-1-250-16153-0', 7); -- Ecinniler (Klasik)

select COUNT(*) from KITAP_KATEGORI --- buradaki kitaplar karegorisinde ISBN olan her e��iz de�er d���nda girilirse komut kabul etmez.

------ Kitap kategorisine eklendi.

-----�imdi ise Kitap yazar tablosuna veri ekleme yapal�m.

INSERT INTO KITAP_YAZAR (ISBN, YAZAR_NO)
VALUES
('978-0-06-073401-6', 20), -- Denizler Alt�nda 20.000 Fersah - Jules Verne
('978-0-06-073401-7', 10), -- Yeralt�ndan Notlar - Fyodor Dostoyevsky
('978-0-06-112008-5', 8), -- Y�zy�ll�k Yaln�zl�k - Gabriel Garcia Marquez
('978-0-06-112008-6', 26), -- �al�ku�u - Halide Edib Ad�var
('978-0-140-11825-7', 7), -- D�n���m - Franz Kafka
('978-0-14-044926-7', 12), -- �lyada - Homer
('978-0-14-118280-4', 10), -- Su� ve Ceza - Fyodor Dostoyevsky
('978-0-14-118529-4', 19), -- Martin Eden - Jack London
('978-0-14-118529-5', 27), -- Yaban - Sabahattin Ali
('978-0-14-118529-6', 29), -- Masumiyet M�zesi - Orhan Pamuk
('978-0-14-118529-7', 10), -- Babalar ve O�ullar - Fyodor Dostoyevsky
('978-0-19-953557-0', 13), -- Odysseia - Homer
('978-0-19-953558-1', 15), -- Jane Eyre - Charlotte Bronte
('978-0-19-953559-2', 17), -- Don Ki�ot - Miguel de Cervantes
('978-0-316-76948-0', 22), -- Robinson Crusoe - Daniel Defoe
('978-0-316-76948-9', 4), -- B�lb�l� �ld�rmek - Harper Lee
('978-0-375-71344-0', 27), -- Kuyucakl� Yusuf - Sabahattin Ali
('978-0-375-71344-1', 29), -- Serenad - Orhan Pamuk
('978-0-375-71344-9', 9), -- Anna Karenina - Leo Tolstoy
('978-0-452-28423-5', 6), -- Fahrenheit 451 - Ray Bradbury
('978-0-452-28423-6', 23), -- Sherlock Holmes: K�z�l Dosya - Arthur Conan Doyle
('978-0-452-28423-7', 28), -- Kuyruklu Y�ld�z Alt�nda Bir �zdiva� - Ahmet Hamdi Tanp�nar
('978-0-452-28423-8', 28), -- Eyl�l - Ahmet Hamdi Tanp�nar
('978-0-452-28423-9', 29), -- Beyaz Kale - Orhan Pamuk
('978-0-553-21311-8', 3), -- 1984 - George Orwell
('978-0-553-21311-9', 25), -- Frankenstein - Mary Shelley
('978-0-553-21312-0', 27), -- Tehlikeli Oyunlar - Sabahattin Ali
('978-0-7432-7356-6', 3), -- Hayvan �iftli�i - George Orwell
('978-0-7432-7356-7', 18), -- Beyaz Zambaklar �lkesinde - Grigory Petrov
('978-0-7432-7356-8', 24), -- Dracula - Bram Stoker
('978-0-7432-7356-9', 27), -- A�k-� Memnu - Sabahattin Ali
('978-0-7432-7357-0', 27), -- �nce Memed - Sabahattin Ali
('978-0-7432-7357-1', 10), -- Budala - Fyodor Dostoyevsky
('978-0-7434-9726-6', 14), -- U�ultulu Tepeler - Emily Bronte
('978-0-7434-9726-7', 22), -- Sineklerin Tanr�s� - William Golding
('978-0-7434-9726-8', 29), -- Kafamda Bir Tuhafl�k - Orhan Pamuk
('978-0-7434-9726-9', 9), -- �l� Canlar - Nikolai Gogol
('978-0-7434-9731-0', 9), -- Sava� ve Bar�� - Leo Tolstoy
('978-1-250-16152-8', 20), -- D�nyan�n Merkezine Yolculuk - Jules Verne
('978-1-250-16152-9', 34), -- �ocuk Kalbi - Edmondo De Amicis
('978-1-250-16153-0', 10), -- Ecinniler - Fyodor Dostoyevsky
('978-1-5011-3474-7', 16), -- K���k Kad�nlar - Louisa May Alcott
('978-1-5011-3474-8', 33), -- Satran� - Stefan Zweig
('978-1-86197-876-7', 27), -- K�rk Mantolu Madonna - Sabahattin Ali
('978-1-86197-876-8', 2), -- K�rl�k - Jose Saramago
('978-1-86197-877-0', 10), -- Karamazov Karde�ler - Fyodor Dostoyevsky
('978-3-16-148410-1', 1); -- Bir G�n - David Nicholls


select COUNT(*) from KITAP_YAZAR -- 47 kitaba yazar eklenmi�tir.
----K�TAP_YAZAR tablosuna de�er eklenmi�tir.


------K�T�PHANE tablosuna de�er eklenmi�tir.

INSERT INTO KUTUPHANE (KUTUPHANE_ISMI, ACIKLAMA, ADRES_NO)
VALUES
('Merkez K�t�phane', 'Ana �ube', 1),
('�i�ek K�t�phanesi', 'Gen�lik �ubesi', 3),
('Deniz K�t�phanesi', 'Sahil �ubesi', 6),
('�aml�k K�t�phanesi', 'Do�a �ubesi', 7),
('G�kku�a�� K�t�phanesi', 'Renkli Kitaplar', 27),
('I��k K�t�phanesi', 'Edebiyat A��rl�kl�', 25),
('Alt�n K�t�phanesi', 'Tarih �ubesi', 19),
('Selvi K�t�phanesi', '�ocuk Kitaplar�', 16),
('Bahar K�t�phanesi', 'Pop�ler Kitaplar', 12),
('Serin K�t�phanesi', 'Sessiz Ortam', 46),
('Yaz K�t�phanesi', 'A��k Alan', 37),
('Ar� K�t�phanesi', 'Bilimsel �al��malar', 41),
('G�ne� K�t�phanesi', 'Yeni ��kanlar', 42),
('Kelebek K�t�phanesi', 'Sanat Koleksiyonu', 49),
('Mavi K�t�phanesi', 'Denizle B�t�nle�mi�', 13),
('H�rriyet K�t�phanesi', '�zg�r Okuma', 9),
('Bar�� K�t�phanesi', 'Tarih �ubesi', 1),
('Demokrasi K�t�phanesi', 'Sosyal Kitaplar', 8),
('Lale K�t�phanesi', 'Klasik Kitaplar', 5),
('Vadi K�t�phanesi', 'Do�a Koleksiyonu', 20),
('K�� K�t�phanesi', 'Tarih ve Sanat', 35),
('R�zgar K�t�phanesi', '�ehir Kitaplar�', 30),
('Ta� K�t�phanesi', 'Mimari ve Tarih', 31),
('Ye�il K�t�phanesi', 'Do�a ve �ocuk', 22),
('Kar K�t�phanesi', 'So�uk �ubesi', 34),
('Buz K�t�phanesi', 'Klasikler �ubesi', 47),
('Alt�n Yolu K�t�phanesi', 'Genel Kitaplar', 43),
('Okyanus K�t�phanesi', 'Deniz �ubesi', 44),
('Ay����� K�t�phanesi', 'Hikaye Kitaplar�', 33),
('Baraj K�t�phanesi', 'Sahil B�l�m�', 21),
('Zeytin K�t�phanesi', 'Tarih ve Do�a', 40),
('K��k K�t�phanesi', 'Klasik Kitaplar', 39),
('Esen K�t�phanesi', 'Bilimsel Kitaplar', 18),
('Dere K�t�phanesi', 'Akademik �al��malar', 36),
('Umut K�t�phanesi', 'Psikoloji Kitaplar�', 38),
('Ne�eli K�t�phane', '�ocuk �ubesi', 48),
('Serin Bulvar K�t�phanesi', 'Rahat Ortam', 46);

select * from KUTUPHANE
select COUNT(*) from KUTUPHANE --- 37 tane k�t�phane de�eri eklenmi�tir.
select KUTUPHANE_NO from KUTUPHANE

----- 

-----------Uyeler tablosuna veri ekleyelim ve girelim.

INSERT INTO UYELER (UYE_ADI, UYE_SOYADI, CINSIYET, TELEFON, E_POSTA, ADRES_NO)
VALUES
('Ahmet', 'Y�lmaz', 'E', '5551234567', 'ahmet.yilmaz@example.com', 1),
('Mehmet', 'Kaya', 'E', '5541234567', 'mehmet.kaya@example.com', 3),
('Ay�e', 'Demir', 'K', '5531234567', 'ayse.demir@example.com', 5),
('Fatma', '�elik', 'K', '5521234567', 'fatma.celik@example.com', 7),
('Ali', '�ahin', 'E', '5511234567', 'ali.sahin@example.com', 9),
('Zeynep', 'Y�ld�r�m', 'K', '5501234567', 'zeynep.yildirim@example.com', 2),
('H�seyin', 'Ayd�n', 'E', '5491234567', 'huseyin.aydin@example.com', 4),
('Emine', 'Keskin', 'K', '5481234567', 'emine.keskin@example.com', 6),
('Hasan', '�zt�rk', 'E', '5471234567', 'hasan.ozturk@example.com', 8),
('Elif', 'Aslan', 'K', '5461234567', 'elif.aslan@example.com', 10),
('Murat', 'Do�an', 'E', '5451234567', 'murat.dogan@example.com', 11),
('Hatice', 'Ko�', 'K', '5441234567', 'hatice.koc@example.com', 12),
('�brahim', 'Erdem', 'E', '5431234567', 'ibrahim.erdem@example.com', 13),
('Rabia', 'G�ne�', 'K', '5421234567', 'rabia.gunes@example.com', 14),
('Mustafa', 'G�k', 'E', '5411234567', 'mustafa.gok@example.com', 15),
('Selin', 'Yal��n', 'K', '5401234567', 'selin.yalcin@example.com', 16),
('Kerem', 'Bulut', 'E', '5391234567', 'kerem.bulut@example.com', 17),
('Sevgi', 'Duran', 'K', '5381234567', 'sevgi.duran@example.com', 18),
('Veli', 'Kara', 'E', '5371234567', 'veli.kara@example.com', 19),
('Leyla', '�zkan', 'K', '5361234567', 'leyla.ozkan@example.com', 20),
('B��ra', 'Karaca', 'K', '5351234567', 'busra.karaca@example.com', 21),
('Furkan', 'Demirta�', 'E', '5341234567', 'furkan.demirtas@example.com', 22),
('Ebru', 'Tuna', 'K', '5331234567', 'ebru.tuna@example.com', 23),
('Hakan', '�etin', 'E', '5321234567', 'hakan.cetin@example.com', 24),
('Sevim', 'Alt�n', 'K', '5311234567', 'sevim.altin@example.com', 25),
('Cem', 'K�l��', 'E', '5301234567', 'cem.kilic@example.com', 26),
('Melike', 'Akar', 'K', '5291234567', 'melike.akar@example.com', 27),
('Arda', '�ak�r', 'E', '5281234567', 'arda.cakir@example.com', 28),
('Yasemin', 'G�l', 'K', '5271234567', 'yasemin.gul@example.com', 29),
('Okan', 'Karaman', 'E', '5261234567', 'okan.karaman@example.com', 30),
('Nur', '�ent�rk', 'K', '5251234567', 'nur.senturk@example.com', 31),
('U�ur', 'I��k', 'E', '5241234567', 'ugur.isik@example.com', 32),
('Bahar', 'Pekta�', 'K', '5231234567', 'bahar.pektas@example.com', 33),
('Can', 'Tekin', 'E', '5221234567', 'can.tekin@example.com', 34),
('Gamze', 'Arslan', 'K', '5211234567', 'gamze.arslan@example.com', 35),
('Serkan', 'Ero�lu', 'E', '5201234567', 'serkan.eroglu@example.com', 36),
('Seda', 'Demirci', 'K', '5191234567', 'seda.demirci@example.com', 37),
('Burak', 'Kavak', 'E', '5181234567', 'burak.kavak@example.com', 38),
('Derya', 'Aky�z', 'K', '5171234567', 'derya.akyuz@example.com', 39),
('Tolga', 'Korkmaz', 'E', '5161234567', 'tolga.korkmaz@example.com', 40),
('Gizem', 'Akta�', 'K', '5151234567', 'gizem.aktas@example.com', 41),
('Eren', '�zg�n', 'E', '5141234567', 'eren.ozgun@example.com', 42),
('Cansu', '�zdemir', 'K', '5131234567', 'cansu.ozdemir@example.com', 43),
('�a�r�', 'Turan', 'E', '5121234567', 'cagri.turan@example.com', 44),
('Damla', 'Bozkurt', 'K', '5111234567', 'damla.bozkurt@example.com', 45),
('Bar��', 'Dikmen', 'E', '5101234567', 'baris.dikmen@example.com', 46),
('�ule', 'K�ro�lu', 'K', '5091234567', 'sule.koroglu@example.com', 47),
('Mert', '��nar', 'E', '5081234567', 'mert.cinar@example.com', 48),
('Ezgi', '�nal', 'K', '5071234567', 'ezgi.unal@example.com', 49);


select * from UYELER

--- 49 tane �ye eklenmi�tir ve bunlar tamamd�r.

-----Emanet ilk 39 �ye ve son 10 �ye kitap almam��t�r.

INSERT INTO EMANET (ISBN, UYE_NO, KUTUPHANE_NO, EMANET_TARIHI, TESLIM_TARIHI)
VALUES
-- �ye 1
('978-0-06-073401-6', 1, 1, '2024-01-01', '2024-01-15'),
('978-0-06-073401-7', 1, 2, '2024-01-01', '2024-01-15'),

-- �ye 2
('978-0-06-112008-5', 2, 3, '2024-01-03', '2024-01-17'),

-- �ye 3
('978-0-06-112008-6', 3, 4, '2024-01-05', '2024-01-19'),

-- �ye 4
('978-0-140-11825-7', 4, 5, '2024-01-07', '2024-01-21'),
('978-0-14-044926-7', 4, 6, '2024-01-07', '2024-01-21'),

-- �ye 5
('978-0-14-118280-4', 5, 7, '2024-01-09', '2024-01-23'),
('978-0-14-118529-4', 5, 8, '2024-01-09', '2024-01-23'),

-- �ye 6
('978-0-14-118529-5', 6, 9, '2024-01-11', '2024-01-25'),
('978-0-14-118529-6', 6, 10, '2024-01-11', '2024-01-25'),

-- �ye 7
('978-0-14-118529-7', 7, 11, '2024-01-13', '2024-01-27'),
('978-0-19-953557-0', 7, 12, '2024-01-13', '2024-01-27'),

-- �ye 8
('978-0-19-953558-1', 8, 13, '2024-01-15', '2024-01-29'),

-- �ye 9
('978-0-19-953559-2', 9, 14, '2024-01-17', '2024-01-31'),

-- �ye 10
('978-0-316-76948-0', 10, 15, '2024-01-19', '2024-02-02'),

-- �ye 11
('978-0-316-76948-9', 11, 16, '2024-01-21', '2024-02-04'),
('978-0-375-71344-0', 11, 17, '2024-01-21', '2024-02-04'),

-- �ye 12
('978-0-375-71344-1', 12, 18, '2024-01-23', '2024-02-06'),
('978-0-375-71344-9', 12, 19, '2024-01-23', '2024-02-06'),

-- �ye 13
('978-0-452-28423-5', 13, 20, '2024-01-25', '2024-02-08'),

-- �ye 14
('978-0-452-28423-6', 14, 21, '2024-01-27', '2024-02-10'),
('978-0-452-28423-7', 14, 22, '2024-01-27', '2024-02-10'),

-- �ye 15
('978-0-452-28423-8', 15, 23, '2024-01-29', '2024-02-12'),
('978-0-452-28423-9', 15, 24, '2024-01-29', '2024-02-12'),

-- �ye 16
('978-0-553-21311-8', 16, 25, '2024-01-31', '2024-02-14'),

-- �ye 17
('978-0-553-21311-9', 17, 26, '2024-02-01', '2024-02-15'),

-- �ye 18
('978-0-553-21312-0', 18, 27, '2024-02-03', '2024-02-17'),

-- �ye 19
('978-0-7432-7356-6', 19, 28, '2024-02-05', '2024-02-19'),

-- �ye 20
('978-0-7432-7356-7', 20, 29, '2024-02-07', '2024-02-21'),
('978-0-7432-7356-8', 20, 30, '2024-02-07', '2024-02-21'),

-- �ye 21
('978-0-7432-7356-9', 21, 31, '2024-02-09', '2024-02-23'),

-- �ye 22
('978-0-7432-7357-0', 22, 32, '2024-02-11', '2024-02-25'),

-- �ye 23
('978-0-7432-7357-1', 23, 33, '2024-02-13', '2024-02-27'),

-- �ye 24
('978-0-7434-9726-6', 24, 34, '2024-02-15', '2024-02-29'),

-- �ye 25
('978-0-7434-9726-7', 25, 35, '2024-02-17', '2024-03-02'),

-- �ye 26
('978-0-7434-9726-8', 26, 36, '2024-02-19', '2024-03-04'),

-- �ye 27
('978-0-7434-9726-9', 27, 37, '2024-02-21', '2024-03-06'),

-- �ye 28
('978-0-7434-9731-0', 28, 1, '2024-02-23', '2024-03-08'),

-- �ye 29
('978-1-250-16152-8', 29, 2, '2024-02-25', '2024-03-10'),

-- �ye 30
('978-1-250-16152-9', 30, 3, '2024-02-27', '2024-03-12'),

-- �ye 31
('978-1-250-16153-0', 31, 4, '2024-02-29', '2024-03-14'),

-- �ye 32
('978-1-5011-3474-7', 32, 5, '2024-03-01', '2024-03-15'),

-- �ye 33
('978-1-5011-3474-8', 33, 6, '2024-03-03', '2024-03-17'),

-- �ye 34
('978-1-86197-876-7', 34, 7, '2024-03-05', '2024-03-19'),

-- �ye 35
('978-1-86197-876-8', 35, 8, '2024-03-07', '2024-03-21'),

-- �ye 36
('978-1-86197-877-0', 36, 9, '2024-03-09', '2024-03-23'),

-- �ye 37
('978-3-16-148410-1', 37, 10, '2024-03-11', '2024-03-25'),

-- �ye 38
('978-0-06-073401-6', 38, 11, '2024-03-13', '2024-03-27'),

-- �ye 39
('978-0-06-073401-7', 39, 12, '2024-03-15', '2024-03-29');


select * from EMANET

select count(*) from EMANET

--- 49 tane emanet kay�t� girilmi�tir.

---- �imdi ise k�t�phanelere kitaplar� da��tacaz ve miktarlar� rastgele se�i�ez.

INSERT INTO KITAP_KUTUPHANE (KUTUPHANE_NO, ISBN, MIKTAR)
VALUES
-- K�t�phane 1-10
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

-- K�t�phane 11-20
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

-- K�t�phane 21-30
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

-- K�t�phane 31-37
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

