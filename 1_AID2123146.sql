/*Aidan Zamboni
Script 1
12/6/2018
Script creates database, tables, columns, rows, keys, indexes, and constraints.*/
Use master
Go

If DB_ID('AID2123146') is not null
	Drop database AID2123146
Go

Create database AID2123146
Go

Use AID2123146
Go

Create table Registration(
	TournamentID int not null,
	RegistrationFee money not null default (0.00) check (RegistrationFee >= 0),
	RegistrationDueDate smalldatetime
)
Go

Create table Tournament(
	TournamentID int not null,
	TournamentName varchar(50) not null,
	TournamentEvent varchar(50) not null,
	TournamentStartDate smalldatetime not null,
	TournamentFrequency varchar(50),
	OrganizerID int not null,
	VenueID int not null
	Constraint PK_TournamentID primary key clustered (
		TournamentID asc
	)
)
Go

Create table Venue(
	VenueID int not null,
	VenueAddress varchar(50) not null,
	VenueName varchar(50) not null,
	VenueOpenTime time not null,
	VenueCloseTime time not null,
	VenueCity varchar(50) not null,
	VenueState varchar(50) not null,
	VenueZipCode int not null
	Constraint PK_VenueID primary key clustered (
		VenueID asc
	)
)
Go

Create table Organizer(
	OrganizerID int not null,
	OrganizerPhone varchar(50),
	OrganizerName varchar(50) not null
	Constraint PK_OrganizerID primary key clustered (
		OrganizerID asc
	)
)
Go

Create table Sponsor(
	OrganizerID int,
	VenueID int,
	SponsorName varchar(50) not null,
	SponsorDescription int
)
Go

Insert Registration (TournamentID, RegistrationFee, RegistrationDueDate) values
(15, 1.00, Cast('2018-10-10 02:02:02' as smalldatetime)),
(01, 2.00, null),
(03, 3.00, Cast('2018-11-01 13:30:00' as smalldatetime)),
(02, 4.00, null),
(05, 5.00, null),
(10, 6.00, Cast('2018-03-02 23:22:11' as smalldatetime)),
(06, 7.00, null),
(07, 8.00, null),
(08, 9.00, Cast('2018-12-25 19:19:19' as smalldatetime)),
(04, 100.00, Cast('2018-04-03 19:00:00' as smalldatetime)),
(12, 500.00, Cast('2018-11-11 11:00:00' as smalldatetime)),
(09, 1000.00, null),
(13, 0.00, null),
(14, 9.99, null),
(11, 0.00, Cast('2018-02-01 23:22:11' as smalldatetime))
Go

Insert Tournament (TournamentID, TournamentName, TournamentEvent, TournamentStartDate, 
	   TournamentFrequency, OrganizerID, VenueID) values
(01, 'Manic Mondays #123', 'Alley Brawler II', Cast('2018-12-12 19:00:00' as smalldatetime), 'Weekly', 07, 01),
(02, 'Terrifying Tuesdays #10', 'Soccer', Cast('2018-07-08 08:00:00' as smalldatetime), 'Semi-weekly', 08, 04),
(03, 'Wicked Wednesdays #1', 'Basketball', Cast('2018-11-01 13:30:00' as smalldatetime), 'Monthly', 07, 02),
(04, 'National Tourbament 2018', 'Soccer', Cast('2018-04-04 19:00:00' as smalldatetime), 'Yearly', 04, 02),
(05, 'Online Ultra #30', 'Alley Brawler II', Cast('2018-08-08 19:00:00' as smalldatetime), null, 10, 10),
(06, 'Freaky Fridays #321', 'Soccer', Cast('2018-12-12 16:00:00' as smalldatetime), 'Weekly', 09, 01),
(07, 'Super Special Tournament', 'Alley Brawler II', Cast('2018-01-01 01:01:01' as smalldatetime), 'Yearly', 05, 03),
(08, 'The Basement Meet', 'Ping Pong', Cast('2018-12-26 19:19:19' as smalldatetime), null, 06, 05),
(09, 'Super Special Awesome #12345', 'Alley Brawler II', Cast('2018-04-30 10:20:30' as smalldatetime), 'Weekly', 04, 06),
(10, 'Thrilling Thursdays #2', 'Ping Pong', Cast('2018-03-03 23:22:11' as smalldatetime), 'Semi-monthly', 07, 07),
(11, 'One-Event Wonder', 'Basketball', Cast('2018-02-02 23:22:11' as smalldatetime), null, 03, 08),
(12, 'Saturated Saturdays #99999999', 'Ping Pong', Cast('2018-11-11 11:00:00' as smalldatetime), 'Weekly', 08, 09),
(13, 'My First Tournament #1', 'Soccer', Cast('2018-10-10 00:11:00' as smalldatetime), 'Semi-weekly', 02, 02),
(14, 'The Sunniest Sunday', 'Ping Pong', Cast('2018-09-09 00:00:11' as smalldatetime), 'Yearly', 09, 08),
(15, 'Come Back in Two Years', 'Alley Brawler II', Cast('2018-10-11 02:02:02' as smalldatetime), 'Semi-yearly', 01, 08)
Go

