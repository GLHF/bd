create table if not exists public.log_table
(
    id    SERIAL PRIMARY KEY,
    value text
);

create unlogged table if not exists public.unlog_table
(
    id    SERIAL PRIMARY KEY,
    value text
);