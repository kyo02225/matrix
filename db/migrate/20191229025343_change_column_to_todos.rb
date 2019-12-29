class ChangeColumnToTodos < ActiveRecord::Migration[5.2]
  def change
    change_column :todos, :deadline, :date
  end
end
