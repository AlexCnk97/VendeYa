select 
b.nombre
from categorias a,
subcategorias b
where(a.idCategoria = b.idCategoria) and
a.nombre like 'Vehiculos'
limit 5




