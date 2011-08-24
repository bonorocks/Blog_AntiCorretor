class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.string :autor
      t.text :conteudo
      t.references :post

      t.timestamps
    end
  end

  def self.down
    drop_table :comentarios
  end
end
