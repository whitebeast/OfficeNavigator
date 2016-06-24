CREATE TABLE dbo.Employee (
   EmployeeId           INT                  IDENTITY(1,1),
   FirstName            NVARCHAR(50)         NULL,
   LastName             NVARCHAR(50)         NULL,
   DepartmentId         INT                  NULL,
   PlaceId              INT                  NOT NULL,
   CoordinateId         INT                  NULL,
   IP                   NVARCHAR(15)         NULL,
   Hostname             NVARCHAR(255)        NULL,
   ProfileLink          NVARCHAR(2000)       NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkEmployee PRIMARY KEY (EmployeeId)
)
go

ALTER TABLE dbo.Employee
   ADD CONSTRAINT fkEmployee_Coordinate FOREIGN KEY (CoordinateId)
      REFERENCES dbo.Coordinate (CoordinateId)
go

ALTER TABLE dbo.Employee
   ADD CONSTRAINT fkEmployee_Department FOREIGN KEY (DepartmentId)
      REFERENCES dbo.Department (DepartmentId)
go

ALTER TABLE dbo.Employee
   ADD CONSTRAINT fkEmployee_Place FOREIGN KEY (PlaceId)
      REFERENCES dbo.Place (PlaceId)
go