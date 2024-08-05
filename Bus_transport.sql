/*
consider the following Entities andtheir Rlarionshipe for Bus Transport databade.
Bus(bus_no int ,b_capacity int,deport_name varchar(20))
Route(route_no int,source char(20),destination char(20),no_of_stations int)
Driver(driver_no int,driver_name char(20),license_no int,address char(20),d_age int,salary float)
Relationship between Bus ans route is many to one and relationship between bus and driver is many with descriptive attributes
date_of_duty_allotted and shift.
constriant:primary key,license_no is unique,b_capacity should not benull,shift can be 1(Morning) pr 2(Evening).
create view for dispaly details of all the drivers having age more than 24.
*/
 

create database Bus_t;

create table route
(
 route_no int primary key,
 sourc char(20),
 destination char(20),
 no_of_stations int
);

create table Bus
(
 Bus_no int primary key,
 Bus_capacity int NOT NULL,
 Deport_name varchar(20),
 route_no int,
 foreign key(route_no)references route(route_no)
);

create table Driver
(
 driver_no int primary key,
 driver_name char(20),
 license_no int unique,
 address char(20),
 d_age int,
 salary float
 );
 
 create table Bus_driver
 (
  bus_no int,
  driver_no int,
  date_of_duty_allotted date,
  shift int check(shift in (1,2)),
  primary key(bus_no,driver_no,date_of_duty_allotted),
  foreign key(bus_no)references Bus(Bus_no),
  foreign key(driver_no)references Driver(driver_no)
 );
 
insert into route values(101,'Sangamner','Akole',3);
insert into route values(102,'Nashik','Pune',2);
insert into route values(103,'shirdi','Ahamdnager',4);

insert into bus values(3373,54,'central Depot',101);
insert into bus values(4601,52,'north Depot',102);
insert into bus values(4518,50,'south Depot',103);

insert into driver values(201,'Ram','758816','Rahuri',25,40000.00);
insert into driver values(202,'Om','935616','Pune',22,35000.00);
insert into driver values(203,'Shama','992260','Nashik',27,50000.00);

insert into bus_driver values(4601,202,'2022-08-05',1);
insert into bus_driver values(4601,201,'2020-12-04',2);
insert into bus_driver values(3373,203,'2018-10-02',1);
insert into bus_driver values(4518,202,'2022-09-09',2);

create view Driver_age_above_24
as select driver_no,driver_name,license_no,address,d_age,salary
from driver
where d_age > 24;
















