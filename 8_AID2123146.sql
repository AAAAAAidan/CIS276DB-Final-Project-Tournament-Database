/*Aidan Zamboni
Script 8, Stored Procedure 1
12/6/2018
Procedure to add a new tournament row to the Tournament table.
An error is thrown if the name is taken.*/

Use AID2123146
Go

Drop proc if exists spInsertTournament
Go

Create proc spInsertTournament
	@TournamentID int,
	@TournamentName varchar(50),
	@TournamentEvent varchar(50),
	@TournamentStartDate smalldatetime,
	@TournamentFrequency varchar(50),
	@VenueID int,
	@OrganizerID int
As

If not exists(Select * from Tournament where TournamentName = @TournamentName)
	Insert into Tournament
	Values(@TournamentID, @TournamentName, @TournamentEvent, @TournamentStartDate, 
		   @TournamentFrequency, @VenueID, @OrganizerID)
Else
	Throw 50011, 'That name is taken', 1;
Go

Begin try
	Exec spInsertTournament 16, 'Unused Name', 'Basketball', '2018-12-12 12:12:12', 'Monthly', 01, 01
End try

Begin catch
	Print 'An error occurred.';
	If Error_Number() > 50000
		Print 'Message: ' + Convert(varchar, Error_message());;
End catch;
