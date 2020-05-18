CREATE OR REPLACE FUNCTION selectFunctionSQL(id int) RETURNS RECORD AS
$$
SELECT tbl2.id, tbl2.value
FROM tbl2
WHERE tbl2.id = $1;
$$ LANGUAGE SQL;