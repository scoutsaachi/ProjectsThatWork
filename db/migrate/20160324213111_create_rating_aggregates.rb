class CreateRatingAggregates < ActiveRecord::Migration
  def change
  	remove_column :project_instances, :rating_aggregate, :int
  	remove_column :projects, :rating_aggregate, :int
    create_table :rating_aggregates do |t|
    	t.integer :project_id
      t.integer :project_instance_id
      t.float :rating
      t.float :feasibility
      t.float :learning_score
      t.float :learning_effectiveness
      t.float :students_future_projects
      t.float :planning_score
      t.float :org_future_projects
      t.float :impact
      t.timestamps null: false
    end
  end
end
