-- vendedor
select codigo, descripcion
  from extablas_expo
 where tipo = '13'
   and codigo != '....'
 order by 1;
