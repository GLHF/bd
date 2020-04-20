create table if not exists vacuum_table
(
    id    int,
    name text
);

ALTER TABLE vacuum_table SET (
    autovacuum_enabled = false, toast.autovacuum_enabled = false
);

insert into vacuum_table (id, name)
values (1, 'Hello world!');
