/*Aidan Zamboni
Script 11, Function 2
12/6/2018
Function finds venues that are open during the time searched for.*/

Use AID2123146
Go

Drop function if exists fnVenueSearch;
Go

Create function fnVenueSearch
	(@TournamentStartTime time,
	 @TournamentEndTime time)
	Returns table
Return
(
	Select VenueName, Convert(varchar, VenueOpenTime, 8) as OpenTime, Convert(varchar, VenueCloseTime, 8) as CloseTime,
		   VenueAddress, VenueCity, VenueState
	From Venue
	Where VenueOpenTime < @TournamentStartTime and VenueCloseTime > @TournamentEndTime
);

Go
Select * from dbo.fnVenueSearch('08:00:00', '12:00:00') order by OpenTime, CloseTime;
Select * from dbo.fnVenueSearch('16:00:00', '22:00:00') order by OpenTime, CloseTime;
