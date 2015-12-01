class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.actable
      t.integer :project_id
      t.integer :user_id
      t.string :review_text
      t.integer :rating
      t.timestamps null: false
    end
  end
end
