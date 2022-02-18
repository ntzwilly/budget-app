class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.string :name
      t.integer :amount
      t.references :author, references: :users, null: false, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end
