CREATE TABLE hollywood(
film varchar(100),
Genre varchar(100),
LeadStudio varchar(100),
AudienceScore integer,
Profitibility numeric(11,9),
RottenTomatoes integer,
WorldGross numeric(9,6),
Year year);

insert hollywood
values("ok","ok","ok",8,11.978,7,9.7776,2021);

update hollywood
set film="abced"
where genre="ok";

delete from hollywood
where genre="ok";

select * from hollywood;

select * from hollywood
where year>2008
order by year;

select distinct LeadStudio from hollywood
where year > 2008;

select count(*) from hollywood
where Profitibility>=30;

select count(*) from hollywood
where genre="Disney"
and Profitibility>=30;

select count(*) from hollywood
where Profitibility>=30
or AudienceScore>80;

SELECT COUNT(distinct LeadStudio)
FROM hollywood
WHERE Year = 2011;

select AudienceScore-RottenTomatoes as score_gap
from hollywood;

select Profitibility*100
from hollywood;

select count(*),avg(profitibility),max(profitibility),min(profitibility)
from hollywood
where genre="Comedy";

select *
from hollywood
where film like "%love%";

select *
from hollywood
where film like "G__d%";

 SELECT Max(Profitibility)-Min(Profitibility) 
 AS Difference 
 FROM Hollywood 
 WHERE LeadStudio="Fox";
 

select distinct LeadStudio
from hollywood
where film like "f%" or film like "w%";

SELECT Genre,count(*)
FROM Hollywood
Where Year = 2010
GROUP BY Genre
ORDER BY count(*) DESC
LIMIT 1;

select genre, avg(AudienceScore)
from hollywood
group by genre
having avg(AudienceScore)>50;

select year
from hollywood
where Genre="Romance"
group by year
having count(*) > 2;

select LeadStudio
from hollywood
where year=2010
group by LeadStudio
having count(film) > 2;

select LeadStudio,count(genre)
from hollywood
where year>=2009
group by LeadStudio
having count(distinct genre)>=2;

select LeadStudio
from hollywood
where film like "%love%"
group by LeadStudio
having count(film)=1;


select LeadStudio,sum(WorldGross)
from hollywood
group by LeadStudio
having min(AudienceScore)>50;

select ProductName,CompanyName from product
inner join supplier
on product.SupplierNumber=supplier.SupplierNumber
order by supplier.CompanyName;

select supplier.CompanyName, product.ProductName
from supplier,product
where supplier.SupplierNumber=product.SupplierNumber
order by supplier.CompanyName asc;

select product.ProductName, supplier.State from product
inner join supplier
on supplier.SupplierNumber=product.SupplierNumber
order by product.ProductName asc;

select product.ProductName, supplier.State from product, supplier
where supplier.SupplierNumber=product.SupplierNumber
order by product.ProductName asc;

select product.ProductName, product.ProductCategory,supplier.CompanyName, supplier.ZIP from product
inner join supplier
on supplier.SupplierNumber=product.SupplierNumber
where supplier.ZIP > 70000
order by supplier.CompanyName asc;

select supplier.CompanyName, product.ProductName from supplier
inner join product
on supplier.SupplierNumber = product.SupplierNumber
where product.QuantityonHand <= product.ReorderLevel;

select supplier.CompanyName, product.ProductName from supplier,product
where supplier.SupplierNumber = product.SupplierNumber
and product.QuantityonHand <= product.ReorderLevel;

select employees.FirstName,employees.LastName, datediff(now(),employees.hired_date)/365 as Tenure from employees
where datediff(now(),employees.hired_date)/365 > 20;

select location.Location,employees.FirstName,employees.LastName from location
left join employees
on location.Location=employees.Location
order by location.Location asc;

select employees.EmployeeID, location.RegionalOffice from employees
left join location
on location.Location=employees.Location
where location.RegionalOffice="Yes";

select location.Location, location.RegionalOffice, count(employees.EmployeeID) from location
right join employees
on location.Location=employees.Location
where location.RegionalOffice="Yes"
and employees.Performance="Good"
group by location.Location
order by count(employees.EmployeeID)
limit 1;


select employees.Title,location.RegionalOffice, avg(employees.salaries),min(employees.salaries),max(employees.salaries) from employees
left join location
on location.Location=employees.Location
group by location.RegionalOffice,employees.Title;

select manager.FirstName, manager.LastName, employees.Title from employees
inner join manager
on manager.EmployeeID=employees.EmployeeID
where employees.Title="Trainee"
and employees.FirstName like "j%";

select ProductName from product
where SellingPrice > (select avg(SellingPrice) from product)
order by ProductName;

select * from product
where PurchaseCost-SellingPrice > (select avg(PurchaseCost-SellingPrice) from product);

select count(*) from product
where ProductCategory="Children"
and SellingPrice > (select avg(SellingPrice) from product where ProductCategory="Children");
