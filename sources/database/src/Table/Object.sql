CREATE TABLE dbo.Object (
   ObjectId             INT                  IDENTITY(1,1),
   Name                 NVARCHAR(50)         NULL,
   PlaceId              INT                  NOT NULL,
   CoordinateId         INT                  NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkObject PRIMARY KEY (ObjectId)
)
go

ALTER TABLE dbo.Object
   ADD CONSTRAINT fkObject_Coordinate FOREIGN KEY (CoordinateId)
      REFERENCES dbo.Coordinate (CoordinateId)
go

ALTER TABLE dbo.Object
   ADD CONSTRAINT fkObject_Place FOREIGN KEY (PlaceId)
      REFERENCES dbo.Place (PlaceId)
go
