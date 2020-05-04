\set id random(1, 1000000)
BEGIN;
UPDATE log_table
SET value = random_string(1000)
WHERE id = :id;
END;