/*Aidan Zamboni
Script 10, Function 1
12/6/2018
Function matches the specified tournament with the location of its venue.*/

Use AID2123146
Go

Drop function if exists fnLocation;
Go

Create function fnLocation
	(@TournamentName varchar(50))
	Returns varchar(50)
Begin
	Return 
	(
		Select VenueName + ', ' + VenueAddress + ', ' + VenueCity + ', ' + VenueState as [Tournament Location]
		From Venue
		Where VenueID = (Select VenueID from Tournament where TournamentName = @TournamentName)
	);
End;
Go

Print 'Location of tournament: ' + dbo.fnLocation('Thrilling Thursdays #2')