select distinct OrderID, month(OrderDate)
from orders
where month(OrderDate) = 11; 

select distinct OrderID, month(OrderDate), ShipperName
from orders join shippers using(ShipperID)
where month(OrderDate) = 11; 

select EmployeeID, sum(Quantity * Price) as OrderTotal
from employees join orders using(EmployeeID)
join order_details using (OrderID)
join products using(ProductID)
group by EmployeeID
order by OrderTotal desc;

select OrderID, ProductID from order_details
where ProductID in 
(select ProductID from products where SupplierID in
  (select SupplierID from suppliers where SupplierName = 'Tokyo Traders'));

