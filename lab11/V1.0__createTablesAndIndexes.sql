CREATE TABLE hash_table
(
    id   integer,
    name varchar
);

CREATE TABLE btree_table
(
    id   integer,
    name varchar
);


CREATE TABLE brin_table
(
    id   integer,
    name varchar
);

CREATE INDEX hash_index ON hash_table USING hash(name);
CREATE INDEX btree_index ON btree_table USING btree(name);
CREATE INDEX brin_index ON brin_table USING brin(name) WITH (pages_per_range=4, autosummarize=true);


insert into hash_table
SELECT generate_series(1,100000),
       generate_series(1,100000);

insert into btree_table
SELECT generate_series(1,100000),
       generate_series(1,100000);

insert into brin_table
SELECT generate_series(1,100000),
       generate_series(1,100000) ;
