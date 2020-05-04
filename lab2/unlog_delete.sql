\set id random(1, 1000000)
BEGIN;
DELETE FROM unlog_table
WHERE id = :id;
END;