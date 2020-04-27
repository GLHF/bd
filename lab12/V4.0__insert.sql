INSERT INTO sample_table
SELECT round(random() * 200), round(random() * 200) from generate_series(1, 1000);