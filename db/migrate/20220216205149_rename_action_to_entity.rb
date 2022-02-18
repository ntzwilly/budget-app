class RenameActionToEntity < ActiveRecord::Migration[7.0]
  def change
    rename_table :actions, :entities
  end
end
