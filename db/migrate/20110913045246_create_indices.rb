class CreateIndices < ActiveRecord::Migration
  def self.up
    create_table :indices do |t|
      t.string :endereco
      t.float :latitude
      t.float :longitude
      t.integer :numqt
      t.integer :valmed
      t.integer :valm2med

      t.timestamps
    end
  end

  def self.down
    drop_table :indices
  end
end
