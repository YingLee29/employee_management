class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :information
      t.date :deadline
      t.integer :project_type, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
