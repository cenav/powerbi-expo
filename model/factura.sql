-- factura
select numero, fecha, estado, pais, cod_cliente, zona as vendedor, tbruto, tdescto, tseguro, tflete
     , tgasto, fob, cif, paclis as nro_packing, fecemb as f_embarque
  from exfacturas f
 where extract(year from fecha) between 2010 and 2024
   and nvl(estado, '0') != '9'
   and not exists(
   select 1
     from exfacturas_his
    where numero = f.numero
      and accion = '92'
   );

create view powerbi.pbi_factura as
select numero, fecha, estado, pais, cod_cliente, zona as vendedor, tbruto, tdescto, tseguro, tflete
     , tgasto, fob, cif, paclis as nro_packing, fecemb as f_embarque
  from exfacturas f
 where nvl(estado, '0') != '9'
   and not exists(
   select 1
     from exfacturas_his
    where numero = f.numero
      and accion = '92'
   );

grant select on pevisa.exfacturas_his to powerbi;

--  total mercaderia = 3395.59   total = 3469.20
select *
  from exfacturas
 where numero = 55016209
   and not exists(
   select *
     from exfacturas_historia
   );

select numero, fecha, estado, pais, cod_cliente, zona as vendedor, tbruto, tdescto, tseguro, tflete
     , tgasto, fob, cif
  from exfacturas
 where numero = 55016209
   and extract(year from fecha) between 2021 and 2023;

select *
  from itemdocu
 where tipodoc = '01'
   and serie = 'F055'
   and numero = '16529';

select *
  from docuvent
 where tipodoc = '01'
   and serie = 'F055'
   and numero = 16209;

select *
  from exfacturas_his
 where numero = 55016209
   and accion = '92';