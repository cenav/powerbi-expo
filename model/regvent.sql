-- regvent
select d.tipodoc, d.serie, d.numero, d.fecha, f.cod_cliente, zona as vendedor, imp_neto, imp_gastos
     , imp_descto, imp_fletes, imp_seguros
  from docuvent d
       join tablas_auxiliares t on t.codigo = d.tipodoc
       left join exfacturas f
                 on d.tipodoc = f.tipodoc
                   and d.serie = f.serie
                   and 55000000 + d.numero = f.numero
 where nvl(d.estado, '0') != '9'
   and t.tipo = 2
   and nvl(d.origen, '0') = 'EXPO'
--    and d.numero = '16209'
   and not exists(
   select 1
     from exfacturas_his
    where numero = f.numero
      and accion = '92'
   )
   and extract(year from d.fecha) between 2020 and 2023;


-- registro venta excel
select d.tipodoc, t.descripcion, d.serie, d.numero as numero_factura, d.fecha, d.cod_cliente
     , cod_vende, decode(d.estado, '9', '<<*** A N U L A D O ***>>',
                         f_cliente_nombre(d.cod_cliente)) as nombre
     , decode(d.estado, '9', 0,
              decode(imp_igv, 0, 0,
                     (decode(
                         :P_MONEDA,
                         'D', decode(
                             d.moneda,
                             'S',
                             (d.imp_neto / d.import_cam),
                             d.imp_neto),
                         d.simp_neto)))) as imp_neto
     , decode(d.estado, '9', 0, decode(imp_igv, 0, (decode(:P_MONEDA, 'D', decode(d.moneda, 'S',
                                                                                  (d.imp_neto / d.import_cam),
                                                                                  d.imp_neto),
                                                           d.simp_neto)), 0)) as imp_exon
     , decode(d.estado, '9', 0,
              decode(:P_MONEDA, 'D', decode(d.moneda, 'S', (d.imp_igv / d.import_cam), d.imp_igv),
                     d.simp_igv)) as imp_igv
     , decode(d.estado, '9', 0, decode(:P_MONEDA, 'D',
                                       decode(d.moneda, 'S', (d.precio_vta / d.import_cam),
                                              d.precio_vta), d.sprecio_vta)) as precio_vta
     , decode(d.estado, '9', 0, decode(:P_MONEDA, 'D',
                                       decode(d.moneda, 'S', (d.imp_fletes / d.import_cam),
                                              d.imp_fletes), d.simp_fletes)) as imp_fletes
     , decode(d.estado, '9', 0, decode(:P_MONEDA, 'D',
                                       decode(d.moneda, 'S', (d.imp_seguros / d.import_cam),
                                              d.imp_seguros), d.simp_seguros)) as imp_seguros
     , decode(d.estado, '9', 0, decode(:P_MONEDA, 'D',
                                       decode(d.moneda, 'S', (d.imp_gastos / d.import_cam),
                                              d.imp_gastos), d.simp_gastos)) as imp_gastos
     , decode(d.estado, '9', 0, decode(:P_MONEDA, 'D',
                                       decode(d.moneda, 'S', (d.imp_descto / d.import_cam),
                                              d.imp_descto), d.simp_descto)) as imp_descto
     , d.tip_doc_ref, d.ser_doc_ref, d.nro_doc_ref, decode(d.tipodoc, '07', d.detalle,
                                                           (decode(d.tipodoc, '08', d.detalle, null))) as detall
  from docuvent d
     , tablas_auxiliares t
 where extract(year from d.fecha) between 2019 and 2023
   and t.tipo = 2
   and (t.codigo = d.tipodoc)
   and nvl(d.origen, '0') = 'EXPO'
 order by d.tipodoc, d.serie, d.numero, d.fecha;


-- regvent_d
select i.tipodoc, i.serie, i.numero, i.cod_art, cod_lin, i.cantidad, i.precio_de_lista
     , i.por_desc1, i.por_desc2, i.por_desc3, i.neto
  from docuvent d
       join itemdocu i on d.tipodoc = i.tipodoc and d.serie = i.serie and d.numero = i.numero
       join tablas_auxiliares t on t.codigo = d.tipodoc
 where nvl(d.estado, '0') != '9'
   and t.tipo = 2
   and nvl(d.origen, '0') = 'EXPO'
--    and i.tipodoc = '01'
--    and i.serie = 'F055'
--    and i.numero = '16531'
   and extract(year from d.fecha) between 2021 and 2023;

-- facturas enlace docuvent
select c.nombre, to_char(f.fecemb, 'DD/MM/YYYY'), p.abrevia
  from exfacturas f
     , excondpago c
     , expaises p
 where f.cond_pago = c.cond_pago
   and f.pais = p.pais
   and numero = 55000000 + rec.numero_factura;

