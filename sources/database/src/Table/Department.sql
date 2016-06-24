CREATE TABLE dbo.Department (
   DepartmentId         INT                  IDENTITY(1,1),
   Name                 NVARCHAR(50)         NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkDepartment PRIMARY KEY (DepartmentId)
)
go