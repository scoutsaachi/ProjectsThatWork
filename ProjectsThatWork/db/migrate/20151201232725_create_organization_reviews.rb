class CreateOrganizationReviews < ActiveRecord::Migration
  def change
    create_table :organization_reviews do |t|
      t.string :organization_type
      t.timestamps null: false
    end
  end
end
