BEGIN;
update hub
set id    = rand_table.newid
from (select round(random() * 499999) as newid, round(random() * 499999 + 500000) as oldid from generate_series (1,100000)) as rand_table
where id = rand_table.oldid;
END;