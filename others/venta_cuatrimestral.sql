-- venta_cuatrimestral
  with detalle as (
    select cod_vende, tipodoc, serie, numero, fecha, cod_grupo, cod_lin, cod_art, total_dolares
      from vw_venta_detalle
     where fecha between to_date('01/09/2023', 'dd/mm/yyyy') and to_date('31/12/2023', 'dd/mm/yyyy')
       and ((cod_vende in ('06', '27', '23', '05', '20', '11', '10', '15') and
             cod_grupo not in (1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 21, 26, 28, 37) and
             cod_lin not in ('227', '237', '247')) or
            cod_vende in ('61', '67', '62', '64', '65', '22'))
       and cod_megagrupo not in ('3000', '4000')
    )
select *
  from detalle
 where fecha between to_date('01/09/2023', 'dd/mm/yyyy') and to_date('31/12/2023', 'dd/mm/yyyy')
 order by fecha, tipodoc, numero;


select *
  from vendedores
 where cod_vendedor = '15';

select *
  from tab_grupos
 where ind_vta1 in ('4000')
 order by grupo;

  with detalle as (
    select cod_vende, tipodoc, serie, numero, fecha, cod_grupo, cod_lin, cod_art, total_dolares
         , cod_megagrupo
      from vw_venta_detalle
     where fecha between to_date('01/09/2023', 'dd/mm/yyyy') and to_date('31/12/2023', 'dd/mm/yyyy')
       and ((cod_vende in ('06', '27', '23', '05', '20', '11', '10', '15') and
             cod_grupo not in (1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 21, 26, 28, 37) and
             cod_lin not in ('227', '237', '247')) or
            (cod_vende in ('61', '67', '62', '64', '65') or
             (cod_vende in ('22') and cod_megagrupo not in ('3000', '4000'))))
    )
select *
  from detalle
 where cod_vende = '22'
   and fecha between to_date('01/12/2023', 'dd/mm/yyyy') and to_date('31/12/2023', 'dd/mm/yyyy')
 order by fecha, tipodoc, numero;
