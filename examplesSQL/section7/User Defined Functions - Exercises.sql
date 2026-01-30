CREATE FUNCTION dbo.ufnPercentOfNumber(@FirstNumber FLOAT, @SecondNumber FLOAT)
    RETURNS VARCHAR(32)
BEGIN
RETURN FORMAT(@FirstNumber / @SecondNumber, 'P')
END

SELECT dbo.ufnPercentOfNumber(17.5 , 100)

DROP FUNCTION dbo.ufnPercentOfNumber