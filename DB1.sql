
drop table room cascade constraint;
drop table hotel cascade constraint;
drop table book_schedule cascade constraint;
drop table book_transactions cascade constraint;

clear screen;



create table room(
	rid int not null,
	rname varchar2(20),
	primary key(rid)
	);
drop sequence r_seq;
create sequence r_seq start with 1 increment by 1 nomaxvalue; 



create table book_schedule(
	bsid int not null,
	bstime varchar2(15),
	bsdatefrom varchar2(15),
	bsdateto varchar2(15),
	rid int,
	primary key(bsid),
	foreign key(rid) references room(rid)
	);
drop sequence bs_seq;
create sequence bs_seq start with 1 increment by 1 nomaxvalue; 



create table hotel(
	hid int not null,
	hname varchar2(15),
	rid int,
	bsid int,
	avail int,
	total_room int,
	hprice int,
	primary key(hid),
	foreign key(rid) references room(rid),
	foreign key (bsid) references book_schedule(bsid)
	);
	
drop sequence h_seq;
create sequence h_seq start with 1 increment by 1 nomaxvalue; 

create table book_transactions(
        btid int not null ,
		bsid int,
		rid int ,
		hid int,
		btname varchar2(20),
		btphone varchar2(20),
		btquantity int ,
		btamount int,
        primary key(btid),
	    foreign key(rid) references room(rid),
	    foreign key(bsid) references book_schedule(bsid),
	    foreign key(hid) references hotel(hid)
	  ); 
	

drop sequence bt_seq;
create sequence bt_seq start with 1 increment by 1 nomaxvalue; 

insert into room(rid,rname) values(r_seq.nextval,'Super Deluxe Room');
insert into room(rid,rname) values(r_seq.nextval,'Super king Room');
insert into room(rid,rname) values(r_seq.nextval,'Super Queen Room');
insert into room(rid,rname) values(r_seq.nextval,'Double King Room'); 


insert into book_schedule(bsid,bstime,bsdatefrom,bsdateto,rid) values(bs_seq.nextval,'1:00','11-05-2020','13-05-2020',1);
insert into book_schedule(bsid,bstime,bsdatefrom,bsdateto,rid) values(bs_seq.nextval,'3:00','15-06-2020','16-06-2020',2);
insert into book_schedule(bsid,bstime,bsdatefrom,bsdateto,rid) values(bs_seq.nextval,'1:00','05-05-2020','09-05-2020',3);
insert into book_schedule(bsid,bstime,bsdatefrom,bsdateto,rid) values(bs_seq.nextval,'1:00','9-07-2020','13-07-2020',4);

insert into hotel(hid,hname,avail,total_room,hprice,rid,bsid) values(h_seq.nextval,'Oasis Inn',12,13,4500,1,1);
insert into hotel(hid,hname,avail,total_room,hprice,rid,bsid) values(h_seq.nextval,'Grand President',12,13,6000,2,2);
insert into hotel(hid,hname,avail,total_room,hprice,rid,bsid) values(h_seq.nextval,'Swissotel',12,13,3500,3,3);
insert into hotel(hid,hname,avail,total_room,hprice,rid,bsid) values(h_seq.nextval,'Hotel Majessty',12,13,4800,4,4);


insert into book_transactions(btid, bsid, rid, hid, btname, btphone, btquantity, btamount) values (bt_seq.nextval, 1, 1, 1, 'Inte', '089893262', 2, 2000);
insert into book_transactions(btid, bsid, rid, hid, btname, btphone, btquantity, btamount) values (bt_seq.nextval, 2,2, 2, 'Evan', '8907662', 1, 1000);
insert into book_transactions(btid, bsid, rid, hid, btname, btphone, btquantity, btamount) values (bt_seq.nextval,  3,3, 3, 'Ebrahim', '7809262', 3, 3000);

	
commit;