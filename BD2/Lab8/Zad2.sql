USE testCLR;
GO

IF OBJECT_ID('dbo.FormatDate') IS NOT NULL
DROP FUNCTION dbo.FormatDate;
GO

CREATE FUNCTION dbo.FormatDate
(
    @dateValue DATETIME,
    @format NVARCHAR(50)
)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @formattedDate NVARCHAR(100);

    SET @formattedDate = 
        CASE @format
            WHEN 'YYYY-MM-DD' THEN CONVERT(NVARCHAR(100), @dateValue, 23)
            WHEN 'DD-MM-YYYY' THEN CONVERT(NVARCHAR(100), @dateValue, 105)
            WHEN 'MM-DD-YYYY' THEN CONVERT(NVARCHAR(100), @dateValue, 110)
            ELSE 'Invalid format'
        END;

    RETURN @formattedDate;
END;
GO


SELECT dbo.FormatDate(GETDATE(), 'YYYY-MM-DD') AS FormattedDate;
SELECT dbo.FormatDate(GETDATE(), 'DD-MM-YYYY') AS FormattedDate;
SELECT dbo.FormatDate(GETDATE(), 'MM-DD-YYYY') AS FormattedDate;