class CreateStudentReviews < ActiveRecord::Migration
  def change
    create_table :student_reviews do |t|
	  t.string :school
      t.timestamps null: false
    end
  end
end
