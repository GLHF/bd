CREATE OR REPLACE FUNCTION selectFunctionPlpgsql(id int) RETURNS RECORD AS
$$
DECLARE
        result RECORD;
BEGIN
    SELECT tbl1.id, tbl1.value INTO result FROM tbl1 WHERE tbl1.id = $1;
    RETURN result;
END
$$ LANGUAGE plpgsql;