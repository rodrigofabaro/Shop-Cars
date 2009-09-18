class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.string :mark
      t.string :model
      t.integer :year
      t.string :fuel
      t.string :color
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :cars
  end
end

