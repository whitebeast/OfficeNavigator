CREATE TABLE dbo.Place (
   PlaceId              INT                  IDENTITY(1,1),
   Name                 NVARCHAR(50)         NULL,
   RoomId               INT                  NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkPlace PRIMARY KEY (PlaceId)
)
GO

ALTER TABLE dbo.Place
   ADD CONSTRAINT fkPlace_Room FOREIGN KEY (RoomId)
      REFERENCES dbo.Room (RoomId)
GO
