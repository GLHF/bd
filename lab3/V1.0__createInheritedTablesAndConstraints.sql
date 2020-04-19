CREATE TABLE if not exists hub(
    id int ,
    value text
);


CREATE TABLE if not exists public.part1() INHERITS (hub);
CREATE TABLE if not exists public.part2() INHERITS (hub);
CREATE TABLE if not exists public.part3() INHERITS (hub);
CREATE TABLE if not exists public.part4() INHERITS (hub);
CREATE TABLE if not exists public.part5() INHERITS (hub);
CREATE TABLE if not exists public.part6() INHERITS (hub);
CREATE TABLE if not exists public.part7() INHERITS (hub);
CREATE TABLE if not exists public.part8() INHERITS (hub);
CREATE TABLE if not exists public.part9() INHERITS (hub);
CREATE TABLE if not exists public.part10() INHERITS (hub);


ALTER TABLE part1 ADD CONSTRAINT partition_check
    CHECK (id>=0 and id<100000);
ALTER TABLE part2 ADD CONSTRAINT partition_check
    CHECK (id>=100000 and id<200000);
ALTER TABLE part3 ADD CONSTRAINT partition_check
    CHECK (id>=200000 and id<300000);
ALTER TABLE part4 ADD CONSTRAINT partition_check
    CHECK (id>=300000 and id<400000);
ALTER TABLE part5 ADD CONSTRAINT partition_check
    CHECK (id>=400000 and id<500000);
ALTER TABLE part6 ADD CONSTRAINT partition_check
    CHECK (id>=500000 and id<600000);
ALTER TABLE part7 ADD CONSTRAINT partition_check
    CHECK (id>=600000 and id<700000);
ALTER TABLE part8 ADD CONSTRAINT partition_check
    CHECK (id>=700000 and id<800000);
ALTER TABLE part9 ADD CONSTRAINT partition_check
    CHECK (id>=800000 and id<900000);
ALTER TABLE part10 ADD CONSTRAINT partition_check
    CHECK (id>=900000 and id<1000000);