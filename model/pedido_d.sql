-- pedido_d
select numero, nro, cod_eqi, cod_art, canti, preuni
  from expedido_d
 where extract(year from fecha) between 2020 and 2023
   and id is null;
