 set serveroutput on;
set verify off;

create or replace trigger trigger_hotel
after insert or update on hotel
begin

	dbms_output.put_line('Information has been changed');
	
end;
/


create or replace trigger trigger_transaction
before insert on book_transactions
for each row
begin

	select bt_seq.nextval into :new.btid from dual;
	
end;
/

select * from dual ;