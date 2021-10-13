set serveroutput on;
set verify off;

declare 
 
	rbhid int := &Enter_hotel_Id;
	rbrooms int := &Numberof_room;
	rbname varchar(20) := '&Guest_Name';
	rbphone varchar2(20) := '&Phone_Number';
	rbtotPrice int;
	rbbtid1 int;
	rbbtid2 int;
	rbamount int;
	
begin 
	
	rbtotPrice := totBill(rbhid,rbrooms);
	DBMS_OUTPUT.PUT_LINE('Dear guest,Your bill is  '||rbtotPrice);
	makePayment(rbhid,rbrooms);
	updateRoom(rbhid,rbrooms);
	select max(btid) into rbbtid1 from book_transactions@site_link2;
	select btid, btname, btphone, btamount into rbbtid2,rbname,rbphone,rbamount from book_transactions@site_link2 where btid = rbbtid1;
	DBMS_OUTPUT.PUT_LINE(rbbtid2||' '||rbname||' '||rbphone||' '||rbamount);
end; 
/