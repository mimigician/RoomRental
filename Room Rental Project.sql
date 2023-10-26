set pagesize 1000;
set linesize 5000;
set tab off;
set lines 256;
set trimout on;

-- LAB 01
drop table review;
drop table users;
drop table calendar;
drop table amenity;
drop table listing;
drop table host;
create table users(
    user_id integer primary key,
    user_name varchar(20),
    email varchar(30),
    user_address varchar(40),
    phone integer   --have to add multivalued
);

create table host(
    host_id integer primary key not null,
    host_name varchar(20),
    host_since date
);

create table listing(
    host_id integer not null,
    list_id integer  primary key,
    establishment_type varchar(30),
    place varchar(30),
    address varchar(30),
    foreign key(host_id) references host(host_id) on delete cascade
);

create table review(
    user_id integer not null,  -- Not null from lab 03
    list_id integer,
    review_id integer primary key,
    rating float(6)
);

--Alter table and contraint from Lab 02 and 03
alter table review add comments varchar (100);
alter table review add constraint fk_review foreign key (user_id) references users(user_id); 
alter table review add constraint fk_review2 foreign key (list_id) references listing(list_id); 

create table calendar(
    list_id integer,
    c_id integer primary key,
    check_in date,
    check_out date,
    available varchar (5) default 'Yes',
    foreign key(list_id) references listing(list_id) on delete cascade
);

create table amenity(
    list_id integer,
    wifi varchar(10),
    home_type varchar(30),
    room_type varchar(30),
    no_of_rooms number (5),
    price number(10),
    bed_type varchar(30),
    has_kitchen varchar(30),
    has_tv varchar(30),
    foreign key(list_id) references listing(list_id) on delete cascade
);

insert into users(user_id, user_name, email, phone, user_address) values (01, 'Rakib', 'rakib34216@gmail.com', '01914259744', 'House no: 48, Road: 06, Mirpur, Dhaka');
insert into users(user_id, user_name, email, phone, user_address) values (02, 'Mahin', 'mahin7773@gmail.com', '01921387773', 'Azimpur, Puran Colony, Dhaka');
insert into users(user_id, user_name, email, phone, user_address) values (03, 'Rownak', 'rownak-ul-islam@gmail.com', '01756291819', 'Rakin Society, Mirpur 13, Dhaka');
insert into users(user_id, user_name, email, phone, user_address) values (04, 'Labib', 'labibkhan@gmail.com', '01834437149', 'Tutpara, Shibbari, Khulna');
insert into users(user_id, user_name, email, phone, user_address) values (05, 'Tanim', 'tanimjalal@gmail.com', '01551815797', 'Khabashpur, Chittagong');
insert into users(user_id, user_name, email, phone, user_address) values (06, 'Shuvo', 'tarekhossain@gmail.com', '01867343022', 'Jhaugach, Feni');
insert into users(user_id, user_name, email, phone, user_address) values (07, 'Shihab', 'shihabnewaz@gmail.com', '01612201607', 'Station Road, Bogura');
insert into users(user_id, user_name, email, phone, user_address) values (08, 'Nafiul', 'nafiul@gmail.com', '01307232605', 'Ulta station Road, Bogura');
insert into users(user_id, user_name, email, phone, user_address) values (09, 'Nishat', 'nishatsithy@gmail.com', '01723812331', 'Gryffindor, Mohammadpur, Dhaka');
insert into users(user_id, user_name, email, phone, user_address) values (10, 'Waliul', 'wall-e@gmail.com', '01543255426', 'Ullapara, Sirajgonj');

insert into host (host_id, host_name, host_since) values (1001, 'Mukim', TO_DATE('03-JAN-2018', 'dd-MON-yyyy'));
insert into host (host_id, host_name, host_since) values (1002, 'Rowdra', TO_DATE('26-JAN-2018', 'dd-MON-yyyy'));
insert into host (host_id, host_name, host_since) values (1003, 'Asifur', TO_DATE('07-APR-2019', 'dd-MON-yyyy'));
insert into host (host_id, host_name, host_since) values (1004, 'Mostofa', TO_DATE('12-JAN-2022', 'dd-MON-yyyy'));
insert into host (host_id, host_name, host_since) values (1005, 'Moin', TO_DATE('23-JUN-2019', 'dd-MON-yyyy'));
insert into host (host_id, host_name, host_since) values (1006, 'Ahmed', TO_DATE('14-DEC-2017', 'dd-MON-yyyy'));
insert into host (host_id, host_name, host_since) values (1007, 'Taskin', TO_DATE('09-JUL-2019', 'dd-MON-yyyy'));
insert into host (host_id, host_name, host_since) values (1008, 'Mir', TO_DATE('22-NOV-2019', 'dd-MON-yyyy'));
insert into host (host_id, host_name, host_since) values (1009, 'Mannan', TO_DATE('27-OCT-2015', 'dd-MON-yyyy'));
insert into host (host_id, host_name, host_since) values (1010, 'Alvir', TO_DATE('10-SEP-2019', 'dd-MON-yyyy'));


