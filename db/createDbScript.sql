-- Maybe TODO: Triggery, zastępujące checki z T-SQL

-- Usun baze danych, jesli juz taka istnieje
DROP DATABASE IF EXISTS `tas-calendar`;

-- Stworz baze danych
CREATE DATABASE `tas-calendar` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tas-calendar`;

-- Daj rootowi dostep do bazy
-- GRANT ALL ON `TAS-2`.* TO 'root'@'localhost';

-- Tworzenie tabelek od razu z kluczami obcymi.
-- 1. Users
create table if not exists Users(
	login varchar(50) primary key not null,
	password varchar(50) not null,
	signup_date datetime not null,
	avatar varchar(100) not null -- Ścieżka do awatara.
);
/*
-- 2. Groups - grupy użytkowników, tak aby dany użytkownik nie mógł przeglądać zadań i spotkań, które nie są udostępnione grupie, do której on nie należy.
-- Użytkownik może zostać zaproszony do zadania lub spotkania nie będąc w danej grupie.
-- Użytkownika można też dodać do danej grupy.
create table Groups(
	group_id int primary key not null auto_increment, 
	group_name tinytext not null,
	group_desc text,
)

-- 3. Groups_Invitations 
create table Groups_Invitations(
	groupInv_id int primary key not null auto_increment,
	group_inviter  varchar(50) not null, -- kto zaprasza
	GI_group_id int not null, -- do jakiej grupy zaprasza
	pot_memb varchar(50) not null, -- kogo zaprasza
	taskInv_status set('accepted','rejected','seen','sent') not null default 'sent',
	foreign key (TI_task_id) references Tasks (task_id), 
	foreign key (pot_exec) references Users (login),
	foreign key (task_inviter) references Users (login)
)

-- 4. Users_Group - informacje do których grup należy użytkownik
-- Nie mozna zostac zapisanym dwa razy do tej samej grupy, wiec kluczem glownym moze byc
-- para (UG_group_id,group_member).
create table Users_Groups(
	UG_group_id int not null, 
	group_member int not null,
	foreign key (UG_group_id) references Groups (group_id),
	foreign key (group_member) references Users (login),
	primary key (UG_group_id,group_member)
)
*/
-- 5. Tasks
create table if not exists Tasks(
	task_id int primary key not null auto_increment,
	task_creator varchar(50) not null, -- Twórca danego zadania
	task_name tinytext not null,
	task_deadline_day date,
	task_deadline_time time, -- Jeśli user nie poda to pole jest puste
	task_desc text,
	task_status set ('TO DO', 'DOING', 'DONE') default 'TO DO',
	FOREIGN KEY (task_creator) REFERENCES Users (login)
);

-- 6. TasksUsers - Wykonawcy danego zadania
create table if not exists Tasks_Execs(
	TU_task_id int not null,
	task_exec varchar(50) not null,
	foreign key (TU_task_id) references Tasks (task_id),
	foreign key (task_exec) references Users (login),
	primary key (TU_task_id,task_exec)
);

-- 7. TasksInvitations - zaproszenia do zadan
create table if not exists Tasks_Invitations(
	taskInv_id int primary key not null auto_increment,
	task_inviter varchar(50) not null, -- kto zaprasza
	TI_task_id int not null, -- do jakiego zadania
	pot_exec varchar(50) not null, -- kogo zaprasza
	taskInv_status set('accepted','rejected','seen','sent') not null default 'sent',
	foreign key (TI_task_id) references Tasks (task_id), 
	foreign key (pot_exec) references Users (login),
	foreign key (task_inviter) references Users (login)
);

-- 8. Meetings
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

-- 9. MeetingsUsers - uczestnicy spotkania
create table if not exists Meetings_Participants(
	MU_meeting_id int not null,
	meeting_participant varchar(50) not null,
	foreign key (MU_meeting_id) references Meetings (meeting_id),
	foreign key (meeting_participant) references Users (login),
	primary key (MU_meeting_id,meeting_participant)
);

-- 10. MeetingInvitations - zaproszenia do spotkan
create table if not exists Meetings_Invitations(
	meetingInv_id int primary key not null auto_increment, 
	meeting_inviter varchar(50) not null,
	MI_meeting_id int not null, -- do jakiego spotkania
	pot_part varchar(50) not null, -- kogo zaprasza
	meeting_status set('accepted','rejected','interested','seen','sent') not null default 'sent',
	foreign key (MI_meeting_id) references Meetings (meeting_id),
	foreign key (pot_part) references Users (login),
	foreign key (meeting_inviter) references Users (login)
);


-- Dodawanie danych do tabel
insert into Users (login,password,signup_date,avatar)
values
('mareczek123','WinogradyMCG','2017-12-10 12:34:54','avatars/mareczek123_64x64.png'),
('Mario','qazwsx','2015-10-09 17:14:14','avatars/Mario_64x64.png'),
('greg','tommy','2012-01-14 11:06:25','avatars/greg_64x64.png'),
('DarioX23','Polska123','2016-05-10 17:14:14','avatars/DarioX23_64x64.png'),
('login123','haslo321','2011-04-30 15:48:55','avatars/login123_64x64.png'),
('pancernik','lufa123','2014-02-03 23:32:12','avatars/pancernik_64x64.png'),
('dell','utf8@sd','2000-10-24 22:35:12','avatars/dell_64x64.png'),
('apple','haskell<3','1995-08-12 13:24:44','avatars/apple_64x64.png'),
('linuks','ubuntu','2012-03-14 19:26:37','avatars/linuks_64x64.png'),
('radas','bradas','2013-09-22 11:05:03','avatars/radas_64x64.png')
;


/*
insert into Groups (group_name,group_desc)
values
('Kopacze','Pilkarze'),
('Admini',NULL),
('Zabki','Koło przyjaciół żab'),
('Sloniki','Sloniki <3'),
('Wikipedysci','Jak w nazwie'),
('Projektanci','Projektanci linuksa')

insert into Groups_Invitations(group_inviter, GI_group_id, pot_memb,taskInv_status)
values
('1','mareczek123'),
('2','apple'),
('1','DarioX23'),
('6','mareczek123'),
('1','mareczek123'),
('1','mareczek123'),
('1','mareczek123'),

insert into Users_Groups (UG_group_id,group_member)
values
('1','mareczek123'),
('2','apple'),
('1','DarioX23'),
('6','mareczek123'),
('1','mareczek123'),
('1','mareczek123'),
('1','mareczek123'),
*/

-- Domyślnie wykonawca zadania jest jego tworca, ale jesli tworca nie chce tego zadania robic to moze sie z niego wypisac
insert into Tasks (task_creator, task_name, task_deadline_day, task_deadline_time,task_desc,task_status)
values
('greg','Zrobic pranie','2017-11-22',NULL,'Wyprac wszystkie ubrania','DOING'),
('mareczek123','Kupic pilke','2017-10-17','17:00:00','Do pilki noznej','DONE'),
('login123','Nauczyc sie na egzamin','2017-11-05','20:30:00','Egzamin z MAD-ów.','DONE'),
('pancernik','Zrobic baze w SQL','2017-05-05',NULL,'Na projekt z TAS-ów','TO DO'),
('dell','Przeniesc komputer','2017-10-04',NULL,'Z dolu na gore','DONE'),
('linuks','Nauczyc sie dodawac','2008-04-02','14:00:00',NULL,'TO DO'),
('apple','Dodac dane do tabel','2017-11-30',NULL,'Tabele A I B','DOING'),
('Mario','Usunac dane z wszystkich dysków','2018-02-14','06:00:00','Na obu dyskach.','TO DO'),
('apple','Skoczyc w prawo','2011-01-08',NULL,'A nie w lewo!','DONE'),
('greg','Podskoczyc dwa razy','2017-11-22',NULL,'Skakac tylko w miejscu.','TO DO')
;

insert into Tasks_Execs (TU_task_id,task_exec)
values
-- Twórcy automatycznie przypisani do zadań
('1','greg'),
('2','mareczek123'),
('3','login123'),
('4','pancernik'),
('5','dell'),
('6','linuks'),
('7','apple'),
-- Twórca zadania 8 nie chce go wykonywać.
('9','apple'),
('10','greg'),

-- Zaproszeni, którzy zaakceptowali zaproszenie
('8','DarioX23'),
('8','radas'),
('6','dell'),
('1','apple'),
('1','linuks')
;

insert into Tasks_Invitations (TI_task_id, task_inviter, pot_exec, taskInv_status)
values
('3','login123','pancernik','sent'),
-- Mario zaprosil DarioX23, bo sam nie chce wykonywac zadania, ktore stworzyl.
('8','Mario','DarioX23','accepted'),
('8','DarioX23','radas','accepted'),
('6','linuks','dell','accepted'),
('1','greg','apple','accepted'),
('1','greg','linuks','accepted'),
('6','linuks','pancernik','seen'),
('3','login123','greg','rejected')
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

insert into Meetings_Participants (MU_meeting_id, meeting_participant)
values
-- Uczestnicy dodani automatycznie
('1','DarioX23'),
('2','greg'),
('3','apple'),
('4','pancernik'),
('5','linuks'),
('6','radas'),
-- Uczestnicy zaproszeni
('1','Mario'),
('1','mareczek123'),
('1','login123')
;

insert into Meetings_Invitations (meeting_inviter,MI_meeting_id,pot_part,meeting_status)
values
('DarioX23','1','mareczek123','accepted'),
('DarioX23','1','Mario','accepted'),
('DarioX23','1','login123','accepted'),
('DarioX23','1','apple','seen'),
('DarioX23','1','dell','rejected'),
('greg','2','apple','sent'),
('pancernik','4','radas','seen'),
('radas','6','DarioX23','rejected')
;

-- Pokaz tabele
select * from Users;
select * from Tasks;
select * from Tasks_Execs;
select * from Tasks_Invitations;
select * from Meetings;
select * from Meetings_Participants;
select * from Meetings_Invitations;