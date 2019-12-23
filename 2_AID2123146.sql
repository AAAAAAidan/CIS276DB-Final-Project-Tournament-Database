/*Aidan Zamboni
Script 2, User Login
12/6/2018
Creates a user with access to select and update from the Organizer table.*/

Use AID2123146
Go

Create login dbAID with password = 'AID', default_database = AID2123146;
Go

Create user dbAID;
Go

Create role OrganizerMaintenance;

Grant select, update
On Organizer
To OrganizerMaintenance;

Alter role OrganizerMaintenance add member dbAID;
Go

/*
Drop login dbAID;
Drop user dbAID;
Drop role OrganizerMaintenance;
*/

--dbAID can now use queries like the one below.
--Update Organizer set OrganizerPhone = 'Unavailable' where OrganizerID = 02
