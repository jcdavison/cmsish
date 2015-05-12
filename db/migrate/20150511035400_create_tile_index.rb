class CreateTileIndex < ActiveRecord::Migration
  def change
    create_table :tile_indices do |t|
      t.integer :display_id
      t.integer :tile_id
      t.integer :tile_index
      t.timestamps null: false
    end
  end
end
