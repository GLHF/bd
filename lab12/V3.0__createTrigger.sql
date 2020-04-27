
CREATE OR REPLACE FUNCTION insert_sample_view() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO sample_table VALUES (NEW.type_name, NEW.sum);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insert_trigger
    INSTEAD OF INSERT ON view_sample
    FOR EACH ROW EXECUTE FUNCTION insert_sample_view();