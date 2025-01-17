-- cliente
select e.cod_cliente, e.nombre, v.nombre_corp, v.nombre_suc
  from exclientes e
       left join exclientes_varios v on e.cod_cliente = v.cod_cliente;

create view powerbi.pbi_cliente as
select e.cod_cliente, e.nombre, v.nombre_corp, v.nombre_suc
  from exclientes e
       left join exclientes_varios v on e.cod_cliente = v.cod_cliente;

grant select on pevisa.exclientes_varios to powerbi;
