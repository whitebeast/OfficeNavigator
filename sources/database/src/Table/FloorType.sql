﻿CREATE TABLE dbo.FloorType (
   FloorTypeId          INT                  IDENTITY(1,1),
   Description          NVARCHAR(255)        NOT NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkFloorType PRIMARY KEY (FloorTypeId)
)
GO