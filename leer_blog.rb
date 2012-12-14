require 'pstore'
require './usuario'
blogs = PStore.new "blogs2.pstore"
blog = nil
puts "Leyendo los blogs"
blogs.transaction do |u|
   u.roots.each do |key|
    puts "*** Los blogs de #{u[key].cuenta} ***"
    puts "-------------- * ----------"
    u[key].blogs.each do |b|
        puts "---  Blog: #{b.id} - #{b.titulo} ---"
        b.articulos.each do |a|
			puts a.id
			puts a.titulo
			puts a.contenido
			puts
		end
		puts
		puts "---------- * -----------"
	end
	puts
   end
end
