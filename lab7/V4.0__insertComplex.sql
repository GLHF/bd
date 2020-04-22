BEGIN ;
insert into complex_table (num) SELECT (random() + 1, random()  + 1) :: complex from generate_series(1, 1000);
END;
