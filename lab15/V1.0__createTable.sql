
CREATE TABLE tbl
(
    id    int,
    value text
);

insert into tbl (id, value)
SELECT generate_series(1, 1000000), random()::text;
