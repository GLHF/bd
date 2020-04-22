

CREATE OR REPLACE FUNCTION complex_sum_matrices(matrix1 complex[][], matrix2 complex[][])
    RETURNS complex[][] AS
$$
BEGIN
    IF (array_length(matrix1, 1) <> array_length(matrix2, 1) OR
        array_length(matrix1, 2) <> array_length(matrix2, 2)) THEN
        RAISE EXCEPTION 'Matrix size is incorrect';
    end if;
    IF (matrix1 IS NULL) THEN
        return matrix2;
    end if;
    for x in 1..array_length(matrix1, 1)
        loop
            for y in 1..array_length(matrix1, 2)
                loop
                    matrix1[x][y] = complex_sum(matrix1[x][y], matrix2[x][y]);
                end loop;
        end loop;
    RETURN matrix1;
END;
$$ LANGUAGE plpgsql;


CREATE AGGREGATE complex_sum_matrices(complex[][]) (
    sfunc = complex_sum_matrices,
    stype = complex[][]
    );




