/************************************************************
 * Generated by SoftTree SQL Assistant � 7.1.246
 * Time:   6/22/2016 13:27:22
 * Source: Employees
 ************************************************************/

/* Inserting #Employees data... */

CREATE TABLE #Employees(
	[GUID] [uniqueidentifier] NULL,
	[LastName] [nvarchar](4000) NULL,
	[FirstName] [nvarchar](4000) NULL,
	[Department] [nvarchar](4000) NULL,
	[Room] [nvarchar](255) NULL,
	[X] [decimal](28, 10) NULL,
	[Y] [decimal](28, 10) NULL
)

SET NOCOUNT ON
GO
INSERT INTO #Employees([GUID],[LastName],[FirstName],[Department],[Room],[X],[Y])
VALUES('38a24025-0ae3-4d64-b514-acddd6a6d52c','Ivanova ','Polina','D2','Room 301',13.3858267716,19.8818897637);
INSERT INTO #Employees([GUID],[LastName],[FirstName],[Department],[Room],[X],[Y])
VALUES('6e2c2ea7-b376-4979-9635-6f9461ee2442','Ivanova ','Olga','D3','Room 301',12.6377952755,18.1102362204);
INSERT INTO #Employees([GUID],[LastName],[FirstName],[Department],[Room],[X],[Y])
VALUES('9c27f1d6-ee79-402f-b0ae-9e7c051aa349','Petrov ','Ivan','D1','Room 301',19.4094488188,13.1889763779);
INSERT INTO #Employees([GUID],[LastName],[FirstName],[Department],[Room],[X],[Y])
VALUES('09c076ac-9526-4b03-8f36-2015657f5c8d','Petrov ','Alexander','D1','Room 301',31.6692913385,8.4645669291);
INSERT INTO #Employees([GUID],[LastName],[FirstName],[Department],[Room],[X],[Y])
VALUES('caf2fe63-4c03-43a5-9c68-407410c12614','Petrov ','Siarhei','D1','Room 301',14.5984251968,23.6220472440);
INSERT INTO #Employees([GUID],[LastName],[FirstName],[Department],[Room],[X],[Y])
VALUES('dd5a507f-4fb8-4917-9423-47eb9d2198e0','Petrov ','Mikhail','D1','Room 301',35.1181102362,7.6771653543);
INSERT INTO #Employees([GUID],[LastName],[FirstName],[Department],[Room],[X],[Y])
VALUES('a3f2d3aa-688e-43bd-b7c4-97af2c2d5659','Petrov ','Vitaly','D1','Room 301',29.3399406086,17.1259842519);
INSERT INTO #Employees([GUID],[LastName],[FirstName],[Department],[Room],[X],[Y])
VALUES('c70cdd7a-b962-4d78-be4a-7fb2a0a85636','Ivanova ','Katsiaryna','D1','Room 401',29.4370078740,18.8976377952);
INSERT INTO #Employees([GUID],[LastName],[FirstName],[Department],[Room],[X],[Y])
VALUES('b6b13358-5c51-4d73-b948-3fd5ae53b631','Petrov ','Denis','D1','Room 401',23.1535433070,13.1889763779);
INSERT INTO #Employees([GUID],[LastName],[FirstName],[Department],[Room],[X],[Y])
VALUES('3be6ba0c-3c44-48c9-a894-3a8d95227f13','Petrov ','Vladimir','D1','Room 401',38.0013579315,8.4645669291);
GO
SET NOCOUNT OFF
GO

/* Inserted 502 rows */

/* Successfully inserted 502 rows in 1 table. */

