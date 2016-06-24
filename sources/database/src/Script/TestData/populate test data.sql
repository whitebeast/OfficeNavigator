BEGIN TRAN

USE OfficeNavigator
GO

--DBCC CHECKIDENT(<tablename>, RESEED, 1);
DBCC CHECKIDENT(country, RESEED, 1);
DBCC CHECKIDENT(city, RESEED, 1);
DBCC CHECKIDENT(Office, RESEED, 1);
DBCC CHECKIDENT(Building, RESEED, 1);
DBCC CHECKIDENT(FLOOR, RESEED, 1); 
DBCC CHECKIDENT(FLOORType, RESEED, 1);
DBCC CHECKIDENT(Perimeter, RESEED, 1);
DBCC CHECKIDENT(RoomType, RESEED, 1);
DBCC CHECKIDENT(Room, RESEED, 1);
DBCC CHECKIDENT(RoomPerimeter, RESEED, 1);
DBCC CHECKIDENT(Department, RESEED, 1);
DBCC CHECKIDENT(Coordinate, RESEED, 1); 
DBCC CHECKIDENT(Place, RESEED, 1);  
DBCC CHECKIDENT([Object], RESEED, 1);  

IF OBJECT_ID('tempdb..#Employees') IS NOT NULL DROP TABLE #Employees
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





