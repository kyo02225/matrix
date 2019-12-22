class AddColumnTodos < ActiveRecord::Migration[5.2]
  def change
    add_reference :todos, :user, foreign_key: true
    add_reference :todos, :project, foreign_key: true
    add_reference :todos, :context, foreign_key: true
  end
end
