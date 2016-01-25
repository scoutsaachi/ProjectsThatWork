class UpdateProjects < ActiveRecord::Migration
  def change
        # Removing unnecessary columns
        remove_column :projects, :difficulty, :float

        # Adding new columns
        add_column :projects, :school, :string
        add_column :projects, :town, :string
        add_column :projects, :course, :string
        add_column :projects, :grade_level, :int

        add_column :projects, :project_goal, :string
        add_column :projects, :project_activity, :string
        add_column :projects, :project_recipient, :string

        add_column :projects, :num_students, :int
        add_column :projects, :activity, :string

        add_column :projects, :start_date, :datetime
        add_column :projects, :end_date, :datetime
        add_column :projects, :num_days, :int

        # Please Note: The following columns are strings
        # that must be parsed via a specified delimiter
        # in order to extract its individual components
        add_column :projects, :materials_and_costs, :string
        add_column :projects, :learning_goals, :string
        add_column :projects, :community_partners, :string
        add_column :projects, :steps, :string

  end
end
