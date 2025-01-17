-- pedido
select numero, fecha, estado, pais, cod_cliente, zona as vendedor, fflete
  from expedidos
 where extract(year from fecha) between 2010 and 2024;

create or replace view powerbi.pbi_pedido as
  with prioridad_marcada as (
    select id_pedido
      from view_pedidos_pendientes_38
     where exists (
       select 1
         from pr_embarques p
              join pr_programa_embarques_id i
                   on p.ano_embarque = i.ano
                     and p.mes_embarque = i.mes
                     and i.estado = 1
        where p.id_pedido =
              view_pedidos_pendientes_38.id_pedido
       )
     union
    select id_pedido
      from view_pedidos_pendientes_38
     where cod_cliente in (
       select gcc.cod_cliente
         from grupo_cliente gc
              join grupo_cliente_cliente gcc on gc.cod_grupo = gcc.cod_grupo
        where gc.es_simulacion = 1
       )
    )
select p.numero, p.fecha, p.estado, p.pais, p.cod_cliente, p.zona as vendedor, p.fflete
     , case when m.id_pedido is not null then 1 else 0 end as prioridad_trabaja
  from expedidos p
       left join prioridad_marcada m on p.numero = m.id_pedido;

select *
  from powerbi.pbi_pedido
 where extract(year from fecha) = 2024
   and extract(month from fecha) = 10;


grant select on pevisa.view_pedidos_pendientes_38 to powerbi;
