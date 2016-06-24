CREATE TABLE dbo.Perimeter (
   PerimeterId          INT                  IDENTITY(1,1),
   Name                 NVARCHAR(50)         NOT NULL,
   Description			NVARCHAR(100)		 NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkPerimeter PRIMARY KEY (PerimeterId)
)
GO
