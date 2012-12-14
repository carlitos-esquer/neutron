#!/usr/bin/ruby 
require 'pstore'
require 'slim'
require 'sinatra'
require 'markaby/sinatra'
require './usuario'

blogs = PStore.new "blogs2.pstore"

helpers do
	def blogus
		slim :index
	end
	def noticias params
		"Bienvenido a las noticias de #{params[:id]} !!"
	end
	def administracion
	end
end

get '/' do
	slim :index
end

get '/:id' do
    @usuario = nil
    blogs.transaction do |b|
      @usuario = b[params[:id]]
    end
    return slim :no_user if @usuario.nil?
    slim :usuario
end

get '/:id/blogs' do
    usuario = nil
    blogs.transaction do |b|
      usuario = b[params[:id]]
    end
    return slim :no_user if usuario.nil?
    @blogs = usuario.blogs
    return slim :no_blog if @blogs.nil? or @blogs.empty?
    slim :blogs
end

get '/:id/blogs/new' do
	usuario=nil
	blogs.transaction do |b|
      usuario = b[params[:id]]
    end
    return slim :no_user if usuario.nil?
	slim :blog_new
end

post '/:id/blogs/new' do
	usuario=nil
	blogs.transaction do |b|
      usuario = b[params[:id]]
    end
    return slim :no_user if usuario.nil?
    blog = Blog.new params[:nombre], params[:titulo]
    blog.estilo  = "simple"
	usuario.blogs << blog
	blogs.transaction do |b|
		b[usuario.cuenta] = usuario
	end
	redirect "/#{params[:id]}/blogs"
end

get '/:id/:blog/edit' do
	slim :blog_edit
end

post '/:id/:blog/edit' do
	"<h2>El blog se ha actualizado...<h2>"
end

get '/:id/news' do
	noticias params
end

get '/:id/admin' do
	#@params = params
	mab :admin
end

get '/:id/:blog' do
    usuario = nil
    blogs.transaction do |b|
      usuario = b[params[:id]]
    end
    @titulo = ""
    @articulos = ""
    return slim :no_user if usuario.nil?
    blog = usuario.blog(params[:blog])
    return slim :no_blog if blog.nil?
    @titulo = blog.titulo
    return slim :no_post if blog.articulos.nil? || blog.articulos.empty?
    @articulos = blog.articulos
    slim :articulos
end

