require 'pstore'
require './usuario'
blogs = PStore.new "blogs2.pstore"
usuario = Usuario.new "carlitos2","carlitos2@gmail.com"
perfil = Perfil.new "Carlitos 2"
usuario.perfil = perfil
blog = Blog.new "blogger","El blog de Carlitos 2"
blog.estilo = "simple"
articulo = Articulo.new 1,"El Blogger 2"
articulo.contenido = "Contenido del Articulo 1 del Blogger"
blog.articulos = []
blog.articulos << articulo
puts "Creando el Blog..."
puts blog.titulo
usuario.blogs = []
usuario.blogs << blog
blogs.transaction do |b|
  b[usuario.cuenta] = usuario
end
puts "Blog terminado..."
