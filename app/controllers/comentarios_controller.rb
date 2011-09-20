class ComentariosController < ApplicationController
  
   # Requisicao de autenticacao
   #before_filter :authenticate, :except => [:create]
   
   def create
    @post = Post.find(params[:post_id])
    @comentario = @post.comentarios.create(params[:comentario])
    redirect_to post_path(@post)
   end
   def destroy
    @post = Post.find(params[:post_id])
    @comentario = @post.comentarios.find(params[:id])
    @comentario.destroy
    redirect_to post_path(@post)
  end
  
   #Adicionando codigo par autenticação básica
  
   private

   def authenticate
      authenticate_or_request_with_http_basic do |name, password|
         name =="corretor" && password == "anticorretor"
      end
    end
    
end