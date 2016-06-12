class Project < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :project_instances
  has_many :reviews
  has_one :rating_aggregate
  has_many :requests
  after_create :create_aggregate
  accepts_nested_attributes_for :project_instances

  enum status: [:pending, :approved, :denied]

  def create_aggregate
  	RatingAggregate.create(project_id: id)
  end

  def approvedInstances
  	return self.project_instances.approved
  end

  def numInstancesApproved
  	approvedInstances.size
  end
end
