class Request < ActiveRecord::Base
	belongs_to :project
	belongs_to :project_instance
	belongs_to :user

	enum status: [:pending, :approved, :denied]

	def approve_request
		self.status = :approved
		self.save
		p = self.project
		if p != nil
			p.status = :approved
			p.save
		end
		pi = self.project_instance
		if pi != nil
			pi.status = :approved
			pi.save
		end
	end

	def deny_request(msg)
		self.status = :denied
		self.message = msg
		self.save
		p = self.project
		if p != nil
			p.status = :denied
			p.save
		end
		pi = self.project_instance
		if pi != nil
			pi.status = :denied
			pi.save
		end
	end

	def self.new_request(user_id, project_id = nil, project_instance_id = nil)
		Request.create(user_id: user_id, project_id: project_id, project_instance_id: project_instance_id)
	end

end
