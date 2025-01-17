-- mega_grupo
select id as cod_mega_grupo, descripcion
  from tab_mega_grupos;

create view powerbi.pbi_mega_grupo as
select id as cod_mega_grupo, descripcion
  from tab_mega_grupos;

grant select on pevisa.tab_mega_grupos to powerbi;
