SELECT class.relname                                     AS "Table name",
       pg_size_pretty(pg_total_relation_size(class.oid)) AS "Size",
       relpages                                          AS "Pages count"
FROM pg_class class
         left join pg_index i on class.reltoastrelid = i.indrelid
         WHERE class.relname LIKE 'ff_table_';