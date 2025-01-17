declare
  c_directory constant varchar2(32767) := 'ARCHIVO_PAGOS_DIR';
  c_filename  constant varchar2(32767) := 'canastas.xlsx';
  sqlquery             varchar2(32767);
  ctxid                excelgen.ctxhandle;
begin
  sqlquery := 'select vales_consumo as "SHOPPING CARD S/", count(*) as cantidad, sum(vales_consumo) as "IMPORTE TOTAL S/"
                  from vw_politica_canasta
                 group by vales_consumo
                 order by vales_consumo';
  ctxid := excelgen.createcontext();

  -- add resumen sheet
  excelgen.addsheetfromquery(ctxid, 'resumen', sqlquery);
  excelgen.setheader(ctxid, 'resumen', p_autofilter => true);
  excelgen.settableformat(ctxid, 'resumen', 'TableStyleLight2');

  -- add detalle sheet
  excelgen.addsheetfromquery(ctxid, 'detalle', 'select * from vw_politica_canasta');
  excelgen.setheader(ctxid, 'detalle', p_autofilter => true);
  excelgen.settableformat(ctxid, 'detalle', 'TableStyleLight2');
  excelgen.setdateformat(ctxid, 'dd/mm/yyyy');

  excelgen.createfile(ctxid, c_directory, c_filename);
  excelgen.closecontext(ctxid);
end;
