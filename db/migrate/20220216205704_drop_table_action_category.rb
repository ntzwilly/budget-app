class DropTableActionCategory < ActiveRecord::Migration[7.0]
  def change
    drop_table :actions_categories
  end
end
