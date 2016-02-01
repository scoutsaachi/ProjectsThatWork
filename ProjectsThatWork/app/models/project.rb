class Project < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :project_instances
  has_many :reviews
end
