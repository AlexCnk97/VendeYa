select 
count(b.idCategoria) as 'NSubCategorias',
a.nombre
from categorias a,
subcategorias b
where(a.idCategoria = b.idCategoria)
group by a.idCategoria
order by NSubCategorias asc
;