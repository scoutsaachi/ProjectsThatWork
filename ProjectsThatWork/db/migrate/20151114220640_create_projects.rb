class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :course_subject
      t.string :description
      t.string :expected_difficulty
      t.integer :duration
      t.timestamps null: false
    end
  end
end