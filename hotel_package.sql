create or replace package searchAvailableRoom as 
	
	
	procedure isAvailableRoom(proom in out room.rname%type
	                        ,checkin in out book_schedule.bsdatefrom%type,checkout in out book_schedule.bsdateto%type,
							 checktime in out book_schedule.bstime%type);
end searchAvailableRoom;
/


create or replace package body searchAvailableRoom as
 
	procedure isAvailableRoom(proom in out room.rname%type,checkin in out book_schedule.bsdatefrom%type,
	                         checkout in out book_schedule.bsdateto%type,checktime in out book_schedule.bstime%type)
		is 
		
		
		cnt number := 0;

	begin
		
		
		for i in ( select hid,hname,avail,hprice from hotel where avail>0) loop
		  
		    for j in (select bsid,bstime,bsdatefrom,bsdateto from book_schedule where bstime=checktime and bsdatefrom =checkin and bsdateto=checkout) loop
		  
		      	 cnt := cnt+1 ;
				 
				 if(cnt<1) then
                    dbms_output.put_line( j.bsid || '	 ' || j.bstime || '	  ' || j.bsdatefrom || '  ' || j.bsdateto );
				 end if ;
			    
		    end loop;
			 
			 
		end loop; 
		
			
	end isAvailableRoom;
 

end searchAvailableRoom; 
/


		

			   
			 