BEGIN;
INSERT INTO unlog_table(value) SELECT random_string(1000);
END;