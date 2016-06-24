CREATE TABLE dbo.Room (
   RoomId               INT                  IDENTITY(1,1),
   Name                 NVARCHAR(50)         NULL,
   RoomTypeId			INT					 NOT NULL,
   FloorId              INT                  NOT NULL,
   ResponsibleEmployeeId INT                 NULL,
   MapId                INT                  NOT NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkRoom PRIMARY KEY (RoomId)
)
GO

ALTER TABLE dbo.Room
   ADD CONSTRAINT fkRoom_Employee FOREIGN KEY (ResponsibleEmployeeId)
      REFERENCES dbo.Employee (EmployeeId)
GO

ALTER TABLE dbo.Room
   ADD CONSTRAINT fkRoom_Floor FOREIGN KEY (FloorId)
      REFERENCES dbo.Floor (FloorId)
GO

ALTER TABLE dbo.Room
   ADD CONSTRAINT fkRoom_Map FOREIGN KEY (MapId)
      REFERENCES dbo.Map (MapId)
GO

ALTER TABLE dbo.Room
   ADD CONSTRAINT fkRoom_RoomType FOREIGN KEY (RoomTypeId)
      REFERENCES dbo.RoomType (RoomTypeId)
GO