BEGIN;
INSERT INTO hub (id, value)
SELECT serial_table.newid as id, newid as value
from (select generate_series(0, 999999) as newid) as serial_table;
END;
