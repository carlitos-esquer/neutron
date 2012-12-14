require './articulo'
#Clase que define un Blog

class Blog
	attr_accessor :id,:titulo,:estilo,:articulos
  def initialize id,titulo
	@id = id
	@titulo = titulo
  end
end
