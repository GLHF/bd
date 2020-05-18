CREATE OR REPLACE FUNCTION selectFunctionSQL(id int) RETURNS RECORD AS
$$
SELECT tbl.id, tbl.value
FROM tbl
WHERE tbl.id = $1;
$$ LANGUAGE SQL;