class CreateRequests < ActiveRecord::Migration
  def change
  	add_column :projects, :status, :int, :default => 0, :null => false
  	add_column :project_instances, :status, :int, :default => 0, :null => false
    create_table :requests do |t|
    	t.belongs_to :project
    	t.belongs_to :project_instance
    	t.belongs_to :user
    	t.integer :status, :default => 0, :null => false
      t.string :message
      t.timestamps null: false
    end
  end
end
