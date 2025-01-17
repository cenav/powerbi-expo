--nota_credito
select fc.serie_num as serie, fc.numero, fc.fecha, fc.importe
     , 55000000 + fc.nro_referencia as nro_factura
     , d.detalle
  from factcob fc
     , docuvent d
 where d.tipodoc = fc.tipdoc
   and d.serie = fc.serie_num
   and d.numero = fc.numero
   and fc.tipdoc in ('07')
   and fc.serie_num not in ('F056')
   and fc.cod_cliente like '00000%'
   and vended is not null
   and vended != 'E7'
   and extract(year from fc.fecha) between 2010 and 2024
 order by fc.numero;


create view powerbi.pbi_nota_credito as
select fc.serie_num as serie, fc.numero, fc.fecha, fc.importe
     , 55000000 + fc.nro_referencia as nro_factura
     , d.detalle
  from factcob fc
     , docuvent d
 where d.tipodoc = fc.tipdoc
   and d.serie = fc.serie_num
   and d.numero = fc.numero
   and fc.tipdoc in ('07')
   and fc.serie_num not in ('F056')
   and fc.cod_cliente like '00000%'
   and vended is not null
   and vended != 'E7'
 order by fc.numero;

grant select on pevisa.docuvent to powerbi;
