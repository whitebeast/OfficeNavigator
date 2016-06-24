CREATE TABLE dbo.Floor (
   FloorId              INT                  IDENTITY(1,1),
   FloorN               SMALLINT			 NOT NULL,
   FloorTypeId			INT					 NOT NULL,
   BuildingId           INT                  NOT NULL,
   MapId                INT                  NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkFloor PRIMARY KEY (FloorId)
)
go

ALTER TABLE dbo.Floor
   ADD CONSTRAINT fkFloor_Building FOREIGN KEY (BuildingId)
      REFERENCES dbo.Building (BuildingId)
GO

ALTER TABLE dbo.Floor
   ADD CONSTRAINT fkFloor_Map FOREIGN KEY (MapId)
      REFERENCES dbo.Map (MapId)
GO

ALTER TABLE dbo.Floor
   ADD CONSTRAINT fkFloor_FloorType FOREIGN KEY (FloorTypeId)
      REFERENCES dbo.FloorType (FloorTypeId)
GO
