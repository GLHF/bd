CREATE OR REPLACE RULE update_part1_inbound
    AS ON UPDATE TO hub WHERE NEW.id BETWEEN 0 AND 99999(
    DO INSTEAD UPDATE part1
                SET value = NEW.value, id = NEW.id
                WHERE id = OLD.id;
    );

CREATE OR REPLACE RULE update_part2_inbound
    AS ON UPDATE TO hub WHERE NEW.id BETWEEN 100000 AND 199999
    DO INSTEAD UPDATE part2
               SET value = NEW.value, id = NEW.id
               WHERE id = OLD.id;

CREATE OR REPLACE RULE update_part3_inbound
    AS ON UPDATE TO hub WHERE NEW.id BETWEEN 200000 AND 299999
    DO INSTEAD UPDATE part3
               SET value = NEW.value, id = NEW.id
               WHERE id = OLD.id;

CREATE OR REPLACE RULE update_part4_inbound
    AS ON UPDATE TO hub WHERE NEW.id BETWEEN 300000 AND 399999
    DO INSTEAD UPDATE part4
               SET value = NEW.value, id = NEW.id
               WHERE id = OLD.id;

CREATE OR REPLACE RULE update_part5_inbound
    AS ON UPDATE TO hub WHERE NEW.id BETWEEN 400000 AND 499999
    DO INSTEAD UPDATE part5
               SET value = NEW.value, id = NEW.id
               WHERE id = OLD.id;

CREATE OR REPLACE RULE update_part6_inbound
    AS ON UPDATE TO hub WHERE NEW.id BETWEEN 500000 AND 599999
    DO INSTEAD UPDATE part6
               SET value = NEW.value, id = NEW.id
               WHERE id = OLD.id;

CREATE OR REPLACE RULE update_part7_inbound
    AS ON UPDATE TO hub WHERE NEW.id BETWEEN 600000 AND 699999
    DO INSTEAD UPDATE part7
               SET value = NEW.value, id = NEW.id
               WHERE id = OLD.id;

CREATE OR REPLACE RULE update_part8_inbound
    AS ON UPDATE TO hub WHERE NEW.id BETWEEN 700000 AND 799999
    DO INSTEAD UPDATE part8
               SET value = NEW.value, id = NEW.id
               WHERE id = OLD.id;

CREATE OR REPLACE RULE update_part9_inbound
    AS ON UPDATE TO hub WHERE NEW.id BETWEEN 800000 AND 899999
    DO INSTEAD UPDATE part9
               SET value = NEW.value, id = NEW.id
               WHERE id = OLD.id;

CREATE OR REPLACE RULE update_part10_inbound
    AS ON UPDATE TO hub WHERE NEW.id BETWEEN 900000 AND 999999
    DO INSTEAD UPDATE part10
               SET value = NEW.value, id = NEW.id
               WHERE id = OLD.id;




CREATE OR REPLACE RULE update_part1_outbound
    AS ON UPDATE TO hub WHERE (NEW.id NOT BETWEEN 0 AND 99999) AND (OLD.id BETWEEN 0 AND 99999)
    DO INSTEAD (
    INSERT INTO hub
    VALUES (NEW.id, NEW.value);
    DELETE FROM part1 WHERE id = OLD.id;
    );

CREATE OR REPLACE RULE update_part2_outbound
    AS ON UPDATE TO hub WHERE (NEW.id NOT BETWEEN 100000 AND 199999) AND (OLD.id BETWEEN 100000 AND 199999)
    DO INSTEAD (
    INSERT INTO hub VALUES (NEW.id, NEW.value);
    DELETE FROM part2 WHERE id = OLD.id;
    );

CREATE OR REPLACE RULE update_part3_outbound
    AS ON UPDATE TO hub WHERE (NEW.id NOT BETWEEN 200000 AND 29999) AND (OLD.id BETWEEN 200000 AND 299999)
    DO INSTEAD (
    INSERT INTO hub
    VALUES (NEW.id, NEW.value);
    DELETE
    FROM part3
    WHERE id = OLD.id;
    );

CREATE OR REPLACE RULE update_part4_outbound
    AS ON UPDATE TO hub WHERE (NEW.id NOT BETWEEN 300000 AND 399999) AND (OLD.id BETWEEN 300000 AND 399999)
    DO INSTEAD (
    INSERT INTO hub
    VALUES (NEW.id, NEW.value);
    DELETE
    FROM part4
    WHERE id = OLD.id;
    );

CREATE OR REPLACE RULE update_part5_outbound
    AS ON UPDATE TO hub WHERE (NEW.id NOT BETWEEN 400000 AND 499999) AND (OLD.id BETWEEN 400000 AND 499999)
    DO INSTEAD (
    INSERT INTO hub
    VALUES (NEW.id, NEW.value);
    DELETE
    FROM part5
    WHERE id = OLD.id;
    );

CREATE OR REPLACE RULE update_part6_outbound
    AS ON UPDATE TO hub WHERE (NEW.id NOT BETWEEN 500000 AND 599999) AND (OLD.id BETWEEN 500000 AND 599999)
    DO INSTEAD (
    INSERT INTO hub
    VALUES (NEW.id, NEW.value);
    DELETE
    FROM part6
    WHERE id = OLD.id;
    );

CREATE OR REPLACE RULE update_part7_outbound
    AS ON UPDATE TO hub WHERE (NEW.id NOT BETWEEN 600000 AND 699999) AND (OLD.id BETWEEN 600000 AND 699999)
    DO INSTEAD (
    INSERT INTO hub
    VALUES (NEW.id, NEW.value);
    DELETE
    FROM part7
    WHERE id = OLD.id;
    );

CREATE OR REPLACE RULE update_part8_outbound
    AS ON UPDATE TO hub WHERE (NEW.id NOT BETWEEN 700000 AND 799999) AND (OLD.id BETWEEN 700000 AND 799999)
    DO INSTEAD (
    INSERT INTO hub
    VALUES (NEW.id, NEW.value);
    DELETE
    FROM part8
    WHERE id = OLD.id;
    );

CREATE OR REPLACE RULE update_part9_outbound
    AS ON UPDATE TO hub WHERE (NEW.id NOT BETWEEN 800000 AND 899999) AND (OLD.id BETWEEN 800000 AND 899999)
    DO INSTEAD (
    INSERT INTO hub
    VALUES (NEW.id, NEW.value);
    DELETE
    FROM part9
    WHERE id = OLD.id;
    );

CREATE OR REPLACE RULE update_part10_outbound
    AS ON UPDATE TO hub WHERE (NEW.id NOT BETWEEN 900000 AND 999999) AND (OLD.id BETWEEN 900000 AND 999999)
    DO INSTEAD (
    INSERT INTO hub
    VALUES (NEW.id, NEW.value);
    DELETE
    FROM part10
    WHERE id = OLD.id;
    );
