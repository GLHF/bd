
BEGIN;
INSERT INTO hub (id, value)
SELECT generate_series.generate_series as id, 'Some value' as value
from generate_series(1, 1000000);
END;