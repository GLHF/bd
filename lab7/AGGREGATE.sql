

CREATE AGGREGATE complex_sum(complex) (
    sfunc = complex_sum,
    stype = complex,
    initcond = '(0,0)'
    );

CREATE AGGREGATE complex_multiplication(complex) (
    sfunc = complex_multiplication,
    stype = complex,
    initcond = '(0,0)'
    );