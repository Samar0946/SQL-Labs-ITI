use Company_SD
Select * from Employee  --Q1
select Fname, lname, Salary, Dno from Employee  --Q2
select Pname, Plocation, Dnum from Project --Q3
select Fname, (Salary*12)/10 as annual_salary from Employee --Q4
select SSN, Fname from Employee where Salary >= 1000  --Q5
select SSN, Fname from Employee where Salary *12 >=10000  --Q6
select Fname from Employee where Sex = 'F' --Q7
select Dnum = 968574 from Departments --Q8
select Pnumber, Pname, Plocation from Project where Dnum = 10  --Q9

