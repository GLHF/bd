CREATE OR REPLACE FUNCTION selectFunctionPlpgsql(id int) RETURNS RECORD AS
$$
DECLARE
        result RECORD;
BEGIN
    SELECT tbl.id, tbl.value INTO result FROM tbl WHERE tbl.id = $1;
    RETURN result;
END
$$ LANGUAGE plpgsql;