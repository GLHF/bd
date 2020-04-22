-- Сложение
CREATE OR REPLACE FUNCTION complex_sum(num1 complex,num2 complex)
    RETURNS complex AS
$$
    BEGIN
    RETURN ROW (num1.real_num + num2.real_num, num1.imaginary_num + num2.imaginary_num) :: complex;
    END;
$$ LANGUAGE plpgsql;


-- Вычитание
CREATE OR REPLACE FUNCTION complex_subtraction(num1 complex,num2 complex)
    RETURNS complex AS
$$
BEGIN
    RETURN ROW (num1.real_num - num2.real_num, num1.imaginary_num - num2.imaginary_num) :: complex;
END;
$$ LANGUAGE plpgsql;


-- Умножение
CREATE OR REPLACE FUNCTION complex_multiplication(num1 complex,num2 complex)
    RETURNS complex AS
$$
BEGIN
    RETURN ROW (num1.real_num * num2.real_num - num1.imaginary_num * num2.imaginary_num,
        num1.imaginary_num * num2.real_num + num1.real_num * num2.imaginary_num) :: complex;
END;
$$ LANGUAGE plpgsql;


-- Деление
CREATE  OR REPLACE FUNCTION complex_division(num1 complex,num2 complex)
    RETURNS complex AS
$$
    DECLARE
        denominator NUMERIC;

BEGIN
        denominator = num2.real_num^2 + num2.imaginary_num^2;
    RETURN ROW ((num1.real_num * num2.real_num + num1.imaginary_num * num2.imaginary_num) / denominator,
        (num1.imaginary_num * num2.real_num - num1.real_num * num2.imaginary_num) / denominator) :: complex;
END;
$$ LANGUAGE plpgsql;




CREATE AGGREGATE complex_sum(complex) (
    sfunc = complex_sum,
    stype = complex,
    initcond = '(0,0)'
    );

CREATE AGGREGATE complex_multiplication(complex) (
    sfunc = complex_multiplication,
    stype = complex,
    initcond = '(1,1)'
    );



