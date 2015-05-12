class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.string :content
      t.string :href

      t.timestamps null: false
    end
  end
end
