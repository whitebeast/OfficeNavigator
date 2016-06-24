CREATE TABLE dbo.Coordinate (
   CoordinateId         INT                  IDENTITY(1,1),
   Value                GEOMETRY             NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkCoordinate PRIMARY KEY (CoordinateId)
)
go