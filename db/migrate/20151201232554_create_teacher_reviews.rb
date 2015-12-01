class CreateTeacherReviews < ActiveRecord::Migration
  def change
    create_table :teacher_reviews do |t|
      t.string :school
      t.timestamps null: false
    end
  end
end
