class AddCidadeBairroColumnToImovels < ActiveRecord::Migration
  def self.up
    add_column :imovels, :cidade, :string
    add_column :imovels, :bairro, :string
  end

  def self.down
    remove_column :imovels, :bairro
    remove_column :imovels, :cidade
  end
end
