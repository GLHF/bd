create table examples(
    id serial primary key ,
    num1 complex,
    num2 complex,
    sum complex,
    sub complex,
    mult complex,
    div complex
)



select equal(complex_sum(examples.num1, examples.num2), examples.sum, 2) as sum,
       equal(complex_subtraction(examples.num1, examples.num2), examples.sub, 2)  as sub,
       equal(complex_multiplication(examples.num1, examples.num2), examples.mult, 2) as mult,
       equal( complex_division(examples.num1, examples.num2), examples.div, 2)  as div,
       examples.*
from examples;



-- Сравнение
CREATE OR REPLACE FUNCTION equal(num1 complex, num2 complex, accuracy int)
    RETURNS boolean AS
$$
BEGIN
    RETURN round(num1.real_num, accuracy) = round(num2.real_num, accuracy) AND round(num1.imaginary_num, accuracy) = round(num2.imaginary_num, accuracy);
END;
$$ LANGUAGE plpgsql;