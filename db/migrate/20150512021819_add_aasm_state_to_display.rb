class AddAasmStateToDisplay < ActiveRecord::Migration
  def change
    add_column :displays, :aasm_state, :string
  end
end
