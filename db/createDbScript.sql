
DROP DATABASE IF EXISTS `tas-calendar`;

-- Stworz baze danych
CREATE DATABASE `tas-calendar` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tas-calendar`;

create table if not exists Users(
	login varchar(50) primary key not null,
	password varchar(50) not null,
	signup_date datetime not null
);


create table if not exists Tasks(
	task_id int primary key not null auto_increment,
	task_creator varchar(50) not null, -- Twórca danego zadania
	task_name tinytext not null,
	task_deadline_day date,
	task_deadline_time time, -- Jeśli user nie poda to pole jest puste
	task_desc text,
	task_status set ('TO DO', 'DONE') default 'TO DO',
	FOREIGN KEY (task_creator) REFERENCES Users (login)
);


create table if not exists Meetings(
	meeting_id int primary key not null auto_increment,
	meeting_creator varchar(50) not null,
	meeting_name tinytext not null,
	meeting_desc text,
	meeting_date date,
	meeting_time time,
	meeting_place varchar(50),
	foreign key (meeting_creator) references Users (login)
);



-- Dodawanie danych do tabel
insert into Users (login,password,signup_date)
values
('mareczek123','WinogradyMCG','2017-12-10 12:34:54'),
('Mario','qazwsx','2015-10-09 17:14:14'),
('greg','tommy','2012-01-14 11:06:25'),
('DarioX23','Polska123','2016-05-10 17:14:14'),
('login123','haslo321','2011-04-30 15:48:55'),
('pancernik','lufa123','2014-02-03 23:32:12'),
('dell','utf8@sd','2000-10-24 22:35:12'),
('apple','haskell<3','1995-08-12 13:24:44'),
('linuks','ubuntu','2012-03-14 19:26:37'),
('radas','bradas','2013-09-22 11:05:03')
;



insert into Tasks (task_creator, task_name, task_deadline_day, task_deadline_time,task_desc,task_status)
values
('greg','Zrobic pranie','2017-11-22',NULL,'Wyprac wszystkie ubrania','DONE'),
('mareczek123','Kupic pilke','2017-10-17','17:00:00','Do pilki noznej','DONE'),
('login123','Nauczyc sie na egzamin','2017-11-05','20:30:00','Egzamin z MAD-ów.','DONE'),
('pancernik','Zrobic baze w SQL','2017-05-05',NULL,'Na projekt z TAS-ów','TO DO'),
('dell','Przeniesc komputer','2017-10-04',NULL,'Z dolu na gore','DONE'),
('linuks','Nauczyc sie dodawac','2008-04-02','14:00:00',NULL,'TO DO'),
('apple','Dodac dane do tabel','2017-11-30',NULL,'Tabele A I B','DO'),
('Mario','Usunac dane z wszystkich dysków','2018-02-14','06:00:00','Na obu dyskach.','TO DO'),
('apple','Skoczyc w prawo','2011-01-08',NULL,'A nie w lewo!','DONE'),
('greg','Podskoczyc dwa razy','2017-11-22',NULL,'Skakac tylko w miejscu.','TO DO')
;


insert into Meetings (meeting_creator, meeting_name, meeting_desc, meeting_date,meeting_time, meeting_place)
values
('DarioX23','Mecz 5v5',NULL,'2018-02-02','18:00:00','Hala UAM na Młyńskiej koło Sądu'),
('greg','Spotkanie biznesowe','Omowienie cech produktu i ceny','2018-09-05','12:45:00','Firma Grega'),
('apple','Omowienie nowej wersji MacOS','Wersja 1.0','2016-02-02','16:30:15','WMI UAM A1-17'),
('pancernik','Seminarium dyplomowe','Grupa C1','2017-12-02','11:30:30','WMI UAM A2-3'),
('linuks','Wspolne kompilowanie jadra','Przed sptkaniem pobrac repo z githuba!','2017-12-31','23:30:00','Dom linuksa'),
('radas','Przygotowanie przed egzaminem z WRP','Dział 2','2017-01-30','12:00:00','Aula B WMI UAM')
;
