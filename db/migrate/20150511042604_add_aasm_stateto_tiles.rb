class AddAasmStatetoTiles < ActiveRecord::Migration
  def change
    add_column :tiles, :aasm_state, :string
  end
end
