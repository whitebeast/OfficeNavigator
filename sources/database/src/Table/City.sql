CREATE TABLE dbo.City (
   CityId            INT                  IDENTITY(1,1),
   Name                 NVARCHAR(50)         NULL,
   CountryId			INT					 NOT NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkCity PRIMARY KEY (CityId)
)
GO

ALTER TABLE dbo.City
   ADD CONSTRAINT fkCity_Country FOREIGN KEY (CountryId)
      REFERENCES dbo.Country (CountryId)
GO
