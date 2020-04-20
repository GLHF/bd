SELECT class.oid AS "OID",
       relname AS "Table name",
       reltoastrelid AS "TOAST table",
       pg_relation_filepath(class.oid) AS "Path",
       pg_size_pretty(pg_relation_size(class.oid)) AS "Relation size" FROM pg_class class WHERE relname LIKE 'table_';