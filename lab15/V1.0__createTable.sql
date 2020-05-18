
CREATE TABLE tbl
(
    id    int,
    value text
);

CREATE INDEX idIndex ON tbl USING btree(id);

insert into tbl (id, value)
SELECT generate_series(1, 1000000), random()::text;
