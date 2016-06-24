CREATE TABLE dbo.RoomPerimeter (
   RoomPerimeterId      INT                  IDENTITY(1,1),
   RoomId               INT                  NOT NULL,
   PerimeterId          INT                  NOT NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkRoomPerimeter PRIMARY KEY (RoomPerimeterId)
)
GO

ALTER TABLE dbo.RoomPerimeter
   ADD CONSTRAINT fkRoomPerimeter_Perimeter FOREIGN KEY (PerimeterId)
      REFERENCES dbo.Perimeter (PerimeterId)
GO

ALTER TABLE dbo.RoomPerimeter
   ADD CONSTRAINT fkRoomPerimeter_Room FOREIGN KEY (RoomId)
      REFERENCES dbo.Room (RoomId)
GO
