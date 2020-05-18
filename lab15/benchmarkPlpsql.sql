\set id random(1, 1000000)
BEGIN;
select selectFunctionPlpgsql(:id);
END;