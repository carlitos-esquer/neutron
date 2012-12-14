require 'pstore'
require './usuario'
#Modificado de la version 1 para permitir que el Usuario tenga Blogs y no al contrario
#de manera que la estructura empieza en Usuario-Blogs-Blog-Articulos-Articulo
blogs = PStore.new "blogs2.pstore"
usuario = nil
blogs.transaction do |b|
	usuario = b["carlitos2"]
end
(2..64).each do |i|
	articulo = Articulo.new i,"El Blogger #{i}"
	articulo.contenido = "Contenido del Articulo #{i} del Blogger"
	usuario.blogs.first.articulos << articulo
end
puts "Actualizando el Blog..."
puts usuario.blogs.first.titulo
blogs.transaction do |b|
  b["carlitos2"] = usuario
end
puts "Blog Actualizado..."
