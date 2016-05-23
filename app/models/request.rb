class Request < ActiveRecord::Base
	belongs_to :project
	belongs_to :project_instance
	belongs_to :user

	enum status: [:pending, :approved, :denied]

	def approve_request
		self.status = :approved
	end

	def deny_request
		self.status = :denied
	end

	def self.new_request(user_id, project_id = nil, project_instance_id = nil)
		Request.create(user_id: user_id, project_id: project_id, project_instance_id: project_instance_id)
	end

end
