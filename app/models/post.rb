class Post < ActiveRecord::Base
   has_many :comentarios
   validates :titulo, :presence => true, :length => { :minimum => 10 }
   validates :conteudo, :presence => true
end
