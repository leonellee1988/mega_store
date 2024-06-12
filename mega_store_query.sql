/*

Consulta que muestra:

vta.numero_factura,
vta.fecha_factura,
pd.nombre_producto,
fm.nombre_familia,
vta.cantidad_factura,
vta.subtotal_factura,
vn.nombre_vendedor

En general...

*/

SELECT
vta.numero_factura,
vta.fecha_factura,
pd.nombre_producto,
fm.nombre_familia,
vta.cantidad_factura,
(pd.costo_producto * (1 + pd.margen_producto)) * vta.cantidad_factura  AS subtotal_factura,
vn.nombre_vendedor
FROM
ventas_diarias vta
INNER JOIN
producto pd ON vta.codigo_producto = pd.codigo_producto
INNER JOIN
familia fm ON pd.codigo_familia = fm.codigo_familia
INNER JOIN
vendedor vn ON vta.codigo_vendedor = vn.codigo_vendedor;

SELECT * FROM producto;

/*

Revisión de la codificación utilizada en nuestra base de datos

*/

SHOW server_encoding;