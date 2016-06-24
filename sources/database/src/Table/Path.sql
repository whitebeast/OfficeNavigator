CREATE TABLE dbo.Path (
   PathId               INT                  IDENTITY(1,1),
   Name                 NVARCHAR(50)         NULL,
   RoomId               INT                  NOT NULL,
   CoordinateId         INT                  NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkPath PRIMARY KEY (PathId)
)
go

ALTER TABLE dbo.Path
   ADD CONSTRAINT fkPath_Coordinate FOREIGN KEY (CoordinateId)
      REFERENCES dbo.Coordinate (CoordinateId)
go

ALTER TABLE dbo.Path
   ADD CONSTRAINT fkPath_Room FOREIGN KEY (RoomId)
      REFERENCES dbo.Room (RoomId)
go
