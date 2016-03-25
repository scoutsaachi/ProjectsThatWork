class Project < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :project_instances
  has_many :reviews
  has_one :rating_aggregate
  after_create :create_aggregate

  def create_aggregate
  	RatingAggregate.create(project_id: id)
  end
end
