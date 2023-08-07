1)

create table student1
(rollNo varchar(8) not null primary key,
Sname varchar(20),
gender varchar(7),
city varchar(20));

insert into student1 values('2101EC67','Pranav','Male','Guntur');
insert into student1 values('2101EC01','Praveen','Male','Hyderabad');
insert into student1 values('2001EC34','Udaya','Female','Delhi');
insert into student1 values('1801CS67','Pawan','Male','Vijayawada');
insert into student1 values('2001CS22','Sahith','Male','Hyderabad');
insert into student1 values('2201ME67','Vikhyath','Male','Hyderabad');
insert into student1 values('2101CS56','Anvesh','Male','Vijayawada');
insert into student1 values('1901CS99','Karthika','Female','Vijayawada');
insert into student1 values('1901EC67','Kuladeep','Male','Vijayawada');
insert into student1 values('2001CS81','Jeevan','Male','Vijayawada');


2)

create table course1
(cCode varchar(5) not null primary key,
cName varchar(20),
credit number);

insert into course1 values('CS123','Data Stuctures',4);
insert into course1 values('SH201','Linear Algebra',4);
insert into course1 values('EC110','Waves',4);
insert into course1 values('DS200','Smart Product Design',3);
insert into course1 values('CS526','DSD',4);
insert into course1 values('ME301','STP',4);

3)

create table enrolled
(rollNo varchar(8),
cCode varchar(5),
yoe number,
foreign key (rollNo) references student1,
foreign key (cCode) references course1);

insert into enrolled values('2001CS81','CS123',2021);
insert into enrolled values('2001CS81','CS526',2022);
insert into enrolled values('2001CS81','EC110',2021);
insert into enrolled values('2001CS81','SH201',2021);
insert into enrolled values('2001CS81','DS200',2022);
insert into enrolled values('2001CS22','CS526',2020);
insert into enrolled values('2001CS22','ME301',2021);
insert into enrolled values('2001CS22','CS123',2020);
insert into enrolled values('2201ME67','EC110',2019);
insert into enrolled values('2001EC34','SH201',2018);
insert into enrolled values('1801CS67','DS200',2020);
insert into enrolled values('1801CS67','CS526',2020);
insert into enrolled values('1801CS67','EC110',2020);
insert into enrolled values('1801CS67','SH201',2020);
insert into enrolled values('1801CS67','CS123',2020);
insert into enrolled values('1801CS67','ME301',2020);

A)

alter table course1
add cType varchar(20);

update course1 set cType='Core' where cCode='CS123';
update course1 set cType='Elective' where cCode='SH201';
update course1 set cType='Open Elective' where cCode='EC110';
update course1 set cType='Core' where cCode='DS200';
update course1 set cType='Core' where cCode='CS526';

alter table student1
add email varchar(30);

update student1 set email='pranav@gmail.com' where Sname='Pranav';
update student1 set email='praveen@gmail.com' where Sname='Praveen';
update student1 set email='udaya@google.com' where Sname='Udaya';
update student1 set email='sahith@yahoo.com' where Sname='Sahith';
update student1 set email='pawan@google.com' where Sname='Pawan';
update student1 set email='vikhyath@yahoo.com' where Sname='Vikhyath';
update student1 set email='anvesh@gmail.com' where Sname='Anvesh';
update student1 set email='karthika@gmail.com' where Sname='Karthika';
update student1 set email='kuladeep@google.com' where Sname='Kuladeep';
update student1 set email='jeevan@yahoo.com' where Sname='Jeevan';

B)

create view CScourses as 
select * from course1
where cCode like 'CS%';

C)

create view viewC as
select * from student1
where Sname like '%a%a%' and gender='Male';

D)

create view viewD as
select * from student1
where rollNo in(select rollNo from enrolled where yoe<>2018 and yoe<>2019);

E)

create view viewE as
select cName,cCode from course1
where credit=(select min(credit) from course1);

F)

create view viewF as
select cName from course1
where cCode in(select cCode from course1 minus select cCode from enrolled where yoe=2020);

G)

create view viewG as
select city,count(sName) as numStud from student1 group by city;

H)

create view viewH as
select rollNo from(select rollNo,count(cCode) as enrNum from enrolled group by rollNo) where enrNum=5; 

I)

create view viewI as
select count(cCode) as enrolNum from enrolled where rollNo='1901CS99';

J)

create view viewJ as
select * from course1 where cCode like '%5__';

K)

create view viewK as
select count(rollNo) as csStudents from student1 where rollNo like '%CS%';

L)

create view viewL as
select rollNo from(select rollNo,count(cCode) as enrNum from enrolled where yoe=2020 group by rollNo) where enrNum>4;

M)

create view viewM as
select cCode from enrolled where rollNo in(select
rollNo from student1 where gender='Female' and city='Delhi') 
group by cCode having count(*) =
(select max(count) from (select count(*) as count from enrolled where
rollNo in (select
rollNo from student1 where gender='Female' and city='Delhi') group by cCode));

N)

create view viewN as
select Sname,email from student1 where email like '%@gmail.com' or email like '%@yahoo.com';

O)

create view viewO as
select Sname,rollNo from student1
where rollNo in (select rollNo from enrolled
minus
select distinct rollNo from (select * from ((select rollNo from student1) cross join (select cCode from course1))
minus
select rollNo,cCode from enrolled));