-- grupo
select grupo as cod_grupo, descripcion, id_mega_grupo as cod_mega_grupo
  from tab_grupos;

create view powerbi.pbi_grupo as
select grupo as cod_grupo, descripcion, id_mega_grupo as cod_mega_grupo
  from tab_grupos;

grant select on pevisa.tab_grupos to powerbi;
