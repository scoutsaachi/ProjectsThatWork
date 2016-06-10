class TagsProjectInstances < ActiveRecord::Migration
  def change
  	create_table :tags_project_instances do |t|
    t.integer :tag_id
    t.integer :project_instance_id
    end
  end
end
