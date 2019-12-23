/*Aidan Zamboni
Script 4, View 1
12/6/2018
Script creating a view useful for viewing the tournaments in the database, along with associated details 
among the database's tables, such as location, cost, and organizer name.*/

Use AID2123146
Go
Drop view if exists vwTournamentList
Go
Create view vwTournamentList as

Select Tournament.TournamentID, TournamentName, TournamentStartDate, TournamentEvent, TournamentFrequency, 
	   '$' + Cast(RegistrationFee as varchar(50)) as RegistrationFee, OrganizerName, Organizer.OrganizerID, VenueName, 
	   VenueAddress + ', ' + VenueCity + ', ' + VenueState as Location

From Registration
	Join Tournament on Registration.TournamentID = Tournament.TournamentID
	Join Venue on Tournament.VenueID = Venue.VenueID
	Join Organizer on Tournament.OrganizerID = Organizer.OrganizerID

Go
Select * from vwTournamentList order by TournamentStartDate