insert into listing(list_id, address, establishment_type, place, host_id) values (301, 'Gulshan plaza', 'Apartment building', 'Town', 1001);
insert into listing(list_id, address, establishment_type, place, host_id) values (302, 'Kuril, Dhaka', 'Apartment building', 'Town', 1010);
insert into listing(list_id, address, establishment_type, place, host_id) values (303, 'Block: D, Bashundhara, Dhaka', 'Condo', 'Town', 1009);
insert into listing(list_id, address, establishment_type, place, host_id) values (304, 'Uttara, Dhaka', 'Apartment Building', 'Beside Lake', 1007);
insert into listing(list_id, address, establishment_type, place, host_id) values (305, 'Khan Jahan Ali Road, Sylhet', 'Commercial Building', 'Hilly Area', 1008);
insert into listing(list_id, address, establishment_type, place, host_id) values (306, 'Teligati Road, Khulna', 'Mess', 'University Area', 1001);
insert into listing(list_id, address, establishment_type, place, host_id) values (307, 'Coxs Bazar', 'Hotel', 'Beside Sea', 1005);
insert into listing(list_id, address, establishment_type, place, host_id) values (308, 'Kuakata', 'Apartment Building', 'Beside Sea', 1006);


insert into review(review_id, rating, Comments, user_id, list_id) values (100, 4.8, 'The stay was really comfortable', 01, 301);
insert into review(review_id, rating, Comments, user_id, list_id) values (101, 4.3, 'It was stinky', 04, 301);
insert into review(review_id, rating, Comments, user_id, list_id) values (102, 4.21, 'The place was clean but we were given a smaller room', 02, 302);
insert into review(review_id, rating, Comments, user_id, list_id) values (103, 4.89, 'I will recommend this place', 03, 303);
insert into review(review_id, rating, Comments, user_id, list_id) values (104, 4.76, 'The host was really friendly', 03, 301);
insert into review(review_id, rating, Comments, user_id, list_id) values (105, 4.93, 'Comfortable room with a scenic view', 05, 305);


insert into calendar(c_id, check_in, check_out, available, list_id) values (5001, TO_DATE('04-JUL-2022', 'dd-MON-yyyy'), TO_DATE('04-JUL-2022', 'dd-MON-yyyy'), 'Yes', 301);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5002, TO_DATE('05-JUL-2022', 'dd-MON-yyyy'), TO_DATE('07-JUL-2022', 'dd-MON-yyyy'), 'No', 302);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5003, TO_DATE('08-JUL-2022', 'dd-MON-yyyy'), TO_DATE('10-JUL-2022', 'dd-MON-yyyy'), 'Yes', 302);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5004, TO_DATE('07-JUL-2022', 'dd-MON-yyyy'), TO_DATE('11-JUL-2022', 'dd-MON-yyyy'), 'No', 305);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5005, TO_DATE('12-JUL-2022', 'dd-MON-yyyy'), TO_DATE('20-JUL-2022', 'dd-MON-yyyy'), 'Yes', 305);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5006, TO_DATE('17-JUL-2022', 'dd-MON-yyyy'), TO_DATE('31-JUL-2022', 'dd-MON-yyyy'), 'Yes', 307);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5007, TO_DATE('12-JUL-2022', 'dd-MON-yyyy'), TO_DATE('31-JUL-2022', 'dd-MON-yyyy'), 'Yes', 308);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5008, TO_DATE('12-JUL-2022', 'dd-MON-yyyy'), TO_DATE('31-JUL-2022', 'dd-MON-yyyy'), 'Yes', 308);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5009, TO_DATE('12-JUL-2022', 'dd-MON-yyyy'), TO_DATE('31-JUL-2022', 'dd-MON-yyyy'), 'Yes', 303);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5010, TO_DATE('10-JUL-2022', 'dd-MON-yyyy'), TO_DATE('12-JUL-2022', 'dd-MON-yyyy'), 'No', 304);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5011, TO_DATE('12-JUL-2022', 'dd-MON-yyyy'), TO_DATE('31-JUL-2022', 'dd-MON-yyyy'), 'Yes', 304);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5012, TO_DATE('12-JUL-2022', 'dd-MON-yyyy'), TO_DATE('31-JUL-2022', 'dd-MON-yyyy'), 'Yes', 306);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5013, TO_DATE('09-JUL-2022', 'dd-MON-yyyy'), TO_DATE('12-JUL-2022', 'dd-MON-yyyy'), 'No', 308);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5014, TO_DATE('15-JUL-2022', 'dd-MON-yyyy'), TO_DATE('16-JUL-2022', 'dd-MON-yyyy'), 'No', 307);
insert into calendar(c_id, check_in, check_out, available, list_id) values (5015, TO_DATE('12-JUL-2022', 'dd-MON-yyyy'), TO_DATE('14-JUL-2022', 'dd-MON-yyyy'), 'Yes', 307);



