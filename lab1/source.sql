create table public.source(
                              id     SERIAL PRIMARY KEY,
                              value text
);

CREATE OR REPLACE FUNCTION fill_source(n integer)
    returns void AS
$$
DECLARE
    count    integer;
BEGIN
    FOR count IN 1..n
        LOOP
            insert into source (value) values (random_string(10000));
        END LOOP;
END;
$$
    LANGUAGE 'plpgsql' VOLATILE
                       SECURITY DEFINER
                       COST 100;

select fill_source(100);