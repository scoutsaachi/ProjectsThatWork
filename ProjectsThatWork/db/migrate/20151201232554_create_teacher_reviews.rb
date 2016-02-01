class CreateTeacherReviews < ActiveRecord::Migration
  def change
    create_table :teacher_reviews do |t|
    	t.integer :learning_effectiveness
      t.timestamps null: false
    end
  end
end
