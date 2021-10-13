set serveroutput on;
set verify off;


	
	
begin 
	
	DBMS_OUTPUT.PUT_LINE('TR ID' ||'        '||'Name'||'        '||'Phone'||'        '||'Quantity'||'        '||'Amount');
	for i in (select btid,btname,btphone,btquantity,btamount  from book_transactions@site_link2) loop
	
		DBMS_OUTPUT.PUT_LINE(i.btid ||'        '||i.btname||'        '||i.btphone||'        '||i.btquantity||'        '||i.btamount);
	end loop;
	
	
end; 
/