select * from Users;
select * from categories;
select * from events;
select * from images;
select * from places;
select * from waitconfirms;
select * from favorites;

SET SQL_SAFE_UPDATES=0;

select * from events
join
favorites
on events.Ev_Id=favorites.Ev_Id
where favorites.U_Id=1;


use pizzeriadb;
drop database mapevent;

create database mapevent;
SET SQL_SAFE_UPDATES=0;
use mapevent;


CREATE TABLE Users
(
U_Id int NOT NULL AUTO_INCREMENT,
Username varchar(255) UNIQUE,
FullName varchar(255),
Email varchar(255) UNIQUE,
Password varchar(255),
Gender varchar(255),
Enable boolean,
PRIMARY KEY (U_Id)
);

CREATE TABLE Categories
(
Cat_Id int NOT NULL AUTO_INCREMENT,
Cat_Prnt_Id int DEFAULT NULL,
Title varchar(255),
PRIMARY KEY (Cat_Id)
);

CREATE TABLE Places
(
Plc_Id int NOT NULL AUTO_INCREMENT,
Plc_Id_Google varchar(255),
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
Title varchar(255),
Have_Imgs boolean NOT NULL DEFAULT 0,
Start datetime,
Finish datetime,
Discription text,
PRIMARY KEY (Ev_Id)
);

CREATE TABLE Favorites
(
F_Id int NOT NULL AUTO_INCREMENT,
U_Id int,
Ev_Id int,
PRIMARY KEY (F_Id)
);

CREATE TABLE Images
(
Img_Id int NOT NULL AUTO_INCREMENT,
Address_Img varchar(255),
Ev_Id int,
PRIMARY KEY (Img_Id)
);

CREATE TABLE Waitconfirms
(
WC_Id int NOT NULL AUTO_INCREMENT,
Username varchar(255) UNIQUE,
FullName varchar(255),
Email varchar(255) UNIQUE,
Password varchar(255),
Gender varchar(255),
HashConfirm varchar(255),
Send_Email datetime,
PRIMARY KEY (WC_Id)
);

ALTER TABLE events ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (Plc_Id) REFERENCES places(Plc_Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE events ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (Cat_Id) REFERENCES categories(Cat_Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE events ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (U_Id) REFERENCES users(U_Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE categories ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (Cat_Prnt_Id) REFERENCES categories(Cat_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Images ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (Ev_Id) REFERENCES events(Ev_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE favorites ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (U_Id) REFERENCES Users(U_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE favorites ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (Ev_Id) REFERENCES Events(Ev_Id) ON DELETE CASCADE ON UPDATE CASCADE;


insert into categories (Title) values("Business");
insert into categories (Title) values("Movie");
insert into categories (Title) values("Concert");
insert into categories (Title) values("Dance");
insert into categories (Title) values("Exhibition");
insert into categories (Title) values("Game");
insert into categories (Title) values("Festival");
insert into categories (Title) values("Theatre");
insert into categories (Title) values("Sport");
insert into categories (Title) values("Quest");
insert into categories (Title) values("Charity");
insert into categories (Title) values("Meeting");
insert into categories (Title) values("Comedy");


insert into users (Username, FullName, Email, Password, Gender, Enable) values("dima", "D M", "viva-barca@i.ua", "b59c67bf196a4758191e42f76670ceba", "male", false);
insert into places (Plc_Id_Google, Address_Line_1, Address_Line_2, City, State, Country, Lat, Lng) values("asca", "casv" ,"vdsv", "vds", "csac", "casc", 4.535642, 7.536743);
insert into events (U_Id, Cat_Id, Plc_Id, Title, Have_Imgs, Start, Finish, Discription) values(10, 47, 7, "Title3", 0, "2016-12-20 20:00", "2016-12-21 20:00", "dist");
insert into favorites (Ev_Id, U_Id) value (35, 9);


use mapevent;





select * from places where Plc_Id_Google="ChIJBVXQG_CgJ0ERON-jp0YRZE0" and 
						   Address_Line_1="вулиця Сумська" and 
                           Address_Line_2="2" and 
                           City="Харків" and 
                           State="Харківська" and 
                           Country="Украина" and 
                           Lat="49.993351" and 
                           Lng="36.232372";
          
select * from places;
          
select * from events e 
join Places p
on e.Plc_Id = p.Plc_Id
join Categories c
on c.Cat_Id = e.Cat_Id 
where
(c.Cat_Id = 45 or c.Cat_Id = 47)
and
(p.lat <= 50.019707644389825 and p.lat >= 49.9762311405667 and p.lng <= 36.343116796777394 and p.lng >= 36.1318016417481);


delete from favorites where F_Id=15;
delete from users where Username="toro-bravo@yandex.ru";

delete from waitconfirms;
drop table categories;

insert into Images (Address_Img, Ev_Id) values("sadd", 5);
delete from Images where Address_Img="sadd";
drop table events;
delete from categories;
