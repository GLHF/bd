CREATE TABLE table1
(
    a1 bigint,
    a2 bigint,
    a3 bigint
);

CREATE TABLE table2
(
    b1 bigint,
    b2 bigint,
    b3 bigint
);


CREATE TABLE table3
(
    c1 bigint,
    c2 bigint,
    c3 bigint
);

insert into table1
SELECT random() * 999999 as a,
       random() * 999999 as b,
       random() * 999999 as c
from generate_series(0, 4000);

insert into table2
SELECT random() * 999999 as a,
       random() * 999999 as b,
       random() * 999999 as c
from generate_series(0, 4000);

insert into table3
SELECT random() * 999999 as a,
       random() * 999999 as b,
       random() * 999999 as c
from generate_series(0, 4000);
