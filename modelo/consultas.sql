SELECT * FROM productos;
alter table productos add column descripcion longtext not null after NombProd;
update productos 
set descripcion = 'Cocina en diferentes tipos de materiales, marmol, aluminio, mdf, herrajes... '
where idtipoprod= 1;
