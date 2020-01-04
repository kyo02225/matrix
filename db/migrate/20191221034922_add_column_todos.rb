class AddColumnTodos < ActiveRecord::Migration[5.2]
  def change
    add_reference :todos, :user, foreign_key: true, null: false
  end
end
