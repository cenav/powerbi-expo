-- factura_d
select d.numero, nro, cod_eqi, cod_art, linea, canti, preuni, saldo, totlin, flete
     , d.seguro, gastos, otros, d.fob, d.cif, marca
  from exfacturas f
       join exfactura_d d on f.numero = d.numero
 where extract(year from f.fecha) between 2010 and 2024
   and nvl(estado, '0') != '9'
   and id is null
   and not exists(
   select 1
     from exfacturas_his h
    where h.numero = f.numero
      and h.accion = '92'
   );

create view powerbi.pbi_factura_d as
select d.numero, nro, cod_eqi, cod_art, linea, canti, preuni, saldo, totlin, flete
     , d.seguro, gastos, otros, d.fob, d.cif, marca
  from exfacturas f
       join exfactura_d d on f.numero = d.numero
 where nvl(estado, '0') != '9'
   and id is null
   and not exists(
   select 1
     from exfacturas_his h
    where h.numero = f.numero
      and h.accion = '92'
   );

grant select on pevisa.exfactura_d to powerbi;

-- 379.98
select *
  from exfactura_d
 where numero = 55009358
   and cod_art = 'KIT AUT FS 24000';

select *
  from itemdocu
 where tipodoc = '01'
   and serie = 'F055'
   and numero = '9358'
   and cod_art = 'KIT AUT FS 24000';

select *
  from v_exfacturas
 where pedido = 10310;

-- factura_pedido
select numero as factura, pedido
  from v_exfacturas;