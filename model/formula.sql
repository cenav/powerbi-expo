grant select on pevisa.pcformulas to powerbi;

select * from pcmasters where cod_art = 'KIT FS 95242-07 W/H';

select * from pcformulas where cod_art = 'KIT FS 95242-07 W/H';

select cod_art
  from pcmasters;

select cod_art, cod_for, canti from pcformulas where cod_art = 'KIT FS 95242-07 W/H';

create or replace view powerbi.pbi_formula as
select cod_art, cod_for, canti from pevisa.pcformulas;

select * from powerbi.pbi_formula;
