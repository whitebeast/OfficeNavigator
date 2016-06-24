CREATE TABLE dbo.Map (
   MapId                INT                  IDENTITY(1,1),
   MapSource            VARBINARY(MAX)       NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkMap PRIMARY KEY (MapId)
)
go