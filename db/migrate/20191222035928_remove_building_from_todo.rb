class RemoveBuildingFromTodo < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :importance, :string, null: false
  end
end
