BEGIN;
INSERT INTO tableBulk SELECT 1, '3' FROM generate_series(1, 100)
COMMIT;
