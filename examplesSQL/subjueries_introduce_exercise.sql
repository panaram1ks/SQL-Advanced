-- Exercise 1
SELECT
    *
FROM
    (
        SELECT
                    ROW_NUMBER()OVER(partition by poh.VendorID Order by poh.TotalDue DESC) as rowNumber,
                    poh.PurchaseOrderID ,
                    poh.VendorID ,
                    poh.OrderDate ,
                    poh.TaxAmt,
                    poh.Freight,
                    poh.TotalDue
        FROM Purchasing.PurchaseOrderHeader poh
    ) tempTable
WHERE rowNumber <= 3

-- Exercise 2
SELECT
    *
FROM
    (
        SELECT
                    DENSE_RANK() OVER(partition by poh.VendorID Order by poh.TotalDue DESC) as rowNumber,
                    poh.PurchaseOrderID ,
                    poh.VendorID ,
                    poh.OrderDate ,
                    poh.TaxAmt,
                    poh.Freight,
                    poh.TotalDue
        FROM Purchasing.PurchaseOrderHeader poh
    ) tempTable
WHERE rowNumber <= 3