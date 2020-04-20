select attr.attname,
       t.typname,
       case
           when attstorage =
                'p' then
               'plain'
           when attstorage =
                'x' then
               'extended'
           when attstorage =
                'e' then
               'external'
           when attstorage =
                'm' then
               'main'
           end as attstorage
FROM pg_attribute attr
         INNER JOIN
     pg_type t ON t.OID = attr.atttypid
where attname LIKE 'value%';
