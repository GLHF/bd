

CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE TABLE GIN_table
(
    id integer,
    content varchar
);

CREATE TABLE BTREE_table
(
    id integer,
    content varchar
);

CREATE TABLE GIST_table
(
    id integer,
    content varchar
);


CREATE OR REPLACE VIEW data_view AS SELECT generate_series(1,100000) as id, format('%s %s %s %s',
    round(random() * 10), round(random() * 10), round(random() * 10) ,round(random() * 10)) as content;

INSERT INTO GIN_table SELECT id, content from data_view;
INSERT INTO BTREE_table SELECT id, content from data_view;
INSERT INTO GIST_table SELECT id, content from data_view;

CREATE INDEX gin_index ON GIN_table USING gin(content gin_trgm_ops) ;
CREATE INDEX btree_index ON BTREE_table USING btree(content varchar_pattern_ops);
CREATE INDEX gist_index ON GIST_table USING gist(content gist_trgm_ops) ;

