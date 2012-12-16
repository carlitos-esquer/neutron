require './perfil'
require './blog'
#Clase que define un usuario de nuestros Blogs
#Clase Original que ya no se utiliza
class Usuario
  attr_accessor :cuenta,:email,:perfil,:blogs
  def initialize cuenta,email
	@cuenta = cuenta
	@email = email
  end
  def blog(id)
	index = @blogs.index do |b|
		b.id == id
	end
	blog = index.nil? ? nil : blogs[index]
	return blog
  end
end
