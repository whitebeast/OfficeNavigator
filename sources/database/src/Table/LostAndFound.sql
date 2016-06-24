CREATE TABLE dbo.LostAndFound (
   LostAndFoundId       INT                  IDENTITY,
   Description          NVARCHAR(1000)       NOT NULL,
   EmployeeId           INT                  NOT NULL,
   IsReturned           BIT                  NOT NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkLostAndFound PRIMARY KEY (LostAndFoundId)
)
GO

ALTER TABLE dbo.LostAndFound
   ADD CONSTRAINT fkLostAndFound_Employee FOREIGN KEY (EmployeeId)
      REFERENCES dbo.Employee (EmployeeId)
GO

ALTER TABLE dbo.LostAndFound 
	ADD CONSTRAINT dfCar_IsActive DEFAULT 1 FOR IsReturned
GO
