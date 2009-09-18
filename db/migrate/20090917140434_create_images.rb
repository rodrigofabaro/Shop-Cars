class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.text :description
      t.references  :imageble, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end

