USE AdventureWorks2016

GO

SELECT 'TEST'

GO 

SELECT 'TEST2' AS 'COLUMNNAME'


GO

SELECT * FROM Production.Product


GO 

SELECT ProductID FROM Production.Product

GO 

SELECT ProductID AS 'ID' FROM Production.Product

GO

SELECT ProductID AS 'ID' FROM Production.Product
WHERE ProductID < 500


GO


SELECT ProductID AS 'ID' FROM Production.Product
WHERE ProductID % 2 =0;


GO


SELECT ProductID AS 'ID' FROM Production.Product
WHERE ProductID BETWEEN 50 AND 500;


GO

SELECT Name FROM Production.Product
WHERE Name='Blade'


GO

SELECT DISTINCT ReorderPoint FROM Production.Product




GO


CREATE TABLE Test5
(
    ID INT PRIMARY KEY,
  FirstName NVARCHAR(50),
  LastName NVARCHAR(50),
  City NVARCHAR(50) DEFAULT 'Esfahan',
  NationalCode varchar(10) UNIQUE 

)


GO


CREATE TABLE Test6
(
    ID INT PRIMARY KEY,
  FirstName NVARCHAR(50),
  LastName NVARCHAR(50),
  City NVARCHAR(50) DEFAULT 'Esfahan',
  NationalCode varchar(10) UNIQUE,
  Age INT,
  CHECK(AGE < 80 AND AGE > 10)
)


GO 

CREATE TABLE Countries
(
CountryID INT PRIMARY KEY,
Name NVARCHAR(50)
) 

GO 

CREATE TABLE Cities
(
ID INT PRIMARY KEY, 
CityName NVARCHAR(50),
CountryID INT,
  FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
)










USE TestDB 

GO 

ALTER TABLE Category
ADD Discription NVARCHAR(150) 

GO 

ALTER TABLE Persons
ADD PhoneNumber2 VARCHAR(20) NOT NULL DEFAULT '0912121212'


GO 

ALTER TABLE Persons 

DROP COLUMN PhoneNumber; 

GO 


ALTER TABLE Persons 
ALTER COLUMN PhoneNumber2 VARCHAR(15) 

GO



sp_rename 'Persons.PhoneNumber2', 'PhoneNumber', 'COLUMN';






































￼







￼
















































￼


￼


￼















CREATE PROCEDURE MYSP_SelectPersons
AS
SELECT * FROM Persons


GO 

EXEC MYSP_SelectPersons 

GO 

CREATE PROCEDURE MYSP_SelectPersonByID
(
@PersonID INT
)
AS
SELECT * FROM Persons
WHERE PersonId=@PersonID 

GO 

EXEC MYSP_SelectPersonByID 2 

GO 

EXEC MYSP_SelectPersonByID @PersonID=2 

GO 

CREATE PROCEDURE MYSP_InsertPersons
(
@FirstName NVARCHAR(50),
@LastName NVARCHAR(50),
@Email NVARCHAR(50),
@NationalCode VARCHAR(50),
@Mobile VARCHAR(20)
)
AS
BEGIN 
INSERT INTO Persons(FirstName,LastName,Email,NationalCode,PhoneNumber)
VALUES(@FirstName,@LastName,@Email,@NationalCode,@Mobile)
END 

GO 

EXEC MYSP_InsertPersons 
@FirstName='علیرضا',
@LastName='علیرضایی',
@Email='alireza@gmail.com',
@NationalCode='1742929845',
@Mobile='09338530237'; 

GO 

EXEC MYSP_InsertPersons 
@FirstName='بهادر',
@LastName='علیرضایی',
@Email='bahador@gmail.com',
@NationalCode='1742929845',
@Mobile='09338530237';





CREATE PROCEDURE MYSP_SelectPersons
AS
SELECT * FROM Persons


GO

EXEC MYSP_SelectPersons

GO

CREATE PROCEDURE MYSP_SelectPersonByID
(
@PersonID INT
)
AS
SELECT * FROM Persons
WHERE PersonId=@PersonID

GO

EXEC MYSP_SelectPersonByID 2

GO

EXEC MYSP_SelectPersonByID @PersonID=2

GO

CREATE PROCEDURE MYSP_InsertPersons
(
@FirstName NVARCHAR(50),
@LastName NVARCHAR(50),
@Email NVARCHAR(50),
@NationalCode VARCHAR(50),
@Mobile VARCHAR(20)
)
AS
BEGIN 
INSERT INTO Persons(FirstName,LastName,Email,NationalCode,PhoneNumber)
VALUES(@FirstName,@LastName,@Email,@NationalCode,@Mobile)
END

GO

EXEC MYSP_InsertPersons 
@FirstName='علیرضا',
@LastName='علیرضایی',
@Email='alireza@gmail.com',
@NationalCode='1742929845',
@Mobile='09338530237';

GO

EXEC MYSP_InsertPersons 
@FirstName='ارسلان',
@LastName='علیرضایی',
@Email='bahador@gmail.com',
@NationalCode='1742929845',
@Mobile='09338530237';

GO

CREATE PROCEDURE MYSP_SelectFirstNameByID
(
@PersonID INT,
@FullName NVARCHAR(50) OUTPUT
)
AS 
BEGIN 
SET @FullName=(SELECT FullName FROM Persons WHERE PersonId=@PersonID)
END

GO

DECLARE @PersonName NVARCHAR(50)
EXEC MYSP_SelectFirstNameByID @PersonID=2,@FullName=@PersonName OUTPUT
SELECT @PersonName


GO