-- pedido_d
select numero, nro, cod_eqi, cod_art, canti, preuni, x.descripcion as estado, id
  from expedido_d p
       join tablas_auxiliares x on p.estado_pk = x.codigo and x.tipo = 39
 where extract(year from fecha) between 2010 and 2024;

create view powerbi.pbi_pedido_d as
select numero, nro, cod_eqi, cod_art, canti, preuni, x.descripcion as estado, id
  from expedido_d p
       join tablas_auxiliares x on p.estado_pk = x.codigo and x.tipo = 39;

grant select on pevisa.expedidos to powerbi;
