class TagsProjectInstances < ActiveRecord::Migration
  def change
  	create_table :project_instances_tags do |t|
  	t.integer :project_instance_id
    t.integer :tag_id
    end
  end
end
