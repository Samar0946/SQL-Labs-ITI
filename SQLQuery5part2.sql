use AdventureWorks2012

/*1*/
select SalesOrderID, ShipDate into NewSalesOrders
	from Sales.SalesOrderHeader
where OrderDate between '7/28/2002' and '7/29/2014'


/*2*/


select ProductID, Name 
	from Production.Product
where StandardCost < 110


/*3*/
select ProductID, Name 
	from Production.Product
where Weight is null

/*4*/
select Name 
	from Production.Product
where Color in ('Silver', ', Black','Red')


/*5*/
select Name 
	from Production.Product
where name like 'B%'


/*6*/
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

select  Description
	from Production.ProductDescription
where Description like '%\_%'  escape '\'


/*7*/
select sum(TotalDue) as total_due, OrderDate 
	from Sales.SalesOrderHeader
where OrderDate between '7/1/2001' and '7/31/2014'
group by OrderDate

/*8*/
select distinct HireDate
	from HumanResources.Employee


/*9*/

select  AVG(distinct listprice) 
	from Production.Product  

/*10*/  --is output only one result??  NOTE
select 'The ' + Name + ' is only! ' + convert(char(50),ListPrice) as Mystatment
	from Production.Product
where ListPrice in (100, 120)
order by ListPrice




/*11 A*/
select rowguid ,Name, SalesPersonID, Demographics into store_Archive
	from Sales.Store 

	/*701 rows affected)
Completion time: 2021-09-19T03:32:22.7563348+02:00*/

/*11 B*/
select rowguid ,Name, SalesPersonID, Demographics into store_Archive2
	from Sales.Store 
where 1 = 2

/*(0 rows affected)
Completion time: 2021-09-19T03:33:55.6370676+02:00*/


/*12*/
select convert(varchar, getdate(), 107)	
union all 
select convert(varchar, getdate(), 110)	
union all 
select convert(varchar, getdate(), 111)	



------------------------------------------------------------------------
--part 3
select @@VERSION  --display the version of sql server like the year 
select @@SERVERNAME  --display the server name I connect on (windows name)

--@@ is prefixed to global variable    THE MEANING
