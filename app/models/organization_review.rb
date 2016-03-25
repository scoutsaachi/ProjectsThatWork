class OrganizationReview < ActiveRecord::Base
	acts_as :review
	after_create :update_student_aggregates

	def update_org_aggregate(attr_name, new_num, pi)
		pi_id = pi.id
		n = OrganizationReview.where(project_instance_id: pi_id).where("#{attr_name} is not NULL").count
		if attr_name = "participate_in_future_projects"
			attr_name = "org_future_projects"
		end
		RatingAggregate.add_value(attr_name, pi, new_num, n)
	end

	def update_org_aggregates
		attributes = ["impact", "participate_in_future_projects"]
		pi = self.project_instance
		r = self
		for attr_name in attributes
			if r[attr_name] != nil
				update_student_aggregate(attr_name, r[attr_name], pi)
			end
		end
	end
end
