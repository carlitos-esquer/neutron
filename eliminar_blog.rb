require 'pstore'
require './blog'
blogs = PStore.new "blogs.pstore"
blog = nil
blogs.transaction do |b|
	blog = b["carlitos255"]
end
puts "Eliminando Articulos del Blog..."
puts blog.titulo
blog.articulos = []
blogs.transaction do |b|
  b["carlitos255"] = blog
end
puts "Blog Actualizado..."
