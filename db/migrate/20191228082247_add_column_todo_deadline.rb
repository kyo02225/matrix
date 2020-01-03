class AddColumnTodoDeadline < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :deadline, :datetime, null: false
  end
end
