class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.references :todo_list, index: true, foreign_key: true
      t.string :description, null: false
      t.boolean :completed, null: false, default: false

      t.timestamps null: false
    end
  end
end
