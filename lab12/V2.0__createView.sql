CREATE VIEW view_sample as
    SELECT type_name, sum(value) from sample_table group by type_name;