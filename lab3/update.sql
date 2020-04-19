BEGIN;
update hub
set id    = rand_table.newid,
    value = 'New value'
from (select round(random() * 999999) as newid, round(random() * 999999) as oldid from generate_series (1,10000)) as rand_table
where id = rand_table.oldid;
END;
