create type complex_matrix as (
    complex_matrix complex[],
    x int,
    y int
    );


CREATE OR REPLACE FUNCTION create_matrix(complex_arr complex[], x int, y int)
    RETURNS complex_matrix AS
$$
BEGIN
    RETURN (complex_arr, x, y) :: complex_matrix;
END;
$$
    language plpgsql;




CREATE OR REPLACE FUNCTION create_matrix(complex_x numeric[][], complex_i numeric[][])
    RETURNS complex_matrix AS
$$
    DECLARE
        x int;
        y int;
        complex_array complex[];
BEGIN
    IF (array_length(complex_x, 1) <> array_length(complex_i, 1) OR array_length(complex_x, 2) <> array_length(complex_i, 2)) THEN
        RAISE EXCEPTION 'Sizes is different';
    end if;
    x = array_length(complex_x, 1);
    y = array_length(complex_x, 2);
    for i in 1..x
        loop
            for j in 1..y
                loop
                    complex_array[i * x + j - x] = (complex_x[i][j], complex_i[i][j]) :: complex;
                end loop;
        end loop;
    RETURN (complex_array, x, y) :: complex_matrix;
END;
$$
    language plpgsql;



CREATE OR REPLACE FUNCTION get(x int, y int, matrix complex_matrix)
    RETURNS complex AS
$$
BEGIN
    IF (x > matrix.x OR x < 1 OR y < 1 OR y > matrix.y) THEN
        RAISE EXCEPTION 'Coordinates are out of bound';
    end if;

    RETURN matrix.complex_matrix[x * matrix.x + y - matrix.x];
END;
$$
    language plpgsql;



CREATE OR REPLACE FUNCTION set(x int, y int, matrix complex_matrix, value complex)
    RETURNS complex_matrix AS
$$
BEGIN
    IF (x > matrix.x OR x < 1 OR y < 1 OR y > matrix.y) THEN
        RAISE EXCEPTION 'Coordinates are out of bound';
    end if;
    matrix.complex_matrix[x * matrix.x + y - matrix.x] = value;
    RETURN matrix;
END;
$$
    language plpgsql;







-- AGGREGATE
CREATE OR REPLACE FUNCTION complex_sum_matrices(matrix1 complex_matrix, matrix2 complex_matrix)
    RETURNS complex_matrix AS
$$
BEGIN
    IF (matrix1.x <> matrix2.x OR matrix1.y <> matrix2.y) THEN
        RAISE EXCEPTION 'Matrix size is incorrect';
    end if;
    IF (matrix1 IS NULL) THEN
        RETURN matrix2;
    end if;
    for x in 1..matrix1.x
        loop
            for y in 1..matrix1.y
                loop
                    matrix1 =  set(x, y, matrix1,
                                   complex_sum(get(x, y, matrix1), get(x, y, matrix2)));
                end loop;
        end loop;
    RETURN matrix1;
END;
$$ LANGUAGE plpgsql;


CREATE AGGREGATE complex_sum_matrices(complex_matrix) (
    sfunc = complex_sum_matrices,
    stype = complex_matrix
    );





