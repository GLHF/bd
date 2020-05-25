CREATE EXTENSION pg_prewarm;

SELECT pg_prewarm('tbl1');
SELECT pg_prewarm('tbl2');
SELECT pg_prewarm('tbl3');