/*Part1*/ 

use ITI

/*1*/
select count(st_age) 
	from Student

/*2*/

select Distinct Ins_Name from Instructor  

/*3*/
select isnull(st_id, ' ')as [Student ID],
	isnull(St_Fname + ' ' + St_Lname, ' ') as [Student Full Name],
	isnull(D.Dept_Name, ' ') as [Department name]
	from Student S , Department D
where  S.Dept_Id = D.Dept_Id

		


/*4*/
select I.Ins_Name, D.Dept_Name 
	from Instructor I left join Department D
	on I.Dept_Id = d.Dept_Id


/*5*/
select St_Fname + ' ' + S.St_Lname as fullname, Crs_Name 
	from Course C, Stud_Course SC, student S
where S.St_Id = SC.St_Id
And   SC.Crs_Id = C.Crs_Id
And C.Crs_Name is not null  

/*6*/
select COUNT(Crs_Name) as no_of_crss , Top_Name
	from Topic T , Course C
where T.Top_Id = C.Top_Id
group by Top_Name

/*7*/
select MAX(salary) as max, MIN(salary) as min from Instructor

/*8*/
select Ins_Name
	from Instructor
where Salary < (select avg(salary) from Instructor)


--no salaries

/*9*/
select Dept_Name
	from Instructor I, Department D
where d.Dept_Id = I.Dept_Id
and   Salary in (select min(salary) from Instructor)
group by Dept_Name


/*10*/
select distinct top(2) salary 
	from Instructor
order by Salary desc

/*11*/
select ins_name, salary = (case
					when I.Salary is null then IC.Evaluation
					else 'No Data'
					end)
from Instructor I , Ins_Course IC

where I.Ins_Id = IC.Ins_Id
            

/*12*/
select AVG(salary) from Instructor

/*13*/
select S.St_Fname, sup.* 
	from Student S, Student sup
where  Sup.St_super = S.St_Id 


/*14*/
select * 
		from 
			(select *, ROW_NUMBER()
								over(partition by Dept_id   order by salary desc) as RN from Instructor) as new_table
where RN = 2 

/*15*/
select * 
		from 
			(select *, ROW_NUMBER()
								over(partition by Dept_id   order by newid()) as RN from Instructor) as new_table
where RN = 1 





