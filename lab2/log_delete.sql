\set id random(1, 1000000)
BEGIN;
DELETE FROM log_table
WHERE id = :id;
END;