class CreateRequests < ActiveRecord::Migration
  def change
  	add_column :projects, :approved, :boolean, :default => false, :null => false
  	add_column :project_instances, :approved, :boolean, :default => false, :null => false
    create_table :requests do |t|
    	t.belongs_to :project
    	t.belongs_to :project_instance
    	t.belongs_to :user
    	t.integer :status, :default => 0, :null => false
      t.timestamps null: false
    end
  end
end
