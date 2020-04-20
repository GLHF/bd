create table if not exists public.ff_table1(
                                               id     SERIAL PRIMARY KEY,
                                               value varchar(100),
                                               date date
);
ALTER TABLE ff_table1 set (FILLFACTOR = 50);

create table if not exists public.ff_table2(
                                               id     SERIAL PRIMARY KEY,
                                               value varchar(100),
                                               date date
);
ALTER TABLE ff_table2 set (FILLFACTOR = 75);

create table if not exists public.ff_table3(
                                               id     SERIAL PRIMARY KEY,
                                               value varchar(100),
                                               date date
);
ALTER TABLE ff_table3 set (FILLFACTOR = 90);

create table if not exists public.ff_table4(
                                               id     SERIAL PRIMARY KEY,
                                               value varchar(100),
                                               date date
);
ALTER TABLE ff_table4 set (FILLFACTOR = 100);