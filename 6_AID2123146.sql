/*Aidan Zamboni
Script 6, View 3
12/6/2018
Creates view listing of sponsor with their asssociated Organizers and Venues.
The case deteremines how that sponsor gains their ad revenue.*/

Use AID2123146
Go
Drop view if exists vwSponsorList
Go
Create view vwSponsorList as

Select SponsorName, Organizer.OrganizerID, OrganizerName, Venue.VenueID, VenueName, 
	Case
		When SponsorDescription is null then 'None'
		When SponsorDescription = 1 then 'Shoutout'
		When SponsorDescription = 2 then 'Advertisement'
		Else 'Mass hypnotism'
	End as SponsorDescription

From Sponsor
	Join Venue on Sponsor.VenueID = Venue.VenueID
	Join Organizer on Sponsor.OrganizerID = Organizer.OrganizerID

Go
Select * from vwSponsorList order by OrganizerID, VenueID