
--Тригерная функция для апдейта таблицы-партиции на update
--Если id находятся в зоне ответственности одной партиции, происходит обычный update *1
--Иначе если необходимо будет создана новая таблица, после чего из текущей партиции запись будет удалена, а в другую добавлена
CREATE OR REPLACE FUNCTION part_change_function()
    RETURNS trigger AS
$$
DECLARE
    title    varchar;
    part     int;
    old_name varchar;
BEGIN
    IF (OLD.id = NEW.id) then
        return NULL;
    end if;
    part = round(NEW.id / 100000);
    old_name = 'part' || round(OLD.id / 100000);
    title = 'part' || part;
    IF (part = round(OLD.id / 100000)) then
        return NEW;
    end if;
    PERFORM create_part_table_if_not_exist( part);
    EXECUTE format('INSERT INTO %s(id, value) values (%s, ''%s'');', title, NEW.id, OLD.value);
    NEW.id = OLD.id;
    return NEW;
END;
$$
    language plpgsql;



CREATE OR REPLACE FUNCTION part_change_function_after()
RETURNS trigger AS
$$
BEGIN
    EXECUTE format('DELETE FROM part%s WHERE id = %s AND value = %L', round(OLD.id / 100000), OLD.id, OLD.value);
    return NULL;
END;
$$
    language plpgsql;


--Вынес в отдельную функцию создание партиционной таблицы если она еще не была создана
--Таблица создается с констреинтом для ее зоны ответственности id и тригерамим для функционала апдейта. Они представлены выше
CREATE OR REPLACE FUNCTION create_part_table_if_not_exist(part int)
    RETURNS void AS
$$
    DECLARE
        title text;
BEGIN
        title = format('part%s', part);
    IF (NOT exists(SELECT
                   FROM information_schema.tables
                   WHERE table_schema = 'public'
                     and information_schema.tables.table_name LIKE title)) then
        EXECUTE format('CREATE TABLE part%s() INHERITS (hub);', part);
        EXECUTE format('ALTER TABLE part%s ADD CONSTRAINT partition_check CHECK (id>= %s and ' ||
                       'id< %s);', part, part * 100000, (part * 100000 + 100000));
        EXECUTE format('
                    create TRIGGER part%s_trigger
                        BEFORE UPDATE
                        ON part%s
                        FOR EACH row
                    EXECUTE FUNCTION part_change_function();', part, part);
        EXECUTE format('
                    create TRIGGER part%s_trigger_after
                        AFTER UPDATE
                        ON part%s
                        FOR EACH row
                    EXECUTE FUNCTION part_change_function_after();', part, part);

    end if;
END;
$$
    language plpgsql;



--Тригерная функция для хаб таблицы на insert/update
--В случае добавления при необходимости создает соответствующую парицию и добавляет в нее запись.
CREATE OR REPLACE FUNCTION hub_change_function()
    RETURNS trigger AS
$$
DECLARE
    part     int;
BEGIN
    part = round(NEW.id / 100000);
    PERFORM create_part_table_if_not_exist(part);
    EXECUTE format('insert into part%s(id, value) values (%s, %L);', part, NEW.id, NEW.value);
    return NULL;
END;
$$
    language plpgsql;


create TRIGGER change_hub_trigger
    BEFORE INSERT
    ON hub
    FOR EACH ROW
EXECUTE FUNCTION hub_change_function();
