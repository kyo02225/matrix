class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string  :title
      t.string  :status
      t.text    :content
      t.string  :priority
      t.string  :urgency
      t.string  :building
      t.timestamps
    end
  end
end
