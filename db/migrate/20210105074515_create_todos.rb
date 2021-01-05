class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.datetime :complete_time
      t.text :tags
      t.boolean :completed
      t.datetime :due_time

      t.timestamps
    end
  end
end
