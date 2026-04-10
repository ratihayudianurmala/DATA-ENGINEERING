CREATE DATABASE DWH;
GO

USE DWH;
GO

-- DimAccount
CREATE TABLE DimAccount (
    AccountID     INT           PRIMARY KEY,
    CustomerID    INT           NOT NULL,
    AccountType   VARCHAR(50)   NOT NULL,
    Balance       BIGINT        NOT NULL,
    DateOpened    DATE          NOT NULL,
    Status        VARCHAR(20)   NOT NULL
);

-- DimCustomer
CREATE TABLE DimCustomer (
    CustomerID    INT           PRIMARY KEY,
    CustomerName  VARCHAR(100)  NOT NULL,
    Address       VARCHAR(255)  NOT NULL,
    CityName      VARCHAR(100)  NOT NULL,
    StateName     VARCHAR(100)  NOT NULL,
    Age           INT           NOT NULL,
    Gender        VARCHAR(20)   NOT NULL,
    Email         VARCHAR(100)  NOT NULL
);

-- DimBranch
CREATE TABLE DimBranch (
    BranchID        INT           PRIMARY KEY,
    BranchName      VARCHAR(100)  NOT NULL,
    BranchLocation  VARCHAR(255)  NOT NULL
);

-- FactTransaction
CREATE TABLE FactTransaction (
    TransactionID    INT           PRIMARY KEY,
    AccountID        INT           NOT NULL,
    TransactionDate  DATETIME      NOT NULL,
    Amount           BIGINT        NOT NULL,
    TransactionType  VARCHAR(50)   NOT NULL,
    BranchID         INT           NOT NULL,

    CONSTRAINT FK_Fact_Account
        FOREIGN KEY (AccountID)
        REFERENCES DimAccount(AccountID),

    CONSTRAINT FK_Fact_Branch
        FOREIGN KEY (BranchID)
        REFERENCES DimBranch(BranchID)
);





