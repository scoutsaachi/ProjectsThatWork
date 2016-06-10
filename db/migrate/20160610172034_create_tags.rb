class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.boolean :approved
      t.timestamps null: false
    end
  end
end
