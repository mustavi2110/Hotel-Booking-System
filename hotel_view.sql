
create or replace view Rooms(Room_Id,Room_Type) as select rid,rname from room@site_link2;



create or replace view RoomScheduleTransaction(Room_Type,Hotel_Name,Room_Availability,Room_Price,Checkin_Date,Checkout_date)
as
 select r.rname,h.hname,h.avail,h.hprice,b.bsdatefrom,b.bsdateto from room@site_link2 r , hotel@site_link2 h , book_schedule@site_link2 b
 where r.rid=h.rid and r.rid=b.rid ;
 
 
 select * from RoomScheduleTransaction;