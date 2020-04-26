SELECT * FROM table1
                  INNER JOIN table2 t on table1.a1 = t.b1
                  RIGHT JOIN table3 t2 on table1.a3 = t2.c3
                  LEFT JOIN table2 t3 on table1.a2 = t3.b3
                  RIGHT OUTER JOIN table3 t4 on table1.a1 = t4.c3
                  LEFT OUTER JOIN table1 t5 on table1.a1 = t5.a3
                  LEFT OUTER JOIN table1 t6 on table1.a2 = t6.a1