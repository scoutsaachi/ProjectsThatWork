class TeacherReview < ActiveRecord::Base
	acts_as :review
	after_create :update_teacher_aggregates

	def update_teacher_aggregate(attr_name, new_num, pi)
		pi_id = pi.id
		n = TeacherReview.where(project_instance_id: pi_id).where("#{attr_name} is not NULL").count
		RatingAggregate.add_value(attr_name, pi, new_num, n)
	end

	def update_teacher_aggregates
		attributes = ["learning_effectiveness"]
		pi = self.project_instance
		r = self
		for attr_name in attributes
			if r[attr_name] != nil
				update_teacher_aggregate(attr_name, r[attr_name], pi)
			end
		end
	end
end
