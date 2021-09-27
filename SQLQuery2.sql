use [SD32-Company]

/*1*/

create view v_clerk as 
select E.EmpNo, P.ProjectNo, W.EnterDate
	from Company.project P,HR.employee E, Company.Department D, Works_On W
where 
	E.EmpNo = W.EmpNo
and W.ProjectNo = P.ProjectNo
and job = 'Clerk'

/*2*/ 
create view v_without_budget as 
select * 
	from Company.project
where Budget is null

/*3*/

create view v_count as 
select COUNT(job) as number, P.ProjectName
	from Company.project P, Works_On W
where P.ProjectNo = W.ProjectNo
group by p.ProjectName

/*4*/
create view v_project_p2 as 
select empno 
	from v_clerk
where ProjectNo = '2'

/*5*/
alter view v_without_budget as 
select * 
	from Company.project p
where p.ProjectNo in ('1','2')


/*6*/
drop view v_clerk , v_count

/*7*/
create view emps as 
select e.EmpLname, e.EmpNo
	from HR.employee e, Company.Department d
where e.DeptNo = d.DeptNo
and   d.DeptNo = '2'

/*8*/
select emplname 
	from emps
where EmpLname like '%j%'

/*9*/
create view v_dept as 
select D.DeptNo, d.DeptName
	from Company.Department D

/*10*/
insert into v_dept 
	values ('4', 'Development')

/*11*/
create view v_2006_check as
select e.EmpNo , p.ProjectNo, w.EnterDate
	from hr.employee E, Company.project P, Works_On W
where e.EmpNo = w.EmpNo 
and   w.ProjectNo = p.ProjectNo
and   w.EnterDate between '01/01/2006' and '31/12/2006'


insert into v_2006_check(w.EnterDate)
	values ('25/11/2006')





