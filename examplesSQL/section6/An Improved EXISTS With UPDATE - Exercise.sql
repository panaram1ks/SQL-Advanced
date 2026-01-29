SELECT
    A.PurchaseOrderID,
    A.OrderDate,
    A.TotalDue

FROM Purchasing.PurchaseOrderHeader A

WHERE EXISTS (
              SELECT
                  1
              FROM Purchasing.PurchaseOrderDetail B
              WHERE A.PurchaseOrderID = B.PurchaseOrderID
                AND B.RejectedQty > 5
          )
ORDER BY 1

CREATE TABLE #Purchase
(
    PurchaseOrderID INT,
    OrderDate DATE,
    TotalDue MONEY,
    RejectedQty INT
)

INSERT INTO #Purchase
(
    PurchaseOrderID,
    OrderDate,
    TotalDue
    --RejectedQty
)
SELECT
    A.PurchaseOrderID,
    A.OrderDate,
    TotalDue
FROM Purchasing.PurchaseOrderHeader A

UPDATE A
SET RejectedQty = B.RejectedQty
FROM #Purchase A
    JOIN Purchasing.PurchaseOrderDetail B
ON A.PurchaseOrderID = B.PurchaseOrderID
WHERE B.RejectedQty > 5

SELECT * FROM #Purchase WHERE RejectedQty IS NOT NULL


DROP TABLE #Purchase







