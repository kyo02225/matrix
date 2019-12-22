class RemoveBuildingFromTodo < ActiveRecord::Migration[5.2]
  def change
    remove_column :todos, :building, :string
    remove_column :todos, :priority, :string
    add_column :todos, :importance, :string
  end
end
