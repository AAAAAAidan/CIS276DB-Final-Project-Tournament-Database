/*Aidan Zamboni
Script 5, View 2
12/6/2018
Creates a view of a summary query showing how many tournaments exist for each event, as well as the average, highest, and lowest
of the registrations fees.*/

Use AID2123146
Go
Drop view if exists vwTournamentListSummary
Go
Create view vwTournamentListSummary as

Select TournamentEvent, Count(*) as TournamentCount, '$' + Cast(Avg(Convert(money, RegistrationFee, 1)) as varchar(50)) as AvgCost,
	   '$' + Cast(Min(Convert(money, RegistrationFee, 1)) as varchar(50)) as MinCost,
	   '$' + Cast(Max(Convert(money, RegistrationFee, 1)) as varchar(50)) as MaxCost

From vwTournamentList

Group by TournamentEvent

Go
Select * from vwTournamentListSummary order by TournamentCount desc