insert into amenity(wifi, home_type, room_type, no_of_rooms, price, bed_type, has_kitchen, has_tv, list_id) values ('1MBps', '5 Storied Building', 'Living', 4, 5000, 'King', 'Yes', '44 inch LED', 301);
insert into amenity(wifi, home_type, room_type, no_of_rooms, price, bed_type, has_kitchen, has_tv, list_id) values ('5MBps', '2 Storied Condo', 'Bedroom + living room', 3, 1600, 'Queen', 'Yes', '44 inch LED', 302);
insert into amenity(wifi, home_type, room_type, no_of_rooms, price, bed_type, has_kitchen, has_tv, list_id) values ('2MBps', '10 Storied Building', 'Bedroom + living room', 2, 700, 'Queen', 'No', '32 inch LED', 303);
insert into amenity(wifi, home_type, room_type, no_of_rooms, price, bed_type, has_kitchen, has_tv, list_id) values ('1MBps', '12 Storied Building', '2 Bedrooms + living room', 3, 1900, 'King', 'Yes', '32 inch LED', 305);
insert into amenity(wifi, home_type, room_type, no_of_rooms, price, bed_type, has_kitchen, has_tv, list_id) values ('20MBps', '5 Storied Apartment', 'Bedroom', 2, 550, 'Single Bed', 'No', 'No', 304); 
insert into amenity(wifi, home_type, room_type, no_of_rooms, price, bed_type, has_kitchen, has_tv, list_id) values ('20MBps', '5 Storied Apartment', '3 Bedroom', 4, 1000, 'King', 'Yes', '2 TV', 304);


desc users;
desc host;
desc listing;
desc review;
desc calendar;
desc amenity;

select * from users;
select * from host;
select * from listing;
select * from review;
select * from calendar;
select * from amenity;

----rename column
alter table amenity rename column wifi to wifi_speed;
desc amenity;
select * from amenity;

alter table amenity rename column wifi_speed to wifi;
desc amenity;
select * from amenity;

---update and delete value
update amenity set wifi = '1.5MBps' where list_id=301;
delete from amenity where list_id=302;
select * from amenity;
insert into amenity(wifi, home_type, room_type, no_of_rooms, price, bed_type, has_kitchen, has_tv, list_id) values ('5MBps', '2 Storied Condo', 'Bedroom + living room', 3, 1600, 'Queen', 'Yes', '44 inch LED', 302);

---range selection
SELECT comments,user_id FROM review
WHERE rating>=4.5 AND list_id = 301;

---order by selection
select list_id, room_type from amenity 
order by price;

--giving column different name and calculating price of two days stay
select (price*2) as two_day_price from amenity;

--pattern matching
select address, list_id from listing where address like '%Sylhet';


--Lab 04
--aggregate functions
select max(wifi) from amenity;
select min(rating) from review;
select count(c_id) from calendar;
select avg(price) from amenity;

--group by clause
select wifi,count(price) from amenity group by wifi;

--having clause
select price, count(wifi) from amenity group by price having price > 1000;

--Lab 05
--IN
select address,list_id
from listing
where establishment_type in(select establishment_type from listing where place='Town');

--UNION
select * from amenity where price>5000
UNION select * from amenity where price<1000;

--Intersect
select * from amenity 
Intersect select * from amenity where price<1000;

--Minus
select * from amenity 
Minus select * from amenity where price<1000;

--Lab 06
--simple join
select l.list_id,l.address,r.rating,r.comments
from listing l join review r
on l.list_id = r.list_id;

--natural join
select c.available
from listing l natural join calendar c
where c.check_in='08-JUL-2022' AND l.place='Town';

--inner join
select l.place
from listing l inner join review r
on l.list_id = r.list_id;

--Outer join
select h.host_name,h.host_since,l.place,l.establishment_type
from host h left outer join listing l
on h.host_id = l.host_id;
select h.host_name,h.host_since,l.place,l.establishment_type
from host h right outer join listing l
on h.host_id = l.host_id;
select l.place,c.available
from calendar c full outer join listing l
on c.list_id = l.list_id;

