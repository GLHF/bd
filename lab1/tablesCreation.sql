create table if not exists public.table1(
    id     SERIAL PRIMARY KEY,
    value1 text
);

create table public.table2(
    id     SERIAL PRIMARY KEY,
    value2 text
);
ALTER TABLE public.table2
    ALTER COLUMN value2
        SET STORAGE PLAIN;

create table public.table3(
    id     SERIAL PRIMARY KEY,
    value3 text
);
ALTER TABLE public.table3
    ALTER COLUMN value3
        SET STORAGE EXTERNAL;

create table public.table4(
    id     SERIAL PRIMARY KEY,
    value4 text
);
ALTER TABLE public.table4
    ALTER COLUMN value4
        SET STORAGE MAIN;