INSERT INTO [dbo].[Country]
           ([Name]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT
            N'Belarus',
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE() 

INSERT INTO [dbo].[City]
           ([Name]
           ,[CountryId]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT
            N'Minsk',
            c.CountryId,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE() 
FROM        dbo.Country AS c
WHERE       c.Name = N'Belarus'            

INSERT INTO [dbo].[Office]
           ([Name]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT
            N'iTechArt Belarus',
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE() 

INSERT INTO [dbo].[Building]
           ([Name]
           ,[CityId]
           ,[AddressLine1]
           ,[AddressLine2]
           ,[OfficeId]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT
            N'Бизнес-центр Титул',
            c.CityId,
            N'Толстого 10',
            NULL,
            o.OfficeId,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()            
FROM        dbo.City AS c,
            dbo.Office AS o
WHERE       c.Name = N'Minsk'
        AND o.Name = N'iTechArt Belarus'

INSERT INTO [dbo].[FloorType]
           ([Description]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT
            t.[Description],
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()  
FROM    (
	        SELECT N'Parking' AS [Description] UNION ALL
            SELECT N'Restaurant' UNION ALL
            SELECT N'Bank' UNION ALL
            SELECT N'Offices'
) t

INSERT INTO [dbo].[Floor]
           ([FloorN]
           ,[FloorTypeId]
           ,[BuildingId]
           ,[MapId]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT
            -1,
            ft.FloorTypeId,
            b.BuildingId,
            NULL,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()
FROM        dbo.FloorType AS ft,
            dbo.Building AS b
WHERE       ft.[Description] = N'Parking'
        AND b.Name = N'Бизнес-центр Титул'   
UNION ALL
SELECT
            0,
            ft.FloorTypeId,
            b.BuildingId,
            NULL,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()
FROM        dbo.FloorType AS ft,
            dbo.Building AS b
WHERE       ft.[Description] = N'Restaurant'
        AND b.Name = N'Бизнес-центр Титул' 
UNION ALL
SELECT
            1,
            ft.FloorTypeId,
            b.BuildingId,
            NULL,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()
FROM        dbo.FloorType AS ft,
            dbo.Building AS b
WHERE       ft.[Description] = N'Bank'
        AND b.Name = N'Бизнес-центр Титул'                                  
UNION ALL
SELECT      DISTINCT
            CASE WHEN LEN(REPLACE(e.Room,N'Room ','')) = 3 THEN LEFT(REPLACE(e.Room,N'Room ',''),1) ELSE LEFT(REPLACE(e.Room,N'Room ',''),2) END,
            ft.FloorTypeId,
            b.BuildingId,
            NULL,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()         
FROM        #Employees AS e,
            dbo.FloorType AS ft,
            dbo.Building AS b
WHERE       ft.[Description] = N'Offices'
        AND b.Name = N'Бизнес-центр Титул' 
ORDER BY 1
        
INSERT INTO [dbo].[Perimeter]
           ([Name]
           ,[Description]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT      
            t.Name,
            t.Description,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()
FROM (
	    SELECT N'Full Access' AS NAME, 'Full access to all rooms' AS Description UNION ALL
	    SELECT N'Guest', 'Access only on floor' UNION ALL
	    SELECT N'Accountant', 'Access to all Office rooms including Accountant' UNION ALL
	    SELECT N'HR', 'Access to all Office rooms including HR' UNION ALL
	    SELECT N'IT Support', 'Access to all Office rooms including Administration' UNION ALL
	    SELECT N'Office Room', 'Access to all Office rooms'
) t	                

INSERT INTO [dbo].[RoomType]
           ([Description]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT      
            t.[Description],
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()
FROM (
	    SELECT N'Server room' AS [Description] UNION ALL
	    SELECT N'Office room' UNION ALL
	    SELECT N'Diner Room' UNION ALL
	    SELECT N'Meeting Room' 
) t	 

INSERT INTO [dbo].[Map]
           ([MapSource]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT      
            bulkcolumn,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()           
FROM OPENROWSET (BULK N'e:\git\OfficeNavigator\database\src\Script\TestData\test_picture.jpg', SINGLE_BLOB) AS BLOB

INSERT INTO [dbo].[Department]
           ([Name]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT  DISTINCT 
        Department,
        SUSER_SNAME(),
        GETDATE(),
        SUSER_SNAME(),
        GETDATE() 
FROM    #Employees

INSERT INTO [dbo].[Room]
           ([Name]
           ,[RoomTypeId]
           ,[FloorId]
           ,[ResponsibleEmployeeId]
           ,[MapId]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT  DISTINCT   
        CAST(REPLACE(e.Room,N'Room ','') AS INT),
        rt.RoomTypeId,
        f.FloorId,
        NULL,
        m.MapId,
        SUSER_SNAME(),
        GETDATE(),
        SUSER_SNAME(),
        GETDATE() 
FROM    #Employees AS e,
        dbo.Floor AS f,
        dbo.RoomType AS rt,
        dbo.Map AS m 
WHERE   CASE WHEN LEN(REPLACE(e.Room,N'Room ','')) = 3 THEN LEFT(REPLACE(e.Room,N'Room ',''),1) ELSE LEFT(REPLACE(e.Room,N'Room ',''),2) END = f.FloorN
    AND rt.[Description]= N'Office Room'   
UNION ALL
SELECT  DISTINCT   
        N'902',
        rt.RoomTypeId,
        f.FloorId,
        NULL,
        m.MapId,
        SUSER_SNAME(),
        GETDATE(),
        SUSER_SNAME(),
        GETDATE()        
FROM    dbo.Floor AS f,
        dbo.RoomType AS rt,
        dbo.Map AS m 
WHERE   9 = f.FloorN
    AND rt.[Description]= N'Office Room'   
    
INSERT INTO [dbo].[RoomPerimeter]
           ([RoomId]
           ,[PerimeterId]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
           
SELECT
            r.RoomId,
            p.PerimeterId,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()
FROM        dbo.Room AS r,
            dbo.Perimeter AS p
WHERE p.Name = N'IT Support'    
    AND r.Name = N'1007' 
UNION ALL     
SELECT
            r.RoomId,
            p.PerimeterId,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()
FROM        dbo.Room AS r,
            dbo.Perimeter AS p
WHERE p.Name = N'Accountant'    
    AND r.Name = N'902' 
UNION ALL                   
SELECT
            r.RoomId,
            p.PerimeterId,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()
FROM        dbo.Room AS r,
            dbo.Perimeter AS p
WHERE p.Name <> N'Guest'    
    AND r.Name NOT IN (N'902',N'1007')         
ORDER BY r.RoomId

INSERT INTO [dbo].[Coordinate]
           ([Value]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT      geometry::STGeomFromText('POINT('+convert(varchar(20),X)+' '+convert(varchar(20),Y)+')',4326),
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()
FROM        #Employees            

INSERT INTO [dbo].[Place]
           ([Name]
           ,[RoomId]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT
            CAST(REPLACE(e.Room,N'Room ','') AS NVARCHAR) + '_' + CAST(ROW_NUMBER() OVER(PARTITION BY e.Room ORDER BY e.Room) AS NVARCHAR),
            r.RoomId,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()
FROM        #Employees AS e
JOIN        dbo.Room AS r ON r.Name = REPLACE(e.Room,N'Room ','')

INSERT INTO [dbo].[Object]
           ([Name]
           ,[PlaceId]
           ,[CoordinateId]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT  
            t.Name,
            p.PlaceId,
            c.CoordinateId,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()
FROM (
	    SELECT N'X-box' AS NAME UNION ALL
	    SELECT N'Kicker' UNION ALL
	    SELECT N'Vending Machine' UNION ALL
	    SELECT N'Book Shelf' UNION ALL
	    SELECT N'Table Tennis'           
) t,
dbo.Place AS p,
(SELECT TOP 5 CoordinateId, Value FROM dbo.Coordinate) AS c    
WHERE c.CoordinateId = 1 AND p.PlaceId = 1

INSERT INTO [dbo].[Employee]
           ([FirstName]
           ,[LastName]
           ,[DepartmentId]
           ,[PlaceId]
           ,[CoordinateId]
           ,[IP]
           ,[Hostname]
           ,[ProfileLink]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
SELECT      DISTINCT
            LTRIM(RTRIM(e.FirstName)),
            LTRIM(RTRIM(e.LastName)),
            d.DepartmentId,
            p.PlaceId,
            c.CoordinateId,
            NULL,
            NULL,
            NULL,
            SUSER_SNAME(),
            GETDATE(),
            SUSER_SNAME(),
            GETDATE()
FROM    (SELECT ROW_NUMBER() OVER(ORDER BY GUID) AS Id, * FROM #Employees) AS e
JOIN    dbo.Department AS d ON d.Name = e.Department
JOIN    dbo.Place AS p ON p.PlaceId = e.Id
JOIN    dbo.Coordinate AS c ON c.CoordinateId = e.Id

UPDATE r
SET ResponsibleEmployeeId = e.EmployeeId
FROM Room r
JOIN Employee e ON e.FirstName + ' ' + e.LastName = 
                    CASE r.name 
                        WHEN N'901' THEN  N'Siarhei Petrov'
                        WHEN N'903' THEN  N'Olga Ivanova'
                        WHEN N'904' THEN  N'Mikhail Petrov'
                        WHEN N'905' THEN  N'Mikhail Petrov'
                        WHEN N'906' THEN  N'Mikhail Petrov'
                        WHEN N'907' THEN  N'Olga Ivanova'
                        WHEN N'908' THEN  N'Mikhail Petrov'
                        WHEN N'1001' THEN N'Siarhei Petrov'
                        WHEN N'1204' THEN N'Denis Petrov'
                    END 
 
--SELECT * FROM country
--SELECT * FROM city
--SELECT * FROM Office AS o
--SELECT * FROM Building AS b
--SELECT * FROM FLOOR 
--SELECT * FROM FLOORType
--SELECT * FROM Perimeter AS p
--SELECT * FROM RoomType
--SELECT * FROM Room AS r
--SELECT * FROM RoomPerimeter
--SELECT * FROM Department AS d
--SELECT * FROM Coordinate AS c
--SELECT * FROM Place AS p
--SELECT * FROM [Object] AS o

COMMIT TRAN
--ROLLBACK TRAN
