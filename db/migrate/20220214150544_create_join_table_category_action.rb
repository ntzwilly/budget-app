class CreateJoinTableCategoryAction < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :actions do |t|
      t.index [:category_id, :action_id]
    end
  end
end
