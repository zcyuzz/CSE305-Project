CREATE TABLE 'ORDER'
(
    Id ORDERS NOT NULL,
    Symbol VARCHAR(20) NOT NULL,
    OrderType BOOLEAN NOT NULL,
    NumberOfShare INTEGER NOT NULL,
    Date_Time DATETIME NOT NULL,
    TransactionFee FLOAT NOT NULL,
    PriceType VARCHAR(20) NOT NULL,
    AccountNumber VARCHAR(20) NOT NULL,
    Employee INTEGER NOT NULL,
    PRIMARY KEY(Id)
)

CREATE TABLE CUSTOMER
(
    LastName VARCHAR(20) NOT NULL,
    FirstName VARCHAR(20) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    City VARCHAR(20) NOT NULL,
    State VARCHAR(50) NOT NULL,
    ZipCode VARCHAR(20) NOT NULL,
    Telephone VARCHAR(20) NOT NULL,
    EmailAddress VARCHAR(50) NOT NULL,
    AccountNumber VARCHAR(20) NOT NULL,
    AccountCreationDate Date NOT NULL,
    CreditCardNumber VARCHAR(20) NOT NULL,
    StockPortfolio text[][],
    Rating FLOAT NOT NULL,
    PRIMARY KEY(AccountNumber)
)

CREATE TABLE EMPLOYEE
(
    SocialSecurityNumber VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    FirstName VARCHAR(20) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    City VARCHAR(20) NOT NULL,
    State VARCHAR(20) NOT NULL,
    ZipCode VARCHAR(20) NOT NULL,
    Telephone VARCHAR(20) NOT NULL UNIQUE,
    StartDate DATE NOT NULL,
    HourlyRate FLOAT NOT NULL,
    PRIMARY KEY(SocialSecurityNumber),
    UNIQUE(Telephone)
    )

Create Table STOCK
(
    Symbol VARCHAR(20) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Type VarChar(50) NOT NULL,
    PricePerShare Float NOT NULL,
    NumberofShares INTEGER NOT NULL,
    PRIMARY KEY(Symbol)
)

CREATE TABLE RECORD
(
    Date_Time DATETIME,
    Id ORDERS,
    SocialSecurityNumber VARCHAR(20),
    PRIMARY KEY(Id,SocialSecurityNumber),
    FOREIGN KEY (Id) REFERENCES 'ORDER'(Id) 
    ON DELETE NO ACTION 
    ON UPDATE CASCADE,
    FOREIGN KEY (SocialSecurityNumber) REFERENCES EMPLOYEE(SocialSecurityNumber) 
    ON DELETE NO ACTION 
    ON UPDATE CASCADE
    )

CREATE TABLE BELONGTO
(
    Since DATETIME,
    Id ORDERS,
    AccountNumber VARCHAR(20),
    PRIMARY KEY(Id,AccountNumber),
    FOREIGN KEY (Id) REFERENCES 'ORDER'(Id) 
    ON DELETE NO ACTION 
    ON UPDATE CASCADE,
    FOREIGN KEY (AccountNumber) REFERENCES CUSTOMER(AccountNumber) 
    ON DELETE NO ACTION 
    ON UPDATE CASCADE
)

CREATE TABLE ISFROM
(
    Id ORDERS,
    Symbol VARCHAR(20),
    PRIMARY KEY(Id,Symbol),
    FOREIGN KEY (Id) REFERENCES 'ORDER'(Id) 
    ON DELETE NO ACTION 
    ON UPDATE CASCADE,
    FOREIGN KEY (Symbol) REFERENCES STOCK(Symbol) 
    ON DELETE NO ACTION 
    ON UPDATE CASCADE
)
CREATE TABLE EDIT
(
    Date_Time DATATIME,
    SocialSecurityNumber VARCHAR(20),
    AccountNumber VARCHAR(20),
    PRIMARY KEY(SocialSecurityNumber,AccountNumber),
    FOREIGN KEY (SocialSecurityNumber) REFERENCES EMPLOYEE(SocialSecurityNumber) 
    ON DELETE NO ACTION 
    ON UPDATE CASCADE,
    FOREIGN KEY (AccountNumber) REFERENCES CUSTOMER(Symbol) 
    ON DELETE NO ACTION 
    ON UPDATE CASCADE
)