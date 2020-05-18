
CREATE TABLE tbl1
(
    id    int,
    value text
);

CREATE INDEX idIndex1 ON tbl1 USING btree(id);

insert into tbl1 (id, value)
SELECT generate_series(1, 1000000), random()::text;



CREATE TABLE tbl2
(
    id    int,
    value text
);

CREATE INDEX idIndex2 ON tbl2 USING btree(id);

insert into tbl2 (id, value)
SELECT generate_series(1, 1000000), random()::text;
