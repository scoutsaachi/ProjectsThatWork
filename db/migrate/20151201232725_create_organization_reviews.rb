class CreateOrganizationReviews < ActiveRecord::Migration
  def change
    create_table :organization_reviews do |t|
      t.integer :impact
      t.integer :participate_in_future_projects
      t.timestamps null: false
    end
  end
end
