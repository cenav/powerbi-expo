-- estado pedido
select codigo, descripcion
  from tablas_auxiliares
 where tipo = 39
   and codigo <> '....'
 order by codigo;

create view powerbi.pbi_estado_pedido as
select codigo, descripcion
  from tablas_auxiliares
 where tipo = 39
   and codigo <> '....'
 order by codigo;

grant select on pevisa.tablas_auxiliares to powerbi;
