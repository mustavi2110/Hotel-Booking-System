set serveroutput on;
set verify off;

--horizontal fragment

        select * from hotel@site_link2 where hprice > 2000 and hprice<4000 ;


--vertical fragment

         select btid,btname,btamount from book_transactions@site_link2 ; 


         select r.rid,r.rname,h.hprice,h.hid,h.avail from room@site_link2 r  join hotel@site_link2 h  on r.rid=h.rid ;
		  
		  commit ;

