CREATE TABLE table_name (
    a int,
    b int,
    c int
);


CREATE INDEX a_index ON table_name USING btree (a);
CREATE INDEX c_index ON table_name USING btree (c);
CREATE INDEX b_index ON table_name USING btree (b);
CREATE INDEX a_b_index ON table_name USING btree (a, b);
CREATE INDEX b_a_index ON table_name USING btree (b, a);
CREATE INDEX a_c_index ON table_name USING btree (a, c);
CREATE INDEX c_a_index ON table_name USING btree (c, a);
CREATE INDEX c_b_index ON table_name USING btree (c, b);
CREATE INDEX b_c_index ON table_name USING btree (b, c);
CREATE INDEX a_b_c_index ON table_name USING btree (a, b, c);
CREATE INDEX a_c_b_index ON table_name USING btree (a, c, b);
CREATE INDEX b_a_c_index ON table_name USING btree (b, a, c);
CREATE INDEX b_c_a_index ON table_name USING btree (b, c, a);
CREATE INDEX c_b_a_index ON table_name USING btree (c, b, a);
CREATE INDEX c_a_b_index ON table_name USING btree (c, a, b);


insert into table_name(a,b,c)
SELECT random() * 20 as a,
       random() * 20 as b,
       random() * 20 as c
from generate_series(0, 999);