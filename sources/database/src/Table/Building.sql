CREATE TABLE dbo.Building (
   BuildingId           INT                  IDENTITY(1,1),
   Name                 NVARCHAR(50)         NULL,
   CityId				INT					 NOT NULL,
   AddressLine1			NVARCHAR(100)		 NOT NULL,
   AddressLine2			NVARCHAR(100)		 NULL,		 
   OfficeId             INT                  NOT NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkBuilding PRIMARY KEY (BuildingId)
)
GO

ALTER TABLE dbo.Building
   ADD CONSTRAINT fkBuilding_City FOREIGN KEY (CityId)
      REFERENCES dbo.City (CityId)
GO

ALTER TABLE dbo.Building
   ADD CONSTRAINT fkBuilding_Office FOREIGN KEY (OfficeId)
      REFERENCES dbo.Office (OfficeId)
GO
