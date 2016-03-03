class AddRatingAggregateToProjectInstances < ActiveRecord::Migration
  def change
  	add_column :project_instances, :rating_aggregate, :int
  	add_column :projects, :rating_aggregate, :int
  end
end
