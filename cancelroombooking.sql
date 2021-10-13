set serveroutput on;
set verify off;

declare 
 
	cbtid int:= &TRid;
	rettk number;
	
begin 
	
	rettk := refund(cbtid);
	DBMS_OUTPUT.PUT_LINE('The refund amount is '||rettk);
	returnRoom(cbtid);
	
end; 
/