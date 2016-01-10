class UpdateReviewTypes < ActiveRecord::Migration
  def change
    add_column :reviews, :feasibility, :integer

    remove_column :student_reviews, :school, :string
    add_column :student_reviews, :learning_score, :integer
    add_column :student_reviews, :participate_in_future_projects, :integer
    add_column :student_reviews, :participants, :string
    add_column :student_reviews, :planning_score, :integer
    add_column :student_reviews, :gender, :string

    remove_column :teacher_reviews, :school, :string
    add_column :teacher_reviews, :course_name, :string
    add_column :teacher_reviews, :grade_level, :integer
    add_column :teacher_reviews, :number_of_students, :integer
    add_column :teacher_reviews, :community_participation, :boolean
    add_column :teacher_reviews, :description, :string
    add_column :teacher_reviews, :duration, :integer
    add_column :teacher_reviews, :preparation, :string
    add_column :teacher_reviews, :learning_standards, :string
    add_column :teacher_reviews, :cost, :string
    add_column :teacher_reviews, :reflection, :string
    add_column :teacher_reviews, :learning_effectiveness, :integer

    remove_column :organization_reviews, :organization_type, :string
    add_column :organization_reviews, :impact, :integer
    add_column :organization_reviews, :participate_in_future_projects, :integer
  end
end
