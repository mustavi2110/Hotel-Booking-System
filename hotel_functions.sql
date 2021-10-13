set serveroutput on;
set verify off;

create or replace function totBill(fhid in out int, nroom in out int)
	return number is
	
	price number;
	error exception;
	
begin
	
	select hprice into price from hotel@site_link2 where fhid  = hotel.hid;
		
	return price*nroom;
	exception when no_data_found then 
        dbms_output.put_line('Information was not available'); 
		
end totBill;
/


create or replace function refund(fbtid in out int)
	return number is
	
	price number;
	error exception;
	
begin
	
	select btamount into price from book_transactions@site_link2 where book_transactions.btid = fbtid;
		
	return price;
	exception when no_data_found then 
		dbms_output.put_line('Information was not available'); 
		when others then
        dbms_output.put_line('Error!'); 

	
	
end refund;
/