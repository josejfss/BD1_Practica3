select*
from (select count(*) Pais from pais),
    (select count(*) Vendedor from Vendedor),
    (select count(*) Categoria from Categoria),
    (select count(*) Cliente from Cliente),
    (select count(*) Orden from Orden),
    (select count(*) Producto from Producto);