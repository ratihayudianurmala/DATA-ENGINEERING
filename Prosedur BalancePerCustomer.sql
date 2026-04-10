CREATE PROCEDURE BalancePerCustomer
    @name VARCHAR(100)
AS
BEGIN
    SELECT
        c.CustomerName,
        a.AccountType,
        a.Balance,
        a.Balance + SUM(
            CASE
                WHEN f.TransactionType = 'Deposit'
                THEN f.Amount
                ELSE -f.Amount
            END
        ) AS CurrentBalance
    FROM
        DimCustomer c
        JOIN DimAccount a
            ON c.CustomerID = a.CustomerID
        JOIN FactTransaction f
            ON a.AccountID = f.AccountID
    WHERE
        a.Status = 'active'
        AND c.CustomerName LIKE '%' + UPPER(@name) + '%'
    GROUP BY
        c.CustomerName,
        a.AccountType,
        a.Balance;
END;
GO

EXEC BalancePerCustomer @name = 'Shelly';