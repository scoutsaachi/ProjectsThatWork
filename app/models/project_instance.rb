class ProjectInstance < ActiveRecord::Base
	has_many :reviews
	has_many :requests
	belongs_to :user
	belongs_to :project
	has_one :rating_aggregate
	after_create :create_aggregate
	has_and_belongs_to_many :tags

	enum status: [:pending, :approved, :denied]

  def create_aggregate
  	RatingAggregate.create(project_instance_id: id)
  end
end
