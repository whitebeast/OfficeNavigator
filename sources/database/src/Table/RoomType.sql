CREATE TABLE dbo.RoomType (
   RoomTypeId           INT                  IDENTITY(1,1),
   Description          NVARCHAR(50)         NOT NULL,
   CreatedBy            NVARCHAR(32)         NOT NULL,
   CreatedOn            DATETIME2            NOT NULL,
   ModifiedBy           NVARCHAR(32)         NOT NULL,
   ModifiedOn           DATETIME2            NOT NULL,
   CONSTRAINT pkRoomType PRIMARY KEY (RoomTypeId)
)
GO
