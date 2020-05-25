CREATE EXTENSION IF NOT EXISTS pg_prewarm;

SELECT pg_prewarm('warm1');
SELECT pg_prewarm('warm2');
SELECT pg_prewarm('warm3');