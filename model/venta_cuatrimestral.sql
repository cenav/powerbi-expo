-- venta_cuatrimestral
  with detalle as (
    select cod_vende, tipodoc, serie, numero, fecha, cod_grupo, cod_lin, cod_art, total_dolares
      from vw_venta_detalle
     where fecha between to_date('01/09/2023', 'dd/mm/yyyy') and to_date('31/12/2023', 'dd/mm/yyyy')
       and ((cod_vende in ('06', '27', '23', '05', '20', '11', '10', '15') and
             cod_grupo not in (1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 21, 26, 28, 37) and
             cod_lin not in ('227', '237', '247')) or
            cod_vende in ('61', '67', '62', '64', '65', '22'))
    )
select *
  from detalle
 order by fecha, tipodoc, numero;
