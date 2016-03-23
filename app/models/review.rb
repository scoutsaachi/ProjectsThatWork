class Review < ActiveRecord::Base
	actable
	belongs_to :project
	belongs_to :project_instance
	after_create :update_rating_aggregates

	def new_moving_avg(orig_avg, new_num, n)
		return orig_avg + (new_num - orig_avg).to_f/n.to_f
	end

	def update_moving_avg(orig_avg, old_num, new_num, n)
		return orig_avg + (new_num - old_num).to_f/n.to_f	
	end

	def update_rating_aggregates
		project_instance = self.project_instance
		if project_instance
			orig_avg = project_instance.rating_aggregate
			if orig_avg == nil
				orig_avg = 0
			end
			new_num = self.rating
			n = project_instance.reviews.count
			new_pi_aggregate = new_moving_avg(orig_avg, new_num, n)
			project_instance.rating_aggregate = new_pi_aggregate
			project_instance.save
			project = self.project
			if project
				old_num = orig_avg
				orig_avg = project.rating_aggregate
				if orig_avg == nil
					orig_avg = 0
				end
				new_num = new_pi_aggregate
				n = project.project_instances.count
				new_p_aggregate = update_moving_avg(orig_avg, old_num, new_num, n)
				project.rating_aggregate = new_p_aggregate
				project.save
			end 
		end
	end
end
