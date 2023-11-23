-- estado pedido
select codigo, descripcion
  from tablas_auxiliares
 where tipo = 39
   and codigo <> '....'
 order by codigo;
