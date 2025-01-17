-- pais
select pais, nombre, abrevia from expaises ;

create view powerbi.pbi_pais as
select pais, nombre, abrevia from expaises ;

grant select on pevisa.expaises to powerbi;
