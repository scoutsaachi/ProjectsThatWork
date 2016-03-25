class CreateStudentReviews < ActiveRecord::Migration
  def change
    create_table :student_reviews do |t|
      t.integer :learning_score
      t.integer :participate_in_future_projects
      t.string :participants
      t.integer :planning_score
      t.string :gender
      t.timestamps null: false
    end
  end
end
