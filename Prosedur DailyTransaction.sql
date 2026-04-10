CREATE PROCEDURE DailyTransaction
    @start_date DATE,
    @end_date   DATE
AS
BEGIN
    SELECT
        CAST(TransactionDate AS DATE)  AS Date,
        COUNT(TransactionID)           AS TotalTransactions,
        SUM(Amount)                    AS TotalAmount
    FROM
        FactTransaction
    WHERE
        CAST(TransactionDate AS DATE) BETWEEN @start_date AND @end_date
    GROUP BY
        CAST(TransactionDate AS DATE)
    ORDER BY
        CAST(TransactionDate AS DATE);
END;
GO

EXEC DailyTransaction @start_date = '2024-01-18', @end_date = '2024-01-20';
