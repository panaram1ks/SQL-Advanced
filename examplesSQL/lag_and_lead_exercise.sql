-- Exercise 1
SELECT 
	PurchaseOrderID,
	OrderDate,
	TotalDue,
	pv.Name as VendorName
FROM Purchasing.PurchaseOrderHeader ppoh
JOIN Purchasing.Vendor pv
ON pv.BusinessEntityID = ppoh.VendorID
WHERE ppoh.TotalDue > 500 AND OrderDate >= DATEFROMPARTS(2013, 1, 1) 

-- Exercise 2
SELECT 
	VendorID,
	PurchaseOrderID,
	OrderDate,
	TotalDue,
	pv.Name as VendorName,
	LAG(ppoh.TotalDue) OVER(ORDER BY VendorID) as PrevOrderFromVendorAmt
FROM Purchasing.PurchaseOrderHeader ppoh
JOIN Purchasing.Vendor pv
ON pv.BusinessEntityID = ppoh.VendorID
WHERE ppoh.TotalDue > 500 AND OrderDate >= DATEFROMPARTS(2013, 1, 1) 

-- Exercise 3
SELECT 
	EmployeeID,
	VendorID,
	PurchaseOrderID,
	OrderDate,
	TotalDue,
	pv.Name as VendorName,
	LEAD(ppoh.TotalDue) OVER(ORDER BY EmployeeID) as NextOrderByEmployeeVendor
FROM Purchasing.PurchaseOrderHeader ppoh
JOIN Purchasing.Vendor pv
ON pv.BusinessEntityID = ppoh.VendorID
WHERE ppoh.TotalDue > 500 AND OrderDate >= DATEFROMPARTS(2013, 1, 1) 

-- Exercise 4
SELECT 
	EmployeeID,
	VendorID,
	PurchaseOrderID,
	OrderDate,
	TotalDue,
	pv.Name as VendorName,
	LEAD(ppoh.TotalDue,2) OVER(ORDER BY EmployeeID) as Next2OrderByEmployeeVendor
FROM Purchasing.PurchaseOrderHeader ppoh
JOIN Purchasing.Vendor pv
ON pv.BusinessEntityID = ppoh.VendorID
WHERE ppoh.TotalDue > 500 AND OrderDate >= DATEFROMPARTS(2013, 1, 1) 