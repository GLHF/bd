BEGIN;
INSERT INTO log_table(value) SELECT random_string(1000);
END;