set serveroutput on;
set verify off;


create or replace procedure makePayment(phid in out int, nroom in out int)
	is
	
	ptname  varchar(20);
	ptphone varchar2(20);
	pbtid int;
	prid int;
	pbsid int;
	pbtamount int;
	hotelPrice number;
    	
	error exception; 
	
begin
	
	
	select rid,bsid,hprice into prid,pbsid,hotelPrice from hotel@site_link2  where phid=hotel.hid;
	 pbtamount := nroom*hotelPrice;
	insert into book_transactions@site_link2(10,bsid,rid,hid,btname,btphone,btquantity,btamount) 
	                                 values (pbtid, pbsid, prid,phid ,ptname, ptphone, nroom, pbtamount);
	
	commit; 
	exception when no_data_found then 
		dbms_output.put_line('Information was not available');
	when others then
        dbms_output.put_line('Error in make payment'); 
		 
		

end makePayment; 

/ 

create or replace procedure updateRoom(phid in out int, num in out int)
	is
	
	availRoom int;
	error exception;

begin

	select avail into availRoom from hotel@site_link2 where phid = hotel.hid;

	if availRoom-num >= 0 then
		availRoom := availRoom-num;
		update hotel@site_link2 set avail = availRoom where phid = hotel.hid;
		commit;
	elsif availRoom-num < 0 then
		 raise error;
		
	end if;
	
	exception when no_data_found then 
		dbms_output.put_line('No such bus!'); 
		when error then
		dbms_output.put_line('Not enough seats available');
		when others then
        dbms_output.put_line('Error at update!'); 
		
        

end updateRoom;
/





create or replace procedure returnRoom(pbtid in out int)
	is
	
	retroom int;
	phid int;
	error exception;

begin

	select btquantity, hid into retroom, phid from book_transactions@site_link2 where book_transactions.btid = pbtid;
	update hotel@site_link2 set avail = avail +retroom  where phid = hotel.hid;
	delete from book_transactions@site_link2 where book_transactions.btid = pbtid;
	commit;
	
	

end returnRoom;
/
