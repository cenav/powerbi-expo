-- vendedor
select codigo, descripcion
  from extablas_expo
 where tipo = '13'
   and codigo != '....'
 order by 1;


create or replace view powerbi.pbi_vendedor as
select codigo, descripcion
  from extablas_expo
 where tipo = '13'
   and codigo != '....'
 order by 1;


grant select on pevisa.extablas_expo to powerbi;
