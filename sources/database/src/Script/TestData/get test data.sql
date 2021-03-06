SELECT
        CAST(UniqueId AS UNIQUEIDENTIFIER) AS GUID,
        REPLACE(FullName,LTRIM(REVERSE(SUBSTRING(REVERSE(FullName),0,CHARINDEX(' ',REVERSE(FullName))+1))),'') AS LastName,
        LTRIM(REVERSE(SUBSTRING(REVERSE(FullName),0,CHARINDEX(' ',REVERSE(FullName))+1))) AS FirstName,
        Department,
        Room,
        X,
        Y       
INTO Employees         
FROM (        
    SELECT  
            UniqueId,
            LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(FullName,Department,''),'(',''),')',''))) AS FullName,
            REPLACE(REPLACE(Department,'(',''),')','') AS Department,
            Room,
            X,
            Y
    FROM (        
        SELECT 
                UniqueId,
                LTRIM(RTRIM(FullName)) AS FullName,
                SUBSTRING(Fullname,t.FirstBracket,10) AS Department,
                Room,
                X,
                Y
        FROM
            (
            SELECT  UniqueId,
                    LTRIM(RTRIM(EmployeeName)) AS FullName,
                    Room,
                    X,
                    Y,
                    CHARINDEX('(',EmployeeName) AS FirstBracket 
            FROM Table1
            WHERE   EmployeeName NOT LIKE '%Free seats%'
                AND EmployeeName NOT LIKE '%responsible%'
                AND EmployeeName NOT LIKE '%reserved%'
                AND EmployeeName NOT LIKE '%servers%'
                AND ISNUMERIC(EmployeeName) <> 1
            ) t    
    ) tt    
) ttt    
