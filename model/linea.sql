-- linea
select linea as cod_linea, descripcion, grupo as cod_grupo
  from tab_lineas;

create view powerbi.pbi_linea as
select linea as cod_linea, descripcion, grupo as cod_grupo
  from tab_lineas;

grant select on pevisa.tab_lineas to powerbi;
