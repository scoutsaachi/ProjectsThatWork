class CreateProjectInstances < ActiveRecord::Migration
  def change
    create_table :project_instances do |t|
    	t.integer :project_id
        t.integer :user_id
    	t.string :school
    	t.string :town
    	t.string :course
    	t.string :grade_level
    	t.integer :number_of_students
        t.integer :duration
        t.string :duration_notes
        t.string :project_notes
    	t.string :materials_and_costs
    	t.string :learning_goals
    	t.boolean :community_participation
    	t.string :community_partners
    	t.string :steps
    	t.string :preparation
        t.string :other_preparation
    	t.string :reflection_activities
        t.string :other_reflection_activities
        t.string :newTags

      t.timestamps null: false
    end
  end
end
