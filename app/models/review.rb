class Review < ActiveRecord::Base
	actable
	belongs_to :project
	belongs_to :project_instance
	after_create :update_rating_aggregates

	def update_aggregate(attr_name, new_num, pi)
		n = pi.reviews.where("#{attr_name} is not NULL").count
		RatingAggregate.add_value(attr_name, pi, new_num, n)
	end

	def update_rating_aggregates
		attributes = ["rating", "feasibility"]
		pi = self.project_instance
		r = self
		for attr_name in attributes
			if r[attr_name] != nil
				update_aggregate(attr_name, r[attr_name], pi)
			end
		end
	end
end
