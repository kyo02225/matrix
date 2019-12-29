class CreateContextProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :context_projects do |t|
      t.references :context, foreign_key: true
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
