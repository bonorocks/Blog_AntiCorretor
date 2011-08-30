class CreateImovels < ActiveRecord::Migration
  def self.up
    create_table :imovels do |t|
      t.string :cidade
      t.string :bairro
      t.text :local
      t.integer :numqt
      t.integer :numst
      t.integer :numgar
      t.integer :area
      t.integer :valor
      t.integer :valm2
      t.date :data
      t.integer :codigo

      t.timestamps
    end
  end

  def self.down
    drop_table :imovels
  end
end
