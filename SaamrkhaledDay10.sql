use Company_SD
/*1*/
declare c1 cursor 
for select salary 
from Employee
for update 

declare @sal int 
open c1
fetch c1 into @sal
while @@FETCH_STATUS = 0 
	begin 
		if @sal >= 3000
			update Employee
				set Salary = @sal * 0.2
				where current of c1
		else 
			update Employee
				set Salary = @sal * 0.1
				where current of c1
			fetch C1 into @sal
	end
close c1 
deallocate c1

/*2*/
use ITI
declare c1 cursor
for select D.Dept_Name , ins_name
	from dbo.Department D, Instructor I 
where D.dept_Manager = I.Ins_Id
for read only 

declare @Dname varchar(20), @Iname_ varchar(20)
open c1 
fetch c1 into @Dname, @Iname
while @@FETCH_STATUS = 0 
	begin 
		select @Dname as dept_name, 
				@Iname_ as ins_name 
	fetch c1 into @Dname, @Iname_
	end 
close c1 
deallocate c1


/*3*/
declare c1 cursor 
for select st_fname from student 
for read only 

declare @name1 varchar(30), @name2 varchar(30)= ''
open c1 
fetch c1 into @name1
while @@FETCH_STATUS = 0 
	begin 
		set @name2 = CONCAT (@name2, ',' ,@name1)
		fetch c1 into @name 
	end 
select SUBSTRING(@name2, 2 len(@name2)-1)

close c1 
deallocate c1
/*4*/ --DONE

/*5*/

/*7*/
create table #seq (vesq int)


create sequence seqq as int
start with 1 
increment by 1 
Minvalue 1 
maxvaluse 10
cycle

drop srqq



declare @std = 1 , @end = 10 
	while @std > @end 
		begin
			INSERT into #seq values (next value for dbo.seqq)
				set @std +=1
		end 


