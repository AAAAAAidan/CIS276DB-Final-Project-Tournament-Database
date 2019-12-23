/*Aidan Zamboni
Script 7, View 4
12/6/2018
Creates a view that uses a subquery to find the soonest tournaments by start date.*/

Use AID2123146
Go
Drop view if exists vwNextTournament
Go
Create view vwNextTournament as

Select TournamentID, TournamentName, TournamentStartDate, VenueName

From vwTournamentList

Where TournamentStartDate >= 
	(Select Min(TournamentStartDate)
	From Tournament
	Where TournamentStartDate > GetDate())

Group by TournamentID, TournamentName, TournamentStartDate, VenueName

Go
Select * from vwNextTournament
