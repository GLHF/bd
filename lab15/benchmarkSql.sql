\set id random(1, 1000000)
BEGIN;
select selectFunctionSQL(:id);
END;