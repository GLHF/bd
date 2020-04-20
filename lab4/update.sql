BEGIN;
update vacuum_table
    SET name = 'World hello!'
    where id = 1;
END;