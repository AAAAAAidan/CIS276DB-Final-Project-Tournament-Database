/*Aidan Zamboni
Script 3, Trigger
12/6/2018
Trigger activates upon deletion of a table, where it archives the deleted table.*/

Use AID2123146
Go

Drop trigger if exists Tournament_DELETE
Go

Drop table if exists TempTournament;
Select * into TempTournament from Tournament;

Drop table if exists TournamentArchive;
Create table TournamentArchive (TournamentID int, TournamentName varchar(50), TournamentEvent varchar(50), 
			 TournamentStartDate smalldatetime, TournamentFrequency varchar(50), VenueID int, OrganizerID int)
Go

Create trigger Tournament_DELETE
	On TempTournament
	After delete
As
Insert into TournamentArchive
	(TournamentID, TournamentName, TournamentEvent, TournamentStartDate, 
		TournamentFrequency, VenueID, OrganizerID)
	Select TournamentID, TournamentName, TournamentEvent, TournamentStartDate, 
		TournamentFrequency, VenueID, OrganizerID
	From Deleted
Print 'The deleted record has been archived.'
Select * from TournamentArchive
Go

Delete TempTournament where VenueID = 10
