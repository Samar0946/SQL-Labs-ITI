use ITI

/*1*/
create view view1
	as 
		select S.St_Fname + ' ' + S.St_Lname as fullname, C.Crs_Name
			from Student S, Course C, Stud_Course SC
			where S.St_Id = SC.St_Id
			And   SC.Crs_Id = C.Crs_Id
			And SC.Grade > 50

/*2*/
create view view2 with encryption
	as 
		select I.Ins_Name, T.Top_Name
			from Instructor	I, Department D, Ins_Course IC, Course C, Topic T
		where 
			I.Ins_Id = D.Dept_Manager
		And I.Ins_Id = IC.Ins_Id 
		And IC.Crs_Id = C.Crs_Id
		And C.Top_Id  = T.Top_Id



/*3*/
create view view4
	with schemabinding
		as 
			select I.Ins_Name, D.Dept_Name
				from Instructor I, Department D
			where D.Dept_Manager = i.Ins_Id
			And   D.Dept_Name in ('SD ','Java')       


/*4*/
create view view5 
	as
		select *
			from Student
		where St_Address = 'Alex'
		or	  St_Address = 'Cairo'
with check option


/*5*/
create clustered index hiring On Department(Manager_hiredate)


/*6*/
create unique index unique_age on  student(St_Age)
--terminated because a duplicate key was found for the object name 'dbo.Student' and the index name 'unique_age'.

/*7*/
create table #emps
	(name varchar(20), tasks varchar(20))

/*8*/
use Company_SD

create view view6 
	as 
		select p.Pname , COUNT(E.ssn) as no_of_emps
			from Project P, Employee E, Works_for W
		where p.Pnumber = W.Pno
		and	  w.ESSn = e.SSN
		group by P.Pname


/*9*/ 
create table Dtransactions 
 (id int, amount int)
create table Ltransactions 
 (id int, amount int)

 insert into Dtransactions (id, amount) values(1,1000), (2,2000), (3,1000)
 insert into Ltransactions (id, amount) values(1,4000), (4,2000), (2,10000)


 merge into Dtransactions D using Ltransactions L
		on D.id = L.id
	when matched then 
		update 
	set D.amount = L.amount
	when not matched  then 
	insert values (l.id, l.amount);