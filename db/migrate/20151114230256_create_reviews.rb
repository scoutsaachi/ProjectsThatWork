class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.actable
      t.string :review_text
      t.integer :rating
      t.integer :feasibility
      t.timestamps null: false
      t.integer :project_id
      t.integer :project_instance_id
    end
  end
end
