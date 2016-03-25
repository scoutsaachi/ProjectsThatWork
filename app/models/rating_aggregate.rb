class RatingAggregate < ActiveRecord::Base
	validate :project_parent_present
	belongs_to :project_instance
	belongs_to :project

	def project_parent_present
		return (project_id != nil) ^ (project_instance_id != nil)
	end

	def self.new_moving_avg(orig_avg, new_num, n)
		return orig_avg + (new_num - orig_avg).to_f/n.to_f
	end

	#orig_avg: old average
	#old_num: old number that is about to be updated
	#new_num: new number
	#n: total number of elements
	def self.update_moving_avg(orig_avg, old_num, new_num, n)
		return orig_avg + (new_num - old_num).to_f/n.to_f	
	end

	#attr_name should be in string from ie "rating"
	def self.add_value(attr_name, project_instance, new_num, n)
		if project_instance == nil then return false end
		project = project_instance.project
		if project == nil then return false end
		rating_aggregate = project_instance.rating_aggregate
		if rating_aggregate == nil then return false end
		old_avg = rating_aggregate[attr_name]
		if old_avg == nil then old_avg = 0 end
		new_pi_avg = new_moving_avg(old_avg, new_num, n)
		rating_aggregate[attr_name] = new_pi_avg
		rating_aggregate.save
		update_value(attr_name, project, old_avg, new_pi_avg)
	end

	def self.update_value(attr_name, project, old_value, new_value)
		instances = project.project_instances
		rating_aggregate = project.rating_aggregate
		n = instances.includes(:rating_aggregate).where("rating_aggregates.#{attr_name} is not NULL").references(:rating_aggregates).count
		orig_avg = rating_aggregate[attr_name]
		if orig_avg == nil then orig_avg = 0 end
		rating_aggregate[attr_name] = update_moving_avg(orig_avg, old_value, new_value, n)
		rating_aggregate.save
	end
end
