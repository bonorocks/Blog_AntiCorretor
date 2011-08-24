class CreateImovels < ActiveRecord::Migration
  def self.up
    create_table :imovels do |t|
      t.text :local
      t.string :area
      t.string :valor
      t.string :valm2
      t.date :data
      t.integer :codigo

      t.timestamps
    end
  end

  def self.down
    drop_table :imovels
  end
end
