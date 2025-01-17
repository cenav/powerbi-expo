-- costo
select cod_art, cod_costo, costo
  from pcart_precios
 where cod_costo = '35';

create or replace view powerbi.pbi_costo as
select cod_art, cod_costo, costo
  from pcart_precios
 where cod_costo = '35';

select * from powerbi.pbi_costo;

