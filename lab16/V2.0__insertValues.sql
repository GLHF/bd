insert into tbl1 (id, value)
SELECT generate_series(1, 1000), random()::text;

insert into tbl2 (id, value)
SELECT generate_series(1, 10000), random()::text;

insert into tbl3 (id, value)
SELECT generate_series(1, 100000), random()::text;
