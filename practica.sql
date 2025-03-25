--crea una vista que muestre para cada comercio la facturación total, 
--el número de clientes y el texto "Top" 
--si su facturación es superior a la media, o una cadena vacía en caso contrario

CREATE VIEW  vista as 
SELECT comercio_id , SUM(DISTINCTfactura_id), FROM item_venta 
JOIN factura USING(factura_id) 
JOIN cliente USING(cliente_id) GROUP BY comercio_id;