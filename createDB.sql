drop database mapevent;
create database mapevent;

CREATE TABLE Users
(
U_Id int NOT NULL AUTO_INCREMENT,
Username varchar(255) UNIQUE,
FullName varchar(255),
Email varchar(255) UNIQUE,
Password varchar(255),
Gender varchar(255),
PRIMARY KEY (U_Id)
);

CREATE TABLE Categories
(
Cat_Id int NOT NULL AUTO_INCREMENT,
Cat_Prnt_Id int DEFAULT NULL,
Title varchar(255),
PRIMARY KEY (Cat_Id),
FOREIGN KEY (Cat_Prnt_Id) REFERENCES Categories(Cat_Id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

insert into categories (Title) values("sadd");
select * from categories;
delete from categories where Title="sadd";
drop table categories;

CREATE TABLE Places
(
Plc_Id int NOT NULL AUTO_INCREMENT,
Address_Line_1 varchar(255),
Address_Line_2 varchar(255),
City varchar(255),
State varchar(255),
Country varchar(255),
Lat Decimal(9,6) NOT NULL,
Lng Decimal(9,6) NOT NULL,
PRIMARY KEY (Plc_Id)
);

CREATE TABLE Events
(
Ev_Id int NOT NULL AUTO_INCREMENT,
U_Id int,
Cat_Id int,
Plc_Id int,
Have_Imgs boolean NOT NULL DEFAULT 0,
Start datetime,
Finish datetime,
Discription text,
PRIMARY KEY (Ev_Id),
FOREIGN KEY (U_Id) REFERENCES Users(U_Id) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (Cat_Id) REFERENCES Categories(Cat_Id) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (Plc_Id) REFERENCES Places(Plc_Id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Images
(
Img_Id int NOT NULL AUTO_INCREMENT,
Address_Img varchar(255),
Ev_Id int,
PRIMARY KEY (Img_Id),
FOREIGN KEY (Ev_Id) REFERENCES Events(Ev_Id) ON DELETE CASCADE
);

insert into Images (Address_Img, Ev_Id) values("sadd", 5);
select * from Images;
delete from Images where Address_Img="sadd";
drop table Images;