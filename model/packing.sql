-- packing [[generar al final]]
select d.pk_numero as nro_packing, d.numero as nro_pedido, d.cod_art, d.cod_eqi, d.canti, e.preuni
     , round(d.canti * e.preuni, 2) as total_linea, d.ot_numero
  from pk_detal d
     , expedido_d e
 where d.numero = e.numero
   and d.nro_ped = e.nro
   and exists(
   select 1
     from exfacturas f
    where extract(year from f.fecha) between 2010 and 2024
--    where extract(year from f.fecha) = 2024
--       and extract(month from f.fecha) = 9
      and nvl(f.estado, '0') != '9'
      and f.paclis = d.pk_numero
      and not exists(
      select 1
        from exfacturas_his h
       where h.numero = f.numero
         and h.accion = '92'
      )
   );

create view powerbi.pbi_packing as
select d.pk_numero as nro_packing, d.numero as nro_pedido, d.cod_art, d.cod_eqi, d.canti, e.preuni
     , round(d.canti * e.preuni, 2) as total_linea, d.ot_numero
  from pk_detal d
     , expedido_d e
 where d.numero = e.numero
   and d.nro_ped = e.nro
   and exists(
   select 1
     from exfacturas f
    where nvl(f.estado, '0') != '9'
      and f.paclis = d.pk_numero
      and not exists(
      select 1
        from exfacturas_his h
       where h.numero = f.numero
         and h.accion = '92'
      )
   );

grant select on pevisa.expedido_d to powerbi;

select d.pk_numero as nro_packing, d.numero as nro_pedido, d.cod_art, d.cod_eqi, d.canti, e.preuni
     , round(d.canti * e.preuni, 2) as total_linea, d.ot_numero
  from pk_detal d
     , expedido_d e
 where d.pk_serie = 1
   and d.pk_numero = 56249
   and d.numero = 15974
   and d.numero = e.numero
   and d.nro_ped = e.nro
 order by d.numero, d.cod_art, d.numero, d.paleta, d.caja;

select *
  from exfacturas
 where paclis = 56249;

select *
  from expedido_d
 where numero = 15974
   and cod_art = 'KIT SB CH 92008 TG';

select *
  from pk_gnumero
 where pk_numero = 56249;

select distinct pk_serie, pk_numero, numero
  from pk_glosa
 where pk_serie = 1
   and pk_numero = 56249;

select d.*
  from exfacturas e
       join exfactura_d d on e.numero = d.numero
 where e.paclis = 56249
   and d.cod_art = 'KIT SB CH 92008 TG';


create index pevisa.idx_pk_detal_pedido on pevisa.pk_detal(numero, nro_ped)
  tablespace pevisax;