--nested join
select u.user_name
from review r join users u on r.user_id= u.user_id join listing l on r.list_id=l.list_id
where user_name='Labib' and rating=4.3;

--Lab 07
--Normal pl/sql
SET SERVEROUTPUT ON 
declare
  userName users.user_name%type;
  userId users.user_id%type :=09;
Begin
  select user_name into userName
  from users
  where user_id = userId;
  dbms_output.put_line('Name of the user :'||userName);
END;
/

--IF...Else
SET SERVEROUTPUT ON 
declare
  full_price amenity.price%type;
  wifiSpeed amenity.wifi%type :='5MBps';
  discount_price amenity.price%type :=1400;
Begin
  select price into full_price
  from amenity
  where wifi =  wifiSpeed;
  if full_price>1500 then
    full_price := discount_price;
  Else 
    full_price := full_price;
  END IF;
  dbms_output.put_line('Price of '||wifiSpeed||' is '||full_price);
END;
/


--Lab 08
--cursor and loop
SET SERVEROUTPUT ON 
declare
  cursor user_cur is select user_id,user_name,phone from users;
  cursor_cost user_cur%ROWTYPE;
Begin
  open user_cur;
  loop
    fetch user_cur into cursor_cost;
    exit when user_cur%ROWCOUNT>6;
    dbms_output.put_line('User id: '||cursor_cost.user_id||' User name: '||cursor_cost.user_name||' Phone:'||cursor_cost.phone);
    end loop;
    close user_cur;
END;
/

--plsql procedure 

SET SERVEROUTPUT ON 
create or replace procedure getName IS
  userComment review.comments%type;
  reviewRating review.rating%type :=4.3;
Begin
  select comments into userComment
  from review
  where rating = reviewRating;
  dbms_output.put_line(reviewRating|| ' rating was for : '||userComment);
END getName;
/
Begin
  getName;
END;
/

--pl/sql function
create or replace function average_cost return number is
avg_cost amenity.price%type;
roomNo amenity.no_of_rooms%type :=4;
Begin
  select AVG(price) into avg_cost
  from amenity
  where no_of_rooms = roomNo;
  return avg_cost;
END;
/
set SERVEROUTPUT on
Begin dbms_output.put_line('Average cost for 4 rooms is: '||average_cost||'taka');
end;
/

--Lab 09
--Trigger
create or replace trigger check_rating before update or insert on review
for each row 
begin
 IF : new.rating>5 OR :new.rating<1 then
 raise_application_error(-20000,'Rating must be between 1-5');
end if;
end;
/

--trigger(another)
create or replace trigger insertion_amenity before update or insert on amenity
for each row
begin 
  if:new.home_type='5 Storied Building' then
  :new.price :=2000;
  elsif:new.home_type='10 Storied Building' then
  :new.price :=1800;
  elsif:new.no_of_rooms=2 then
  :new.price :=700;
  elsif:new.home_type='12 Storied Building' then
  :new.price :=1900;
  elsif:new.home_type='5 Storied Apartment' then
  :new.price :=600;
  end if;
end;
/

create or replace trigger insertion_calendar before update or insert on calendar
for each row
begin  
  :new.available :='Yes';
end;
/

--transaction management
insert into users(user_id, user_name, email, phone, user_address) values (11, 'Samira', 'samira@gmail.com', '01723812222', 'Khabashpur, Faridpur');
insert into users(user_id, user_name, email, phone, user_address) values (12, 'Sisi', 'Sisi@gmail.com', '01543253123', 'Azimpur, Dhaka');
commit;
select * from users;
delete from users where user_id =12;
rollback;
select * from users;
insert into users(user_id, user_name, email, phone, user_address) values (13, 'Abid', 'abid@gmail.com', '01723814567', 'Jhiltuli, Faridpur');
savepoint name_6;
insert into users(user_id, user_name, email, phone, user_address) values (14, 'Dehan', 'dehan@gmail.com', '01523813422', 'Mirpur-6, Dhaka');
savepoint name_7;
rollback to name_6;
select * from users;


drop view DetailsView;
drop view AvailView;
---view
CREATE VIEW DetailsView AS
SELECT user_name, user_address
FROM users
WHERE user_id < 5;

Select * from DetailsView;

CREATE VIEW AvailView AS
SELECT list_id, l.address
FROM calendar c natural join listing l
WHERE c.available = 'Yes';

Select * from AvailView;

--date operation
select * from calendar;
select ADD_MONTHS(check_in,6) from calendar
where c_id='5002';

