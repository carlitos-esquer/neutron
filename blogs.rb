require 'pstore'
require 'blog'
datos = PStore.new "blog.pstore"
usuario = Usuario.new "carlitos","carlitos@gmail.com"
blog = Blog.new usuario
blog.titulo = "El blog de carlitos"
blog.estilo = "simple"
articulo = Articulo.new "El Programador",1
articulo.contenido = "Este es el contenido simple del Articulo 1"
blog.articulo = articulo
datos.transaction do |d|
  d[blog.usuario.nombre] = blog
end
