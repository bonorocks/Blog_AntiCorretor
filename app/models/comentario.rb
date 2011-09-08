class Comentario < ActiveRecord::Base
  belongs_to :post
  validates :autor, :presence => true, :length => { :minimum => 3 }
  validates :conteudo, :presence => true
end
