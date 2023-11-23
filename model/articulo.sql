-- articulo
select cod_art, descripcion, cod_lin, unidad
  from articul;
--  where cod_lin between '01' and '99'
--    and length(cod_lin) = 2;

select * from articul
where cod_art like '%B0506%';