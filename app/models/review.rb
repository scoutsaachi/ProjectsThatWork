class Review < ActiveRecord::Base
	actable
	belongs_to :project
	belongs_to :project_instance
end
