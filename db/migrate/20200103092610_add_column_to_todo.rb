class AddColumnToTodo < ActiveRecord::Migration[5.2]
  def change
    remove_column :todos, :deadline, :datetime
    add_column :todos, :deadline, :date
  end
end