Insert Venue (VenueID, VenueAddress, VenueName, VenueOpenTime, VenueCloseTime, VenueCity, VenueState, VenueZipCode) values
(01, 'Somewhere', 'Fun House', Cast('07:00:00' as time), Cast('22:00:00' as time), 'Surprise', 'AZ', 11111),
(02, 'Elsewhere', 'Pterodactyl Park', Cast('00:00:00' as time), Cast('23:59:59' as time), 'Buckeye', 'AZ', 22222),
(03, 'Nowhere', 'Silly Store', Cast('12:00:00' as time), Cast('13:00:00' as time), 'New York', 'NY', 33333),
(04, 'Everywhere', 'Creative Club', Cast('06:00:00' as time), Cast('18:00:00' as time), 'San Luis Obispo', 'CA', 44444),
(05, 'Here and There', 'Sports Gym', Cast('08:00:00' as time), Cast('23:00:00' as time), 'San Francisco', 'CA', 55555),
(06, 'Just There', 'Super Sports Gym', Cast('05:00:00' as time), Cast('21:00:00' as time), 'Phoenix', 'AZ', 66666),
(07, 'In Your Dreams', 'Cloudtop Resort', Cast('04:00:00' as time), Cast('14:00:00' as time), 'Juneau', 'AK', 77777),
(08, 'Here', 'Sky High Gym', Cast('02:00:00' as time), Cast('12:00:00' as time), 'Phoenix', 'AZ', 88888),
(09, 'Bottom of the Ocean', 'Underwater Gym', Cast('05:00:00' as time), Cast('20:00:00' as time), 'Honolulu', 'HI', 99999),
(10, 'Internet', 'Interesting Internet', Cast('00:00:00' as time), Cast('23:59:59' as time), 'Internet', 'Internet', 00000)
Go

Insert Organizer (OrganizerID, OrganizerPhone, OrganizerName) values
(01, '111-111-1111', 'Epic Inc.'),
(02, '222-222-2222', 'Cool Corp.'),
(03, '333-333-3333', 'John Smith'),
(04, null, 'Best Organizer'),
(05, '555-555-5555', 'He is dead, Jim!'),
(06, '666-666-6666', 'A Doctor'),
(07, '777-777-7777', 'Not an Escalator'),
(08, '888-888-8888', 'Joe Smith'),
(09, null, 'Willy Wonka'),
(10, null, 'Glass Elevator')
Go

Insert Sponsor (OrganizerID, VenueID, SponsorName, SponsorDescription) values
(01, 01, 'Buy our food', 1),
(01, 03, 'Buy our drinks', null),
(07, 04, 'Buy our cars', null),
(03, 03, 'Buy our cards', 1),
(04, 10, 'Buy our money', 2),
(01, 01, 'Buy our tech', 2),
(10, 09, 'Buy our equip', 2),
(08, 01, 'Buy our stuff', null),
(08, 09, 'Buy our other stuff', 2),
(05, 04, 'Buy our everything', 3)
Go

Create nonclustered index IX_RegistrationDueDate on Registration(
	RegistrationDueDate desc
) 
Go

Create nonclustered index IX_TournamentStartDate on Tournament(
	TournamentStartDate desc
) 
Go

Create nonclustered index IX_OrganizerID on Tournament(
	OrganizerID asc
) 
Go

Create nonclustered index IX_VenueID on Tournament(
	VenueID asc
) 
Go

Create nonclustered index IX_OrganizerID on Sponsor(
	OrganizerID asc
) 
Go

Create nonclustered index IX_VenueID on Sponsor(
	VenueID asc
) 
Go

Alter table Registration  
With nocheck 
Add constraint FK_Registration_TournamentID 
Foreign key(TournamentID)
References Tournament (TournamentID)
On update cascade
On delete cascade
Go

Alter table Registration
Check constraint FK_Registration_TournamentID
Go

Alter table Tournament  
With nocheck 
Add constraint FK_Tournament_VenueID
Foreign key(VenueID)
References Venue (VenueID)
Go

Alter table Tournament
Check constraint FK_Tournament_VenueID
Go

Alter table Tournament  
With nocheck 
Add constraint FK_Tournament_OrganizerID 
Foreign key(OrganizerID)
References Organizer (OrganizerID)
Go

Alter table Tournament
Check constraint FK_Tournament_OrganizerID
Go

Alter table Sponsor  
With nocheck 
Add constraint FK_Sponsor_VenueID
Foreign key(VenueID)
References Venue (VenueID)
Go

Alter table Sponsor
Check constraint FK_Sponsor_VenueID
Go

Alter table Sponsor  
With nocheck 
Add constraint FK_Sponsor_OrganizerID 
Foreign key(OrganizerID)
References Organizer (OrganizerID)
Go

Alter table Sponsor
Check constraint FK_Sponsor_OrganizerID
Go


Use master
Go

Alter database AP set read_write
Go
