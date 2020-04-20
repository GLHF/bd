CREATE OR REPLACE FUNCTION random_string(n integer)
    RETURNS character varying AS
$$
DECLARE
    count    integer;
    retValue varchar;
BEGIN
    retValue := '';
    FOR count IN 1..n
        LOOP
            retValue := retValue || chr((floor(random() * 26 + 65))::integer);
        END LOOP;
    RETURN retValue;
END;
$$
    LANGUAGE 'plpgsql' VOLATILE
                       SECURITY DEFINER
                       COST 100;
