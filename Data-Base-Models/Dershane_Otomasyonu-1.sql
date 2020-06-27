create table Bolum (
Bolum_ID int Not Null,
Bolum_Adi varchar(30) Not Null,
Aciklama varchar(30) default Null,
Primary Key (Bolum_ID) 
);

create table Ders (
Ders_ID int Not Null,
Ders_Adi varchar(30) Not Null,
Ders_Kodu varchar(30) default Null,
Bolum_ID int default Null,
Primary Key (Ders_ID)
); 

alter table Ders
	ADD CONSTRAINT Ders_FK1 FOREIGN KEY (Bolum_ID)
References Bolum (Bolum_ID);

create table Ogrenci (
Ogrenci_No int Not Null,
Ogrenci_AdSoyad varchar(30) default Null,
E_Posta varchar(30) default Null,
Bolum_ID int default Null,
Primary Key (Ogrenci_No)
);

alter table Ogrenci
	ADD CONSTRAINT Ogrenci_FK1 FOREIGN KEY (Bolum_ID)
References Bolum (Bolum_ID);


create table Ogrenci_Ders (
Ogrenci_No int Not Null,
Ders_ID int Not Null,
Ogrenci_Not float default Null,
Primary Key (Ogrenci_No,Ders_ID),
);

alter table Ogrenci_Ders
	ADD CONSTRAINT Ogrenci_Ders_FK1 FOREIGN KEY
(Ogrenci_No) references Ogrenci (Ogrenci_No);
alter table Ogrenci_Ders
	ADD CONSTRAINT Ogrenci_Ders_FK2 FOREIGN KEY
(Ders_ID) references Ders (Ders_ID);


create table Ogretmen (
Ogretmen_ID int Not Null,
Ogretmen_AdSoyad varchar(30) default Null,
Telefon_Numaras� varchar(30) default Null,
Bolum_ID int default Null,
Primary Key (Ogretmen_ID)
);

alter table Ogretmen 
	ADD CONSTRAINT Ogretmen_FK1 FOREIGN KEY (Bolum_ID)
references Bolum (Bolum_ID);

create table Ogretmen_Ders(
Ogretmen_ID int Not Null,
Ders_ID int Not Null,
Primary Key (Ogretmen_ID,Ders_ID)
);

alter table Ogretmen_Ders
	ADD CONSTRAINT Ogretmen_Ders_FK1 FOREIGN KEY 
(Ogretmen_ID) references Ogretmen (Ogretmen_ID);
alter table Ogretmen_Ders
	ADD CONSTRAINT Ogretmen_Ders_FK2 FOREIGN KEY
(Ders_ID) references Ders (Ders_ID);

Insert Into Bolum (Bolum_ID, Bolum_Adi, Aciklama) values
(1, 'E�itA��rl�k' , 'E�it A��rl�k B�l�m�'),
(2, 'S�zel' , 'S�zel B�l�m�' ),
(3, 'Say�sal' , 'Say�sal B�l�m�'),
(4, 'Say�sal', 'Say�sal B�l�m�'),
(5, 'Dil', 'Dil B�l�m�');

Insert Into Ders (Ders_ID, Ders_Adi, Ders_Kodu, Bolum_ID) values
(1, 'Matematik' , '101', 1),
(2, 'T�rk�e' , '202', 2),
(3, 'Fizik' , '303', 3),
(4, 'Kimya' , '404', 4),
(5, '�ngilizce' , '505', 5);

Insert Into Ogrenci (Ogrenci_No,Ogrenci_AdSoyad, E_Posta, Bolum_ID) values
(1, 'Ali Akba�', 'aliakbas@gmail.com', 2),
(2, 'Y�cel Y�ksel', 'yucel12@gmail.com', 3),
(3, 'Or�un Ayaz', 'orcun55@gmail.com', 4),
(4, 'Furkan Ayd�n', 'furkanaydn@gmail.com', 1),
(5, 'Can �zt�rk', 'can7723@gmail.com', 3),
(6, 'Fatih Y�lmaz', 'Fatih322@gmail.com', 2),
(7, 'Atalay Babacan', 'atlybbcn@gmail.com', 1),
(8, 'Fatih Terim', 'fthtrm2@gmail.com', 2),
(9, 'Kadir Sava�', 'kadir9@gmail.com', 4),
(10, 'Yusuf �elgin', 'yusuf64@gmail.com', 1);

Insert Into Ogrenci_Ders (Ogrenci_No,Ders_ID,Ogrenci_Not) values
(1, 2, 60),
(2, 1, 45),
(3, 3, 90),
(4, 1, 66),
(5, 2, 30),
(6, 4, 21),
(7, 5, 77),
(8, 4, 49),
(9, 3, 25),
(10, 2, 85);

Insert Into Ogretmen (Ogretmen_ID, Ogretmen_AdSoyad, Telefon_Numaras�, Bolum_ID) values
(1, 'Suat Y�lmaz', '05652659898', 1),
(2, 'Deniz Ka�maz', '05455641232', 2),
(3, 'Emin Durmaz', '05257896532', 3),
(4, 'Nilg�n G�ren', '05419563274', 4),
(5, '�eyma Acar', '05556320112', 5);

Insert Into Ogretmen_Ders (Ogretmen_ID, Ders_ID) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

select * from Bolum;
select * from Ders;
select * from Ogrenci;
select * from Ogrenci_Ders;
select * from Ogretmen;
select * from Ogretmen_Ders;
