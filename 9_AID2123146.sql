/*Aidan Zamboni
Script 9, Stored Procedure 2
12/6/2018
This procedure begins a transaction that deletes a tournament with a specified name.
An error is thrown and the transaction is rolled back if multiple matching tournaments are found.*/

Use AID2123146
Go

Drop procedure if exists spDeleteTournament;
Drop table if exists TempTournament;
Select * into TempTournament from Tournament;
Go

Create procedure spDeleteTournament
	@TournamentName varchar(50)
As

Begin tran;
Delete TempTournament
Where TournamentName = @TournamentName

If @@rowcount > 1
	Begin
		Rollback tran;
		Throw 500011, 'Multiple tournaments found.', 1;
	End;
Else
	Begin
		Commit tran;
		Print 'Deletion committed to the database.';
	End;
Go

Begin try
	Exec spDeleteTournament 'The Basement Meet'
End try

Begin catch
	Print 'An error occurred.';
	If Error_Number() > 50000
		Print 'Message: ' + Convert(varchar, Error_message());;
End catch;
