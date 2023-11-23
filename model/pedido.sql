-- pedido
select numero, fecha, estado, pais, cod_cliente, zona as vendedor
  from expedidos
 where extract(year from fecha) between 2020 and 2023;

