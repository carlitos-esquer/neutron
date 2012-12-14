#Clase que define un artìculo escrito en este Blog

class Articulo
  attr_accessor :id,:titulo,:contenido
  def initialize id,titulo
    @id = id
    @titulo = titulo
    @contenido = "Articulo nuevo..."
  end
end
